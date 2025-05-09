#!/bin/bash

set -e

# Update and install core utilities
apt-get update
apt-get -y install curl wget r-base-core python3-pip

# Developer and data tools
apt-get install -y \
    libcurl4-openssl-dev \
    libgirepository1.0-dev \
    gobject-introspection \
    sox ffmpeg \
    libcairo2 libcairo2-dev \
    libjpeg-dev libgif-dev \
    git jq \
    socat s3cmd awscli \
    zsh tree mutt htop autossh \
    kcachegrind speedtest-cli \
    tigervnc-viewer \
    apt-transport-https \
    vim tmux \
    terminator \
    jupyter-notebook

# Add Microsoft VS Code repo
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -v packages.microsoft.gpg
apt-get -y update
apt-get -y install code

# Python package
pip install cffi

# Snap packages
snap install telegram-desktop
snap install slack --classic

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb || apt-get -fy install

# Wireshark without prompting
echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark

echo "✅ Setup completed successfully."
