#!/bin/bash

# Ensure running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Update and install dependencies
apt update -y
apt install -y imagemagick ghostscript poppler-utils mupdf-tools

# Copy custom policy.xml if it exists in /home/app
if [ -f /home/app/policy.xml ]; then
  cp /home/app/policy.xml /etc/ImageMagick-6/policy.xml
fi

# Set working directory
cd /home/app

# Create directories
mkdir -p convertedPdf convertedPng finilized

# Convert each PDF in /home/app to PNG (one PNG per page, highest quality)
for pdf in *.pdf; do
  if [ -f "$pdf" ]; then
    # Output PNGs as convertedPng/<pdfname>_page-%03d.png
    pdftoppm -png -r 600 "$pdf" "convertedPng/${pdf%.pdf}_page"
  fi
done

# Convert PNGs back to PDF (group by original PDF)
for pdf in *.pdf; do
  base="${pdf%.pdf}"
  pngs=(convertedPng/${base}_page-*.png)
  if [ -e "${pngs[0]}" ]; then
    convert "${pngs[@]}" -quality 100 "finilized/${base}_final.pdf"
  fi
done