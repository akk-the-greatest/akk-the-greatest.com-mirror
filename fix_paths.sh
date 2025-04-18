#!/bin/bash
# Fixes all HTML files for GitHub Pages subdirectory hosting

GHPATH="/akk-the-greatest.com-mirror"

find . -type f -name "*.html" | while read file; do
  sed -i "s|href=\"/|href=\"$GHPATH/|g" "$file"
  sed -i "s|src=\"/|src=\"$GHPATH/|g" "$file"
  sed -i "s|url(/|url($GHPATH/|g" "$file" # for CSS background-image URLs
done
