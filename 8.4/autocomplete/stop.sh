#!/bin/bash

echo "This will delete the content of logs and data, as well as destroy the zookeeper and solr instances."

docker-compose down
sudo rm -rf logs
sudo rm -rf data
mkdir -p logs data && chmod 777 logs && chmod 777 data
