#!/bin/bash

# sudo apt install python3-aiohttp python3-schema

# pip3 install --break-system-packages quart-babel aiomqtt aiocron

SCRIPT_FILE=$(readlink --canonicalize "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")

export SERVICE_NAME="tsun.proxy.oe"
VERSION=$(cat "$SCRIPT_DIR/app/.version")
export VERSION

# shellcheck disable=SC1091
source /home/enrico/scripts/passwordsafe.sh

export MQTT_HOST=$TSUN_MQTT_HOST
export MQTT_PORT=$TSUN_MQTT_PORT
export MQTT_USER=$TSUN_MQTT_USER
export MQTT_PASSWORD=$TSUN_MQTT_PWD

python3 "$SCRIPT_DIR/app/src/server.py" --config_path "$SCRIPT_DIR/config/"
