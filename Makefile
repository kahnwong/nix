##############
# SETUP
##############
common:
	./scripts/common/01_setup.sh
	./scripts/common/02_install_misc.sh
	./scripts/common/03_add_fish_completions.sh
	cat ./post_installation_message.txt

mac:
	./scripts/mac/01_setup_mac.sh
	./scripts/mac/02_install_mac.sh
	./scripts/vscode/setup.sh

linux-desktop:
	./scripts/linux-desktop/01_setup_linux.sh
	./scripts/linux-desktop/02_install_linux.sh
	./scripts/vscode/setup.sh

##############
# UTILS
##############
decrypt-credentials:
	./scripts/decrypt.sh

# BREW
update-brew:
	brew upgrade --greedy
	brew autoremove
	brew cleanup

# NIX
update:
	./scripts/update.sh
	./scripts/common/03_add_fish_completions.sh

apply:
	./scripts/apply.sh
