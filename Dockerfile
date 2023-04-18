# Etape 1: build de l'application Angular
FROM node:16.13-alpine3.14 AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm i -g @angular/cli
RUN npm install
COPY . .
RUN npm run build --prod

# Etape 2: Utiliser Nginx pour héberger l'application
FROM nginx:alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
