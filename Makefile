common:
	./setup.sh
	./install_nix.sh
	./install_misc.sh
	cat ./post_installation_message.txt

mac:
	./setup_brew.sh
	./install_brew.sh
