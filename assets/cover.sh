#!/bin/bash

# Generate text images and compose with background image
if [[ "$OSTYPE" == "darwin"* ]]; then
	CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
	CHROME_BIN="/c/Program Files/Google/Chrome/Application/chrome.exe"
else
	CHROME_BIN="/usr/bin/google-chrome"
fi

if [ ! -f "$CHROME_BIN" ]; then
	echo "Chrome/Chromium not found at $CHROME_BIN"
	exit 1
fi

alias chrome="\"$CHROME_BIN\""

# https://unsplash.com/photos/NjjONA3K0-k
BACKGROUND_URL="https://unsplash.com/photos/NjjONA3K0-k/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNzYxMjc2MTQ0fA&force=true&w=2400"
BACKGROUND_FILE="assets/cover-background.jpg"
PROCESSED_BACKGROUND="assets/background.png"

# Download the photo background if it is not already cached locally
if [ ! -f "$BACKGROUND_FILE" ]; then
	curl -LsSf "$BACKGROUND_URL" -o "$BACKGROUND_FILE"
fi

# Process cover-title.svg
chrome --headless \
	--disable-gpu \
	--no-margins \
	--no-pdf-header-footer \
	--print-to-pdf-no-header \
	--print-to-pdf=assets/cover-title.pdf \
	assets/cover-title.svg

pdfcrop --quiet \
	assets/cover-title.pdf assets/cover-title.pdf

magick -density 2000 assets/cover-title.pdf \
	-resize 50% \
	-alpha set -background none -channel A \
	-evaluate multiply 1.3 +channel \
	-transparent white \
	assets/cover-title.png

# Process cover-author.svg
chrome --headless \
	--disable-gpu \
	--no-margins \
	--no-pdf-header-footer \
	--print-to-pdf-no-header \
	--print-to-pdf=assets/cover-author.pdf \
	assets/cover-author.svg

pdfcrop --quiet \
	assets/cover-author.pdf assets/cover-author.pdf

magick -density 2000 assets/cover-author.pdf \
	-resize 22% \
	-alpha set -background none -channel A \
	-evaluate multiply 1.3 +channel \
	-transparent white \
	assets/cover-author.png

# Prepare background from downloaded photo
magick "$BACKGROUND_FILE" \
	-resize 2000x2654^ \
	-gravity center -extent 2000x2654 \
	-gravity north \( -size 1600x20 xc:white \) -geometry +0+200 -composite \
	-gravity south \( -size 1600x5 xc:white \) -geometry +0+300 -composite \
	"$PROCESSED_BACKGROUND"

# Compose text and name over background, then downscale
magick "$PROCESSED_BACKGROUND" \
	assets/cover-title.png -geometry -150-300 \
	-gravity center -composite \
	assets/cover-author.png -geometry -350-950 \
	-gravity center -composite \
	-resize 50% \
	assets/cover-temp.png

# Convert to JPEG
magick assets/cover-temp.png \
	-strip \
	-quality 92 \
	assets/cover.jpg

# Clean up intermediate files
rm assets/cover-title.pdf assets/cover-title.png assets/cover-author.pdf assets/cover-author.png "$BACKGROUND_FILE" "$PROCESSED_BACKGROUND" assets/cover-temp.png

# Optimize JPEG
jpegoptim --max=88 --strip-all assets/cover.jpg
