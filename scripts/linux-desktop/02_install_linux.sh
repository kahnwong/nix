#!/bin/bash

### applications
sudo apt install -y \
	dolphin \
	file-roller \
	gparted \
	konsole \
	xclip
sudo snap install mpv

#com.dropbox.Client
#com.github.hluk.copyq
#io.kinvolk.Headlamp
#io.mpv.Mpv
flatpak install -y flathub \
	app.freelens.Freelens \
	app.zen_browser.zen \
	com.bilingify.readest \
	com.bitwarden.desktop \
	com.calibre_ebook.calibre \
	com.dec05eba.gpu_screen_recorder \
	com.discordapp.Discord \
	com.github.IsmaelMartinez.teams_for_linux \
	com.github.PintaProject.Pinta \
	com.github.iwalton3.jellyfin-media-player \
	com.github.jeromerobert.pdfarranger \
	com.github.qarmin.czkawka \
	com.github.ransome1.sleek \
	com.github.tchx84.Flatseal \
	com.github.zocker_160.SyncThingy \
	com.google.Chrome \
	com.heroicgameslauncher.hgl \
	com.obsproject.Studio \
	com.obsproject.Studio.Plugin.BackgroundRemoval \
	com.rustdesk.RustDesk \
	com.slack.Slack \
	com.todoist.Todoist \
	com.transmissionbt.Transmission \
	dev.zed.Zed \
	io.github.TransmissionRemoteGtk \
	io.github.ciromattia.kcc \
	io.github.dweymouth.supersonic \
	io.github.flattool.Ignition \
	io.github.flattool.Warehouse \
	io.github.josephmawa.Bella \
	io.github.sigmasd.stimulator \
	io.github.vemonet.EmojiMart \
	io.gitlab.adhami3310.Impression \
	io.gitlab.librewolf-community \
	md.obsidian.Obsidian \
	net.puddletag.puddletag \
	org.audacityteam.Audacity \
	org.fkoehler.KTailctl \
	org.flameshot.Flameshot \
	org.freefilesync.FreeFileSync \
	org.gnome.Fractal \
	org.gnome.gitlab.cheywood.Buffer \
	org.gpodder.gpodder \
	org.kde.okular \
	org.mozilla.Thunderbird \
	org.raspberrypi.rpi-imager \
	org.telegram.desktop \
	us.zoom.Zoom

# set flameshot permission
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
