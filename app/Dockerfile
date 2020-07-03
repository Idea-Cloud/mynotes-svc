ARG NODE_IMAGE

FROM $NODE_IMAGE

ENV NODE_ENV=production
ENV PORT=8080
ENV REDIS_PORT=6379
ENV REDIS_HOST=redis

#RUN apk add --no-cache git

RUN mkdir /code
COPY ["./package.json", "./yarn.lock", "/code/"]

WORKDIR /code

RUN yarn install --prod

# Copy source code
COPY ./api /code/api

CMD ["node", "api/api.js"]
