#!/bin/bash

echo "Make sure the logs and data directories are created and accessible."
mkdir -p logs data && chmod 777 logs && chmod 777 data

echo "Start zookeeper and solr."
docker-compose up -d

echo "Sleeping for 60 seconds to let zookeeper nodes start up and see each other. This isn't necessary on current day machines, or a one node zookeeper testing setup."
sleep 60

echo "Upload the configuration to zookeeper, and create the collection for autocomp." things 
docker-compose exec solr /scripts/upload.sh

MY_DIR=`pwd`
cd ./resources

echo "Index the data."
./index-data.sh

cd $MY_DIR

echo "Please feel free to try out the autocomp suggest by hitting:"
echo ""
echo "    http://localhost:8983/solr/autocomp/suggest?suggest=true&suggest.dictionary=suggest&wt=json&suggest.q=<whatever your query term is>"
echo ""
