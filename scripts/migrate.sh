#!/bin/bash

flatpak install -y flathub \
	com.jeffser.Pigment \
	org.cosmic_utils.enroll \
	org.gnome.Logs \
	io.gitlab.metadatacleaner.metadatacleaner \
	io.github.v81d.Wattage \
	com.belmoussaoui.Decoder

flatpak remove -y \
	com.bilingify.readest \
	com.bitwarden.desktop \
	com.github.iwalton3.jellyfin-media-player \
	com.github.ransome1.sleek \
	com.slack.Slack \
	com.todoist.Todoist
