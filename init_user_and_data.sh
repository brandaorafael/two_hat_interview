#!/bin/bash

mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD  --authenticationDatabase admin --eval "db.getSiblingDB('${MONGODB_DATABASE}').createUser({ user: '${MONGODB_USER}', pwd: '${MONGODB_PASS}', roles: [ { role: 'readWrite', db: '${MONGODB_DATABASE}' } ] });"

mongoimport --db $MONGODB_DATABASE --collection chat -u $MONGODB_USER -p $MONGODB_PASS < data.json