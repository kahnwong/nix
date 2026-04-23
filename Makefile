##############
# SETUP
##############
common:
	./scripts/common/01-setup.sh
	./scripts/common/02-add-fish-completions.sh

common-dev:
	./scripts/common-dev/01-setup.sh
	./scripts/common-dev/02-install-misc.sh

darwin:
	./scripts/darwin/01-setup-mac.sh
	./scripts/darwin/02-install-mac.sh
	./scripts/darwin/03-install-batt.sh
 	# ./scripts/vscode/setup.sh

linux-desktop:
	./scripts/linux-desktop/01-setup-linux.sh
	./scripts/linux-desktop/02-install-linux.sh
	./scripts/linux-desktop/setup-app-shortcuts.sh
	./scripts/linux-desktop/setup-flatpak-config.sh
	./scripts/linux-desktop/setup-gnome.sh
	./scripts/linux-desktop/install-chrome.sh
	./scripts/linux-desktop/install-docker.sh
	./scripts/linux-desktop/install-firefox-nightly.sh
	./scripts/linux-desktop/install-ghostty.sh
	./scripts/linux-desktop/install-librewolf.sh
	./scripts/linux-desktop/install-mullvad.sh
	./scripts/linux-desktop/install-sourcegit.sh
	./scripts/linux-desktop/install-tlp.sh
	./scripts/linux-desktop/install-ydotool.sh
	./scripts/linux-desktop/install-yubikey-manager.sh
	./scripts/linux-desktop/setup-ssh-keys.sh
	./scripts/linux-desktop/setup-startups.sh
	# ./scripts/vscode/setup.sh

##############
# UTILS
##############
decrypt-credentials:
	./scripts/decrypt.sh

update:
	./scripts/update.sh

migrate:
	./scripts/migrate.sh

# NIX
apply:
	./scripts/apply.sh

# SSH
ssh-keys-backup:
	./scripts/linux-desktop/setup-ssh-keys.sh backup

ssh-keys-restore:
	./scripts/linux-desktop/setup-ssh-keys.sh
