#!/bin/bash

BASE_HREF="https://akk-the-greatest.github.io/akk-the-greatest.com-mirror/"
TAG="<base href=\"$BASE_HREF\">"

find . -name "*.html" | while read file; do
  # Remove any previous <base> tag if present
  sed -i '/<base href=/d' "$file"
  # Inject new <base> tag after <head>
  sed -i "s|<head>|<head>$TAG|" "$file"
  echo "✅ Updated base href in: $file"
done
