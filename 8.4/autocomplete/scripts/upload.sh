#!/bin/bash

echo "sh /opt/solr/server/scripts/cloud-scripts/zkcli.sh -z ${ZK_HOST} -cmd upconfig -confdir ${TAR_CONFIG_DIR} -confname ${CONFIG_NAME}"
sh /opt/solr/server/scripts/cloud-scripts/zkcli.sh -z ${ZK_HOST} -cmd upconfig -confdir ${TAR_CONFIG_DIR} -confname ${CONFIG_NAME}

echo curl "http://localhost:8983/solr/admin/collections?action=CREATE&name=${COLLECTION_NAME}&numShards=1&router.name=compositeId&router.field=id&collection.configName=${CONFIG_NAME}&core.name=${CORE_NAME}"
curl "http://localhost:8983/solr/admin/collections?action=CREATE&name=${COLLECTION_NAME}&numShards=1&router.name=compositeId&router.field=id&collection.configName=${CONFIG_NAME}&core.name=${CORE_NAME}&wt=json"
