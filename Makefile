common:
	./scripts/common/01_setup.sh
	./scripts/common/02_install_nix.sh
	./scripts/common/03_install_misc.sh
	cat ./post_installation_message.txt

mac:
	./scripts/mac/01_setup_mac.sh
	./scripts/mac/02_install_mac.sh
	./scripts/vscode/setup.sh

linux-desktop:
	./scripts/linux-desktop/01_setup_linux.sh
	./scripts/linux-desktop/02_install_linux.sh
	./scripts/vscode/setup.sh

decrypt-credentials:
	./scripts/decrypt.sh

nix-update:
	nix-channel --update  # equivalent to apt-get update
	home-manager switch
	nix-store --gc  # cleanup garbage collection
