ARG NODE_IMAGE

FROM $NODE_IMAGE

ENV NODE_ENV=production
ENV PORT=8080
ENV REDIS_PORT=6379
ENV REDIS_HOST=redis

#RUN apk add --no-cache git

RUN mkdir -p /code/app
WORKDIR /code

# Copy source code
COPY ["./package.json", "./yarn.lock", "/code/"]
COPY ./api /code/app/api
COPY ./module /code/app/module

# Install deps
RUN yarn install --prod

CMD ["node", "app/api/api.js"]
