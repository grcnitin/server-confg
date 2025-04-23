#!/bin/bash

# Stop on error
set -e

echo "🔧 Installing Git LFS (Arch)..."
sudo pacman -S --noconfirm git-lfs

echo "✅ Initializing Git LFS for current user..."
git lfs install

echo "📂 Pulling large LFS files in: $(pwd)"
git lfs pull

echo "✅ Done! Large files have been fetched successfully."
