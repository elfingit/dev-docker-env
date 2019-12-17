FROM nginx

ENV LISTEN_PORT=8080 \
  SERVER_NAME=_ \
  FAST_CGI_HOST=laravel \
  FAST_CGI_PORT=9000 \
  ESC='$'

RUN mkdir -p /srv/www

COPY ./default.conf /etc/nginx/conf.d/mysite.template

EXPOSE ${LISTEN_PORT}

VOLUME ["/srv/www"]
CMD ["nginx", "-g", "daemon off;"]
