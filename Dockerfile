FROM nginx:latest

COPY index.html /usr/share/nginx/html

COPY linxu.png /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

