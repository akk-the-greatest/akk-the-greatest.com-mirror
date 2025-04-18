#!/bin/bash

# Define the HTML snippet in a temporary file
cat <<'EOF' > snippet.html
<div class="mirror-container">
    <span class="mirror-badge"><a href="https://akk-the-greatest.com/">🌐 https://akk-the-greatest.com/</a></span>
</div>
<div class="mirror-container">
    <span class="mirror-badge"><a href="https://akk-the-greatest.neocities.org/">🌐 https://akk-the-greatest.neocities.org/</a></span>
</div>

<style>
.mirror-container {
    display: flex;
    justify-content: center;
    max-width: 700px;
    margin: 2em auto;
    padding: 0 1em;
    text-align: center;
}
.mirror-badge {
    display: inline-block;
    background: linear-gradient(to right, #111, #222);
    color: #00ccff;
    border: 1px solid #00ccff66;
    border-radius: 1em;
    padding: 0.25em 0.75em;
    font-family: 'Orbitron', sans-serif;
    font-size: 0.8rem;
    letter-spacing: 0.05em;
    text-shadow: 0 0 4px #00ccff88;
    box-shadow: 0 0 6px #00ccff44;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.mirror-badge:hover {
    transform: scale(1.05);
    box-shadow: 0 0 10px #00ccff99;
}
</style>
EOF

# Loop through all HTML files
find . -type f -name "*.html" | while read -r file; do
    if grep -qi "</html>" "$file"; then
        cp "$file" "$file.bak"
        awk '
            /<\/html>/ {
                system("cat snippet.html")
            }
            { print }
        ' "$file.bak" > "$file"
        echo "✔ Inserted before </html> in: $file"
    else
        echo "⚠ No </html> tag found in: $file"
    fi
done

# Cleanup
rm snippet.html

