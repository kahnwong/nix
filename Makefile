# UTILS
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
