FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY ip-toolbox.html /usr/share/nginx/html/ip-toolbox.html
COPY scripts/ /usr/share/nginx/html/scripts/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
