#!/usr/bin/env sh
SPRITES_URL='https://play.pokemonshowdown.com/sprites/'
SPRITES_INCLUDE='/sprites/gen5,/sprites/gen5-back'
POKEDEX_URL='https://play.pokemonshowdown.com/data/pokedex.js'

wget -r -nH -np -N -e robots=off -A 'png' -I "$SPRITES_INCLUDE" "$SPRITES_URL"
wget -O 'pokedex.js' "$POKEDEX_URL"
