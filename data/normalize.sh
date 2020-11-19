#!/usr/bin/env sh
set -e
rm sprites/gen5-normalize -rf || true
cp -r sprites/gen5 sprites/gen5-normalize
cd sprites/gen5-normalize

mogrify -monitor -gravity center -extent 128x128 -background green1 -format PNG24 *.png
# Remove non-Pokemon sprites
rm 0.png
rm missingno.png
rm pokestar*.png

for file in *.PNG24; do
    mv -- "$file" "${file%PNG24}"png
done
