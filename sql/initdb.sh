#!/bin/sh

# this is run as the "postgres" user on system startup

DBUSER=webuser
DBNAME=dna_dev

createdb $DBNAME

psql -c "CREATE USER $DBUSER"
psql -c "ALTER USER $DBUSER WITH SUPERUSER"
psql -c "grant all privileges on database $DBNAME to $DBUSER"

psql -U $DBUSER $DBNAME <<"EOF"
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;
EOF

