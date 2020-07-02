#!/bin/sh

HOSTNAME="127.0.0.1:9191"

CONTENT_ID=$(curl -XPOST -H"Content-Type: application/json" -d '{"content": "a long long message"}' http://${HOSTNAME}/api/v1/content | cut -d ':' -f 3 | cut -d '}' -f 1)

curl -v http://${HOSTNAME}/api/v1/content/${CONTENT_ID}
