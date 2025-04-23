#!/bin/bash

# Stop script on error
set -e

# Repo URL (change this to your repo)
REPO_URL="https://github.com/grcnitin/server-confg"

# Target folder name (auto-generated from repo name)
FOLDER_NAME=$(basename "$REPO_URL" .git)

echo "🔧 Installing Git LFS..."
sudo pacman -S --noconfirm git-lfs

echo "✅ Initializing Git LFS..."
git lfs install

echo "📦 Cloning repository: $REPO_URL"
git clone "$REPO_URL"

echo "📂 Entering repository directory: $FOLDER_NAME"
cd "$FOLDER_NAME"

echo "⬇️ Pulling large files via Git LFS..."
git lfs pull

echo "✅ All set. Large files are ready!"
