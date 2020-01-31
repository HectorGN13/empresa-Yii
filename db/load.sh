#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f "$0")")
if [ "$1" != "test" ]; then
    psql -h localhost -U empresa -d empresa < $BASE_DIR/empresa.sql
fi
psql -h localhost -U empresa -d empresa_test < $BASE_DIR/empresa.sql
