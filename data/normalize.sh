#!/usr/bin/env sh
set -e
rm sprites/gen5-normalize -rf || true
cp -r sprites/gen5 sprites/gen5-normalize
cd sprites/gen5-normalize

mogrify -monitor -gravity center -extent 128x128 -background green1 -format PNG8 *.png
rename 'PNG8' 'png' *.PNG8
