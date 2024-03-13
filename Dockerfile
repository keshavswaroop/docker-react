FROM node:16-alpine as buildphase

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build 

FROM nginx
COPY --from=buildphase /app/build /usr/share/nginx/html