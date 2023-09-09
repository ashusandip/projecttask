FROM nginx:latest
COPY ./your-website-files /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
