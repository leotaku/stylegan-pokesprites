#!/usr/bin/env node
let fs = require('fs')
let text = fs.readFileSync('pokedex.js').toString()

var exports = {}
eval(text) // Running untrusted code locally!
let json = JSON.stringify(exports.BattlePokedex, null, 2)

fs.writeFileSync('pokedex.json', json)
