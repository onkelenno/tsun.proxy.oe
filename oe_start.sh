#!/bin/bash

# sudo apt install python3-aiohttp python3-schema

# pip3 install --break-system-packages quart-babel aiomqtt aiocron

SCRIPT_DIR=$(dirname "$0")

export SERVICE_NAME="tsun.proxy.oe"
export VERSION=$(cat "$SCRIPT_DIR/app/.version")

python3 "$SCRIPT_DIR/app/src/server.py" --config_path "$SCRIPT_DIR/config/" --log_path "/var/log/tsun.proxy.oe/" --log_backups 2
