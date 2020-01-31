#!/bin/sh

if [ "$1" = "travis" ]; then
    psql -U postgres -c "CREATE DATABASE empresa_test;"
    psql -U postgres -c "CREATE USER empresa PASSWORD 'empresa' SUPERUSER;"
else
    sudo -u postgres dropdb --if-exists empresa
    sudo -u postgres dropdb --if-exists empresa_test
    sudo -u postgres dropuser --if-exists empresa
    sudo -u postgres psql -c "CREATE USER empresa PASSWORD 'empresa' SUPERUSER;"
    sudo -u postgres createdb -O empresa empresa
    sudo -u postgres psql -d empresa -c "CREATE EXTENSION pgcrypto;" 2>/dev/null
    sudo -u postgres createdb -O empresa empresa_test
    sudo -u postgres psql -d empresa_test -c "CREATE EXTENSION pgcrypto;" 2>/dev/null
    LINE="localhost:5432:*:empresa:empresa"
    FILE=~/.pgpass
    if [ ! -f $FILE ]; then
        touch $FILE
        chmod 600 $FILE
    fi
    if ! grep -qsF "$LINE" $FILE; then
        echo "$LINE" >> $FILE
    fi
fi
