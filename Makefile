##############
# SETUP
##############
common:
	./scripts/common/01-setup.sh
	# ./scripts/common/02-add-fish-completions.sh

common-dev:
	./scripts/common-dev/01-setup.sh
	./scripts/common-dev/02-install-misc.sh
	./scripts/common-dev/03-install-ai-tools.sh

darwin:
	./scripts/darwin/01-setup-mac.sh
	./scripts/darwin/02-install-mac.sh
	./scripts/darwin/03-install-batt.sh
	./scripts/common-dev/setup-ssh-keys.sh
 	# ./scripts/vscode/setup.sh

linux-desktop:
	./scripts/common-dev/setup-ssh-keys.sh
	./scripts/linux/01-setup-linux.sh
	./scripts/linux/02-install-linux.sh
	./scripts/linux/install-chrome.sh
	./scripts/linux/install-docker.sh
	./scripts/linux/install-firefox-nightly.sh
	./scripts/linux/install-ghostty.sh
	./scripts/linux/install-lemonade.sh
	./scripts/linux/install-librewolf.sh
	./scripts/linux/install-mullvad.sh
	./scripts/linux/install-nvtop.sh
	./scripts/linux/install-sourcegit.sh
	./scripts/linux/install-tlp.sh
	./scripts/linux/install-ydotool.sh
	./scripts/linux/install-yubikey-manager.sh
	./scripts/linux/setup-app-shortcuts.sh
	./scripts/linux/setup-flatpak-config.sh
	./scripts/linux/setup-gnome.sh
	./scripts/linux/setup-startups.sh
	# ./scripts/vscode/setup.sh

##############
# UTILS
##############
decrypt-credentials:
	./scripts/common-dev/decrypt.sh

update:
	./scripts/update.sh
update-ai:
	./scripts/common-dev/03-install-ai-tools.sh

migrate:
	./scripts/migrate.sh

# NIX
apply:
	./scripts/apply.sh

# SSH
ssh-keys-backup:
	./scripts/common-dev/setup-ssh-keys.sh backup
ssh-keys-restore:
	./scripts/common-dev/setup-ssh-keys.sh

# LINUX
gnome-backup:
	./scripts/linux/setup-gnome.sh backup
gnome-restore:
	./scripts/linux/setup-gnome.sh
