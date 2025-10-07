#!/bin/sh

traceparent=`cat | jq -r .traceparent`
echo '{"traceparent": "'$traceparent'"}'


