#!/usr/bin/with-contenv bashio

if [[ $(bashio::config "mqtt.host") == "null" ]];
then
  MQTT_HOST=$(bashio::services mqtt "host")
  MQTT_PORT=$(bashio::services mqtt "port")
  MQTT_USERNAME=$(bashio::services mqtt "username")
  MQTT_PASSWORD=$(bashio::services mqtt "password")
else
  MQTT_HOST=$(bashio::config 'mqtt.host')
  MQTT_PORT=$(bashio::config 'mqtt.port')
  MQTT_USERNAME=$(bashio::config 'mqtt.username')
  MQTT_PASSWORD=$(bashio::config 'mqtt.password')
fi

MQTT_NAMESPACE=$(bashio::config 'mqtt.namespace' 'lxp')
HOMEASSISTANT_TOPIC=$(bashio::config 'homeassistant_topic' 'homeassistant')
HOMEASSISTANT_SENSORS=$(bashio::config 'homeassistant_sensors' 'all')


yq -n -P "
  .inverters = load(\"./options.json\").inverters |
  .influx = load(\"./options.json\").influx |
  .databases = load(\"./options.json\").databases |
  with(.mqtt;
    .enabled = true |
    .host = \"${MQTT_HOST}\" |
    .port = ${MQTT_PORT} |
    .username = \"${MQTT_USERNAME}\" |
    .password = \"${MQTT_PASSWORD}\" |
    .namespace = \"${MQTT_NAMESPACE}\" |
    with(.homeassistant;
      .enabled = true |
      .prefix = \"${HOMEASSISTANT_TOPIC}\" |
      .sensors = \"${HOMEASSISTANT_SENSORS}\"
    )
  )" > /config.yaml

bashio::log.info 'Starting the lxp-bridge...'

exec /lxp-bridge -c /config.yaml
