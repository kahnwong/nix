# Firefox

## Fonts

Use `waree` for Thai sans-serif.

## Containers

```js
// const icons = ["fingerprint", "briefcase", "dollar", "cart", "vacation", "gift", "food", "fruit", "pet", "tree", "chill", "circle"]
// if (url.hostname === "gemini.google.com") return { name: "Workspace", icon: "circle", color: "blue" };

const workspaceHosts = ["gemini.google.com", "meet.google.com", "console.cloud.google.com", "notebooklm.google.com", "gmail.com", "drive.google.com", "docs.google.com", "sheets.google.com", "jules.google", "jules.google.com"];
if (workspaceHosts.includes(url.hostname)) {
    return {name: "Workspace", icon: "circle", color: "blue"};
}

if (url.hostname === "www.google.com") return {name: "Search", icon: "circle", color: "green"};
if (url.hostname === "www.youtube.com") return {name: "YouTube", icon: "circle", color: "red"};
if (url.hostname === "contacts.google.com") return {name: "Contacts", icon: "circle", color: "purple"};

if (url.hostname === "www.perplexity.ai") return {name: "Perplexity", icon: "circle", color: "blue"};
if (url.hostname === "chatgpt.com") return {name: "ChatGPT", icon: "circle", color: "orange"};
if (url.hostname === "github.com") return null;
```

## Privacy Settings

- Disable Telemetry Settings > Privacy & Security > Firefox Data Collection
- Change Search Engine Settings > Search (Switch to DuckDuckGo or Brave Search)
- Strict Protection Settings > Privacy & Security > Enhanced Tracking Protection (Set to Strict)
- DNS over HTTPS Settings > Privacy & Security > Enable Max Protection

## Set Custom AI Chatbot

For Open WebUI.

Type `about:config` and set value for `browser.ml.chat.provider` as `https://chat.example.com/?model=gemma4-26b&temporary-chat=true`.

## Uset APT for Firefox

```bash
sudo snap remove firefox
cat /etc/apt/preferences.d/firefox-no-snap 2>/dev/null || echo "File doesn't exist yet"
```


```bash
# sudo vi /etc/apt/preferences.d/firefox-no-snap

# Prevent the firefox Snap from being installed via APT redirects
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1
```

```bash
sudo apt remove firefox-snap-package-redirector 2>/dev/null || true

sudo apt update
sudo apt install -y curl gpg

# Create the keyrings directory if it doesn't exist
sudo install -d -m 0755 /etc/apt/keyrings

# Download and install Mozilla's GPG signing key
curl -fsSL https://packages.mozilla.org/apt/repo-signing-key.gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/packages.mozilla.org.asc

# Verify the key fingerprint (should be: 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3)
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | \
    awk '/pub/{getline; gsub(/^ +| +$/, ""); print "Key fingerprint: " $0}'

# Add the Mozilla APT repository
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | \
    sudo tee /etc/apt/sources.list.d/mozilla.list
```

```bash
# sudo vi /etc/apt/preferences.d/mozilla

# Prefer Mozilla's APT repository for Firefox and Thunderbird
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
```

```bash
sudo apt update
sudo apt install firefox
```
