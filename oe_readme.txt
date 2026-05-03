# Install MQTT
sudo apt update
sudo apt upgrade
sudo apt install mosquitto mosquitto-clients
sudo systemctl enable mosquitto

# create password for user USERNAME
. ~/scripts/passwordsafe.sh
if [ -f /etc/mosquitto/credentials ]; then
    sudo mosquitto_passwd -b /etc/mosquitto/credentials $TSUN_MQTT_USER $TSUN_MQTT_PWD
else
    sudo mosquitto_passwd -c /etc/mosquitto/credentials $TSUN_MQTT_USER
fi

sudo mcedit /etc/mosquitto/conf.d/local.conf
    listener 1883
    allow_anonymous false
    password_file /etc/mosquitto/credentials

sudo systemctl restart mosquitto
sudo systemctl status mosquitto

# Subscriber test (Session 1)
# mosquitto_sub -t test
. ~/scripts/passwordsafe.sh
mosquitto_sub -t "#" -q 0 -v -u $TSUN_MQTT_USER -P $TSUN_MQTT_PWD

# Publisher test (Session 2)
mosquitto_pub -t test -q 1 -m "Hallo Welt" -u $TSUN_MQTT_USER -P $TSUN_MQTT_PWD
