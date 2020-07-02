ARG NODE_IMAGE
FROM $NODE_IMAGE

RUN apk add --no-cache git

RUN mkdir /data
#COPY ["./app/package.json", "./app/yarn.lock", "/data/"]

WORKDIR /data

RUN yarn install --prod

# Copy source code
COPY ./app/api /data/api

CMD ["node", "api/api.js"]
