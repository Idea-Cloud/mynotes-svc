#!/bin/sh

#HOSTNAME="a41497af47e374104ab3bdf16dcae3a2-565561707.eu-west-3.elb.amazonaws.com"
HOSTNAME="127.0.0.1:9090"

CONTENT='{"content": "a long long message"}'

echo "send content: ${CONTENT}"
CONTENT_ID=$(curl -XPOST -H"Content-Type: application/json" -d "${CONTENT}" http://${HOSTNAME}/api/v1/content | cut -d ':' -f 3 | cut -d '}' -f 1)

echo "receive:"
curl http://${HOSTNAME}/api/v1/content/${CONTENT_ID}
