 FROM nginx:1.10.1-alpine
 COPY index.html /usr/share/nginx/html
 ARG REACT_APP_PORTAL_REDIRECT_URI
 RUN echo $REACT_APP_PORTAL_REDIRECT_URI
 EXPOSE 8080
 CMD ["nginx", "-g", "daemon off;"]
