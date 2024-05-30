#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

ostree remote add tailscale https://pkgs.tailscale.com/stable/fedora/tailscale.rep
rpm-ostree install tailscale

systemctl enable podman.socket
