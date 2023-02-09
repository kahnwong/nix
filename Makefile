common:
	./setup.sh
	./install_nix.sh
	./install_misc.sh
	cat ./post_installation_message.txt

mac:
	./setup_mac.sh
	./install_mac.sh
	./setup_vscode.sh

linux:
	./setup_linux.sh
	./install_linux.sh
	./setup_vscode.sh
