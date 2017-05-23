#!/bin/bash

trap "exit 0" SIGINT SIGTERM SIGQUIT SIGABRT

: ${PLEX_SERVER?"Need to set PLEX_SERVER"}
: ${INFLUXDB_SERVER?"Need to set INFLUXDB_SERVER"}
: ${INFLUXDB_PORT?"Need to set INFLUXDB_PORT"}
: ${DATABASE?"Need to set DATABASE"}


sed -i -e 's/PLEX_SERVER/'"${PLEX_SERVER}"'/g' ./config.ini
sed -i -e 's/INFLUXDB_PORT/'"${INFLUXDB_PORT}"'/g' ./config.ini
sed -i -e 's/DATABASE/'"${DATABASE}"'/g' ./config.ini
sed -i -e 's/INFLUXDB_SERVER/'"${INFLUXDB_SERVER}"'/g' ./config.ini

python plexInfluxdbCollector.py