common:
	./setup.sh
	./install_nix.sh
	./install_misc.sh
	cat ./post_installation_message.txt

mac:
	./setup_brew.sh
	./install_brew.sh
	./setup_vscode.sh

linux:
	# todo add setup apt install/etc
	# add desktop apps via snap/etc
	./setup_vscode.sh
