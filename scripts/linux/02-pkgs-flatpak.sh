#!/bin/bash

### applications
if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt install -y \
			file-roller \
			gnome-tweaks \
			gparted \
			mpv \
			xclip

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf install -y \
			file-roller \
			gnome-tweaks \
			gparted \
			mpv \
			xclip
	fi
fi

flatpak install -y flathub \
	app.freelens.Freelens \
	com.belmoussaoui.Decoder \
	com.github.IsmaelMartinez.teams_for_linux \
	com.github.PintaProject.Pinta \
	com.github.jeromerobert.pdfarranger \
	com.github.qarmin.czkawka \
	com.github.tchx84.Flatseal \
	com.github.zocker_160.SyncThingy \
	com.jeffser.Pigment \
	com.ktechpit.omnidict \
	com.markwyner.ratio \
	com.rafaelmardojai.SharePreview \
	com.ranfdev.DistroShelf \
	com.rustdesk.RustDesk \
	com.transmissionbt.Transmission \
	dev.mufeed.Wordbook \
	io.github.TransmissionRemoteGtk \
	io.github.celluloid_player.Celluloid \
	io.github.ciromattia.kcc \
	io.github.dweymouth.supersonic \
	io.github.flattool.Warehouse \
	io.github.josephmawa.Bella \
	io.github.seadve.Kooha \
	io.github.sigmasd.stimulator \
	io.github.tobagin.Ntfyr \
	io.github.tobagin.karere \
	io.github.v81d.Wattage \
	io.gitlab.adhami3310.Impression \
	io.gitlab.metadatacleaner.metadatacleaner \
	io.kinvolk.Headlamp \
	io.missioncenter.MissionCenter \
	net.puddletag.puddletag \
	one.naiara.Kuychi \
	org.filezillaproject.Filezilla \
	org.fkoehler.KTailctl \
	org.flameshot.Flameshot \
	org.fooyin.fooyin \
	org.freefilesync.FreeFileSync \
	org.gnome.Firmware \
	org.gnome.Logs \
	org.gpodder.gpodder \
	org.jellyfin.JellyfinDesktop \
	org.kde.okular \
	org.mozilla.thunderbird_esr \
	org.telegram.desktop \
	org.tenacityaudio.Tenacity \
	xyz.riothedev.emojify \
	us.zoom.Zoom

# set flameshot permission
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes

# sailfish only
if [[ $(uname -n) == 'sailfish' ]]; then
	flatpak install -y flathub \
		com.heroicgameslauncher.hgl \
		com.valvesoftware.Steam

	flatpak override --user --device=dri --socket=x11 --socket=wayland com.valvesoftware.Steam
	flatpak override --user --talk-name=org.freedesktop.Flatpak com.valvesoftware.Steam
fi

## redfin only
if [[ $(uname -n) == 'redfin' ]]; then
	flatpak install -y \
		flathub org.qgis.qgis \
		com.calibre_ebook.calibre \
		com.obsproject.Studio \
		com.obsproject.Studio.Plugin.BackgroundRemoval \
		org.cosmic_utils.enroll \
		org.openshot.OpenShot
fi

## arm doesn't support official Discord client
if [[ $(uname -m) == 'x86_64' ]]; then
	open "https://discord.com/"
elif [[ $(uname -m) == 'arm64' ]]; then
	flatpak install -y flathub \
		dev.vencord.Vesktop
fi
