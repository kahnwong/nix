common:
	./src/common/01_setup.sh
	./src/common/02_install_nix.sh
	./src/common/03_install_misc.sh
	cat ./post_installation_message.txt

mac:
	./src/mac/01_setup_mac.sh
	./src/mac/02_install_mac.sh
	./src/vscode/setup.sh

linux:
	./src/linux/01_setup_linux.sh
	./src/linux/02_install_linux.sh
	./src/vscode/setup.sh
