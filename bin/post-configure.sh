#!/bin/bash

source ${SETUPDIR?}/include/db2_constants
source ${SETUPDIR?}/include/db2_common_functions

create_bufferpool()
{
    echo "(*) Creating bufferpool"
    su - ${DB2INSTANCE?} -c "db2 connect to ${DBNAME?} && db2 -f /var/custom/bufferpool.sql"
}

create_tablespaces()
{
    echo "(*) Creating tablespaces"
    su - ${DB2INSTANCE?} -c "db2 connect to ${DBNAME?} && db2 -f /var/custom/tablespaces.sql"
}

create_bufferpool
create_tablespaces