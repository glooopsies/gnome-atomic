#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo
rpm-ostree install tailscale

systemctl enable podman.socket
