##############
# SETUP
##############
common:
	./scripts/common/01_setup.sh
	./scripts/common/02_add_fish_completions.sh

common-dev:
	./scripts/common-dev/01_setup.sh
	./scripts/common-dev/02_install_misc.sh

mac:
	./scripts/mac/01_setup_mac.sh
	./scripts/mac/02_install_mac.sh
# 	./scripts/vscode/setup.sh

linux-desktop:
	./scripts/linux-desktop/01_setup_linux.sh
	./scripts/linux-desktop/02_install_linux.sh
	./scripts/linux-desktop/03_setup_app_icons.sh
	./scripts/linux-desktop/04_setup_shortcuts.sh
	./scripts/linux-desktop/05_setup_startups.sh
	./scripts/linux-desktop/06_install_docker.sh
	./scripts/linux-desktop/07_install_mullvad.sh
	./scripts/linux-desktop/08_install_sourcegit.sh
	./scripts/linux-desktop/09_install_ghostty.sh
	./scripts/linux-desktop/10_install_foobar2000.sh
	./scripts/linux-desktop/11_install_ydotool.sh
	./scripts/linux-desktop/12_install_tlp.sh
# 	./scripts/vscode/setup.sh

##############
# UTILS
##############
decrypt-credentials:
	./scripts/decrypt.sh

update:
	./scripts/update.sh

# NIX
apply:
	./scripts/apply.sh

# SSH
ssh-keys-backup:
	./scripts/ssh-keys-backup.sh

ssh-keys-restore:
	./scripts/ssh-keys-restore.sh

migrate:
	./scripts/migrate.sh
