#!/usr/bin/env sh
set -e
rm sprites/gen5-normalize -rf || true
cp -r sprites/gen5 sprites/gen5-normalize
cd sprites/gen5-normalize

# Remove non-Pokemon sprites
rm 0.png
rm missingno.png
rm pokestar*.png

# 1: Crush alpha channel to boolean transparency
# 2: Scale image to 128x128 with transparent background
# 3: Set existing perfect white pixels to #fefefe
# 4: Set background to white and enable background transparency
# 5: Save image as PNG24

mogrify -monitor -channel A -threshold 75% +channel \
        -background transparent -gravity center -extent 128x128 \
        -fuzz 0% -fill 'rgb(254,254,254)' -opaque white \
        -background white -alpha background \
        -format PNG24 *.png

for file in *.PNG24; do
    mv -- "$file" "${file%PNG24}"png
done
