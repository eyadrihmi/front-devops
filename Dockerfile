FROM nginx:1.21.0-alpine

# Copier les fichiers statiques générés par Angular
COPY dist /usr/share/nginx/html

# Copier le fichier de configuration NGINX personnalisé
COPY nginx.conf /etc/nginx/nginx.conf
