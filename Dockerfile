FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## next FROM block is end of first block builder
FROM nginx  
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
# nginx automatically start by the image by default
