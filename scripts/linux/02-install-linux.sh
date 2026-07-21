#!/bin/bash

### applications
if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt install -y \
			dolphin \
			file-roller \
			gnome-tweaks \
			gparted \
			konsole \
			mpv \
			xclip

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf install -y \
			dolphin \
			file-roller \
			gnome-tweaks \
			gparted \
			konsole \
			mpv \
			xclip
	fi
fi

#com.bilingify.readest
#com.bitwarden.desktop
#com.dropbox.Client
#com.github.iwalton3.jellyfin-media-player
#com.github.ransome1.sleek
#com.slack.Slack
#com.todoist.Todoist
#io.github.flattool.Ignition
#io.github.nokse22.inspector
#org.gnome.Boxes
#org.gnome.Fractal
#org.gnome.gitlab.cheywood.Buffer
flatpak install -y flathub \
	app.freelens.Freelens \
	com.belmoussaoui.Decoder \
	com.calibre_ebook.calibre \
	com.dec05eba.gpu_screen_recorder \
	com.github.IsmaelMartinez.teams_for_linux \
	com.github.PintaProject.Pinta \
	com.github.jeromerobert.pdfarranger \
	com.github.qarmin.czkawka \
	com.github.tchx84.Flatseal \
	com.github.zocker_160.SyncThingy \
	com.jeffser.Pigment \
	com.obsproject.Studio \
	com.obsproject.Studio.Plugin.BackgroundRemoval \
	com.ranfdev.DistroShelf \
	com.rustdesk.RustDesk \
	com.transmissionbt.Transmission \
	io.github.TransmissionRemoteGtk \
	io.github.celluloid_player.Celluloid \
	io.github.ciromattia.kcc \
	io.github.dweymouth.supersonic \
	io.github.flattool.Warehouse \
	io.github.josephmawa.Bella \
	io.github.sigmasd.stimulator \
	io.github.tobagin.Ntfyr \
	io.github.tobagin.karere \
	io.github.v81d.Wattage \
	io.gitlab.adhami3310.Impression \
	io.gitlab.metadatacleaner.metadatacleaner \
	io.gitlab.news_flash.NewsFlash \
	io.kinvolk.Headlamp \
	io.missioncenter.MissionCenter \
	net.puddletag.puddletag \
	one.naiara.Kuychi \
	org.cosmic_utils.enroll \
	org.filezillaproject.Filezilla \
	org.fkoehler.KTailctl \
	org.flameshot.Flameshot \
	org.freefilesync.FreeFileSync \
	org.gnome.Firmware \
	org.gnome.Logs \
	org.gpodder.gpodder \
	org.kde.okular \
	org.mozilla.thunderbird_esr \
	org.openshot.OpenShot \
	org.raspberrypi.rpi-imager \
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
fi

## redfin only
if [[ $(uname -n) == 'redfin' ]]; then
	flatpak install -y \
		flathub org.qgis.qgis
fi

## arm doesn't support official Discord client
if [[ $(uname -m) == 'x86_64' ]]; then
	open "https://discord.com/"
elif [[ $(uname -m) == 'arm64' ]]; then
	flatpak install -y flathub \
		dev.vencord.Vesktop
fi
