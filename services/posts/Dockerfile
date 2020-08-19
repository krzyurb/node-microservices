FROM node:lts AS builder
WORKDIR /app
COPY ./package.json ./
RUN yarn install
COPY . .
RUN yarn run build

FROM node:lts-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["yarn", "start:prod"]
