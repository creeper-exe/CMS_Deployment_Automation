FROM nginx

RUN apt-get update && apt-get install -y openssl
RUN mkdir /etc/nginx/ssl

COPY ./tools/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./tools/ssl_setup.sh /etc/nginx/ssl/ssl_setup.sh
RUN chmod +x /etc/nginx/ssl/ssl_setup.sh

ENTRYPOINT ["etc/nginx/ssl/ssl_setup.sh"]

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]