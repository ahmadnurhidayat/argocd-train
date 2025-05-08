FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .

FROM node:20-alpine

WORKDIR /app
COPY --from=builder /app /app

CMD ["node", "src/index.js"]
EXPOSE 3000