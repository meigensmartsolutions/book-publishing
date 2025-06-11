#!/bin/bash

# Validate and preview EPUB with epubcheck and ebook-viewer

EPUB_FILE="$1"

if [ -z "$EPUB_FILE" ]; then
  echo "Usage: $0 <file.epub>"
  exit 1
fi

# Check EPUB with epubcheck (Java required)
echo "Running epubcheck..."
epubcheck "$EPUB_FILE"

# Preview EPUB with Calibre's ebook-viewer if installed
if command -v ebook-viewer > /dev/null; then
  echo "Opening in ebook-viewer..."
  ebook-viewer "$EPUB_FILE"
else
  echo "Install Calibre's ebook-viewer for EPUB preview: https://calibre-ebook.com"
fi
