FROM postgres:latest
LABEL Description="DNA development database" Vendor="Material Instinct LLC" Version="0.9"

ADD . /sql
COPY initdb.sh /docker-entrypoint-initdb.d/
