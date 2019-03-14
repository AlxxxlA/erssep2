FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
VOLUME /var/www/html
EXPOSE 80
