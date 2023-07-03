FROM registry.access.redhat.com/ubi8/ubi
RUN yum -y update \
 && yum -y module enable nginx:1.20 \
 && yum -y install nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./index.html /usr/share/nginx/html
#COPY --from=builder /opt/app-root/src/build /usr/share/nginx/html
RUN chgrp -R 0 /run /var/lib/nginx /etc/nginx \
 && chmod -R g=u /run /var/lib/nginx /etc/nginx
EXPOSE 8080
USER 1001
CMD ["nginx", "-g", "daemon off;"]
