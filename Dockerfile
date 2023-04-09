# Stage 1: build the application
FROM node:16.10-alpine3.11 AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm i -g @angular/cli
RUN npm i 
COPY . .
RUN ng build --prod

# Stage 2: serve the application
FROM nginx:1.21.3-alpine
COPY --from=build /usr/src/app/dist/my-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

