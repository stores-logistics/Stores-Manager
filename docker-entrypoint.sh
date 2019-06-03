#!/bin/sh

#echo "Running migrations ..."
#for i in $(seq 1 30); do
    npm run migrate
#    [ $? = 0 ] && break
 #   echo "Reconnecting db ..." && sleep 1
#done
npm run start-docker