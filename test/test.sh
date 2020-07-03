#!/bin/sh

echo "API HOSTNAME: ${API_HOSTNAME}"

CONTENT='{"content": "a long long message"}'

echo "send content: ${CONTENT}"
CONTENT_ID=$(curl -XPOST -H"Content-Type: application/json" -d "${CONTENT}" http://${API_HOSTNAME}/api/v1/content | cut -d ':' -f 3 | cut -d '}' -f 1)

echo "receive:"
curl http://${API_HOSTNAME}/api/v1/content/${CONTENT_ID}
