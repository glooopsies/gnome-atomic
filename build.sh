#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

flatpak remote-delete --force fedora
flatpak remote-delete --force fedora-testing
flatpak remote-delete --force flathub
 
flatpak remote-add --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf remove -y cheese libreoffice-* mediawriter gnome-tour gnome-boxes gnome-calculator gnome-calendar gnome-characters gnome-classic-session gnome-clocks gnome-connections gnome-contacts gnome-font-viewer gnome-maps gnome-shell-extension-* gnome-user-docs gnome-weather gnome-text-editor totem rhythmbox loupe yelp evince simple-scan baobab

sudo dnf install gcc-c++ htop
 
flatpak install -y --user --noninteractive flathub \org.mozilla.firefox org.gnome.Calendar org.libreoffice.LibreOffice org.gnome.clocks org.gnome.Calculator org.gnome.Contacts org.gnome.Maps org.gnome.Weather org.gnome.TextEditor org.gnome.Loupe org.gnome.Evince org.gnome.Totem com.mattjakeman.ExtensionManager org.gnome.Characters org.gnome.font-viewer org.gnome.baobab org.gnome.SimpleScan re.Sonny.Junction org.gnome.Geary org.freedesktop.Platform.ffmpeg-full com.github.flxzt.rnote
flatpak install -y --user --noninteractive --from https://nightly.gnome.org/repo/appstream/org.gnome.Ptyxis.Devel.flatpakref

curl https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo
rpm-ostree install tailscale
systemctl enable tailscaled.service

systemctl enable podman.socket
