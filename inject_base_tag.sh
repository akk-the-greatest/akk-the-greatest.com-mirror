#!/bin/bash

BASE_HREF="/akk-the-greatest.com-mirror/"
TAG="<base href=\"$BASE_HREF\">"

find . -name "*.html" | while read file; do
  # Only inject if not already present
  if ! grep -q "$TAG" "$file"; then
    sed -i "s|<head>|<head>$TAG|" "$file"
    echo "✅ Injected <base> tag into: $file"
  else
    echo "⚠️ Already has base tag: $file"
  fi
done
