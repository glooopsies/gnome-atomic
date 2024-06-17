#!/bin/bash

set -ouex pipefail

rm /etc/yum.repos.d/{_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo,fedora-updates-testing.repo,rpmfusion-nonfree-updates-testing.repo,rpmfusion-free-updates-testing.repo,google-chrome.repo}

curl https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo

# flatpak remote-delete --force fedora
# flatpak remote-delete --force fedora-testing
# flatpak remote-delete --force flathub

# dnf remove -y cheese libreoffice-* mediawriter gnome-tour gnome-boxes gnome-calculator gnome-calendar gnome-characters gnome-classic-session gnome-clocks gnome-connections gnome-contacts gnome-font-viewer gnome-maps gnome-shell-extension-* gnome-user-docs gnome-weather gnome-text-editor totem rhythmbox loupe yelp evince simple-scan baobab

/tmp/packages.sh

systemctl enable tailscaled.service
systemctl enable podman.socket
