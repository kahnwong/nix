#!/bin/bash

### applications
sudo apt install -y \
	dolphin \
	file-roller \
	gnome-tweaks \
	gparted \
	konsole \
	xclip
sudo snap install mpv

#com.bilingify.readest
#com.bitwarden.desktop
#com.dropbox.Client
#com.github.iwalton3.jellyfin-media-player
#com.github.ransome1.sleek
#com.slack.Slack
#com.todoist.Todoist
#io.kinvolk.Headlamp
#io.mpv.Mpv
flatpak install -y flathub \
	app.freelens.Freelens \
	com.belmoussaoui.Decoder \
	com.calibre_ebook.calibre \
	com.dec05eba.gpu_screen_recorder \
	com.discordapp.Discord \
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
	dev.zed.Zed \
	io.github.TransmissionRemoteGtk \
	io.github.celluloid_player.Celluloid \
	io.github.ciromattia.kcc \
	io.github.dweymouth.supersonic \
	io.github.flattool.Ignition \
	io.github.flattool.Warehouse \
	io.github.josephmawa.Bella \
	io.github.nokse22.inspector \
	io.github.sigmasd.stimulator \
	io.github.tobagin.Ntfyr \
	io.github.tobagin.karere \
	io.github.v81d.Wattage \
	io.github.vemonet.EmojiMart \
	io.gitlab.adhami3310.Impression \
	io.gitlab.metadatacleaner.metadatacleaner \
	io.gitlab.news_flash.NewsFlash \
	io.missioncenter.MissionCenter \
	net.puddletag.puddletag \
	org.audacityteam.Audacity \
	org.cosmic_utils.enroll \
	org.filezillaproject.Filezilla \
	org.fkoehler.KTailctl \
	org.flameshot.Flameshot \
	org.freefilesync.FreeFileSync \
	org.gnome.Boxes \
	org.gnome.Firmware \
	org.gnome.Fractal \
	org.gnome.Logs \
	org.gnome.gitlab.cheywood.Buffer \
	org.gpodder.gpodder \
	org.kde.okular \
	org.mozilla.Thunderbird \
	org.openshot.OpenShot \
	org.raspberrypi.rpi-imager \
	org.telegram.desktop \
	us.zoom.Zoom

# set flameshot permission
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes

# lemonade
sudo add-apt-repository ppa:lemonade-team/stable
sudo apt install -y lemonade-server lemonade-desktop

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
