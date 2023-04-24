# Stage 1: Compile and Build angular codebase
FROM node:latest as build

# Update OpenSSL
RUN apt-get update && apt-get install -y openssl

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build

# Stage 2: Serve app with nginx server
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/front-devops /usr/share/nginx/html

# Expose port 80
EXPOSE 80
