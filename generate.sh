#!/usr/bin/env sh
DATASET_DIR='datasets/gen5'
DATA_DIR='data/sprites/gen5-normalize'

python ./stylegan2-ada/dataset_tool.py create_from_images "$DATASET_DIR" "$DATA_DIR"
