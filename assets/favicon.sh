#!/bin/bash

# Generate logo background
magick -size 553x640 xc:none \
	-fill "#FFF9F2" \
	-stroke "#3776AB" -strokewidth 11 \
	-draw "polygon 276.5,7 547,163 547,477 276.5,633 6,477 6,163" \
	assets/logo.png

# Generate text image and compose with background due to
# limited ligatures support in hexSticker and ImageMagick.
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

chrome --headless \
	--disable-gpu \
	--no-margins \
	--no-pdf-header-footer \
	--print-to-pdf-no-header \
	--print-to-pdf=assets/favicon-text.pdf \
	assets/favicon-text.svg

pdfcrop --quiet \
	assets/favicon-text.pdf assets/favicon-text.pdf

magick -density 2000 assets/favicon-text.pdf \
	-resize 25% \
	-alpha set -background none -channel A \
	-evaluate multiply 1.3 +channel \
	-transparent white \
	assets/favicon-text.png

magick assets/logo.png assets/favicon-text.png \
	-gravity center \
	-geometry +10-0 \
	-composite assets/logo.png

rm assets/favicon-text.pdf assets/favicon-text.png

# Optimize logo PNG
pngquant assets/logo.png \
	--force \
	--output assets/logo.png

# Pad the logo to get square favicon and resize
magick assets/logo.png \
	-gravity center \
	-background none \
	-extent 640x640 \
	-resize 512x512 \
	assets/favicon.png

# Optimize favicon PNG
pngquant assets/favicon.png \
	--force \
	--output assets/favicon.png

# Remove logo
rm assets/logo.png
