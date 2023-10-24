##############
# SETUP
##############
common:
	./scripts/common/01_setup.sh
	./scripts/common/02_add_fish_completions.sh
	./scripts/common/03_nvim.sh
	cat ./post_installation_message.txt

common-dev:
	./scripts/common-dev/01_setup.sh
	./scripts/common-dev/02_install_misc.sh

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

apply:
	./scripts/apply.sh
