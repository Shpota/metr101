FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY nest-cli.json ./
COPY tsconfig*.json ./
COPY src/ ./src
RUN npm ci && npm run build

FROM node:22-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
CMD [ "node", "dist/main.js" ]
