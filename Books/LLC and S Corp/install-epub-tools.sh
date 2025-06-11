#!/bin/bash

# Script to install epubcheck and Calibre's ebook-viewer
# Compatible with macOS and most Linux distros

set -e

# 1. Install epubcheck
if ! command -v epubcheck &> /dev/null; then
  echo "Installing epubcheck..."
  mkdir -p ~/tools && cd ~/tools
  wget https://github.com/w3c/epubcheck/releases/latest/download/epubcheck.zip -O epubcheck.zip
  unzip epubcheck.zip -d epubcheck
  chmod +x ~/tools/epubcheck
  sudo ln -s ~/tools/epubcheck /usr/local/bin/epubcheck || echo "Add ~/tools to your PATH manually."
  echo "epubcheck installed."
else
  echo "epubcheck already installed."
fi

# 2. Install Calibre (includes ebook-viewer)
if ! command -v ebook-viewer &> /dev/null; then
  echo "Installing Calibre..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo -v
    sudo apt install -y calibre || sudo apt-get install -y calibre
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install --cask calibre
  else
    echo "Unsupported OS. Please install Calibre manually: https://calibre-ebook.com"
  fi
else
  echo "ebook-viewer (Calibre) already installed."
fi
