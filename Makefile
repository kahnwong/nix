setup:
	./01_setup.sh
	./02_install.sh
	$$HOME/.nix-profile/bin/fish 03_install_fish_plugins.sh
	./04_install_vscode_extensions.sh
	./05_install_pyenv.sh
mac-extras:
	./06_install_ghcli_extentions
	./07_install_mac_extras.sh
