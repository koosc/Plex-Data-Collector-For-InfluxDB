FROM python:3.5.3

RUN pip install requests influxdb

ADD config.ini .
ADD startup.sh .
ADD plexInfluxdbCollector.py .

#Set default environment values
ENV INFLUXDB_SERVER=localhost INFLUXDB_PORT=8096 PLEX_SERVER=localhost DATABASE=default 

CMD ./startup.sh