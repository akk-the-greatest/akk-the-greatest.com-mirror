#!/bin/bash

find . -name "*.html" -type f | while read file; do
  sed -i 's|href="/|href="|g' "$file"
  sed -i 's|src="/|src="|g' "$file"
done
