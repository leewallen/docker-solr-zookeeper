#!/bin/bash

curl 'http://localhost:8983/solr/autocomp/update/json/docs?commit=true' \
   --data-binary @autosuggest-brands.json \
   -H 'Content-Type: application/json'


curl 'http://localhost:8983/solr/autocomp/suggest?suggest=true&suggest.dictionary=suggest&suggest.build=truewt=json&suggest.q=a'
