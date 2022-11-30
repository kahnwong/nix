setup:
	./01_setup.sh
	./02_install.sh
	./03_install_vscode_extensions.sh
	./04_install_pyenv.sh
	$$HOME/.nix-profile/bin/fish 05_install_fish_plugins.sh
mac-extras:
	./06_install_mac_extras.sh
