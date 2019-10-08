FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
CMD nmp install
COPY . .
CMD nmp run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html