import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { execFile } from "node:child_process";
import { readFileSync } from "node:fs";

const TITLE = process.env.PI_NOTIFY_TITLE || "Pi";
const BODY = process.env.PI_NOTIFY_BODY || "Done — ready for input";

function run(command: string, args: string[], timeout = 3000): Promise<boolean> {
	return new Promise((resolve) => {
		execFile(command, args, { timeout }, (error) => resolve(!error));
	});
}

function notifyOSC777(title: string, body: string): void {
	process.stdout.write(`\x1b]777;notify;${title};${body}\x07`);
}

function notifyOSC99(title: string, body: string): void {
	process.stdout.write(`\x1b]99;i=pi-done:d=0;${title}\x1b\\`);
	process.stdout.write(`\x1b]99;i=pi-done:p=body;${body}\x1b\\`);
}

function fallbackTerminalNotify(title: string, body: string): void {
	if (process.env.KITTY_WINDOW_ID) notifyOSC99(title, body);
	else notifyOSC777(title, body);
}

function isWsl(): boolean {
	if (process.platform !== "linux") return false;
	try {
		return /microsoft|wsl/i.test(readFileSync("/proc/version", "utf8"));
	} catch {
		return false;
	}
}

async function notifyLinux(title: string, body: string): Promise<boolean> {
	return run("notify-send", [title, body, "--app-name=Pi"]);
}

async function notifyMac(title: string, body: string): Promise<boolean> {
	return run("osascript", [
		"-e",
		"on run argv\n" +
			"display notification (item 2 of argv) with title (item 1 of argv)\n" +
			"end run",
		title,
		body,
	]);
}

async function notifyWindows(title: string, body: string): Promise<boolean> {
	const psQuote = (value: string) => `'${value.replace(/'/g, "''")}'`;
	const script = [
		"$type = 'Windows.UI.Notifications'",
		"$mgr = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]",
		"$template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02",
		"$xml = $mgr::GetTemplateContent($template)",
		`$xml.GetElementsByTagName('text')[0].AppendChild($xml.CreateTextNode(${psQuote(title)})) > $null`,
		`$xml.GetElementsByTagName('text')[1].AppendChild($xml.CreateTextNode(${psQuote(body)})) > $null`,
		"$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)",
		"$mgr::CreateToastNotifier('Pi').Show($toast)",
	].join("; ");
	const encoded = Buffer.from(script, "utf16le").toString("base64");
	return run("powershell.exe", ["-NoProfile", "-EncodedCommand", encoded], 5000);
}

async function notify(title: string, body: string): Promise<void> {
	let ok = false;

	if (process.platform === "darwin") ok = await notifyMac(title, body);
	else if (process.platform === "win32" || process.env.WT_SESSION || isWsl()) ok = await notifyWindows(title, body);
	else if (process.platform === "linux") ok = await notifyLinux(title, body);

	if (!ok) fallbackTerminalNotify(title, body);
}

export default function (pi: ExtensionAPI) {
	pi.on("agent_end", async () => {
		await notify(TITLE, BODY);
	});
}
