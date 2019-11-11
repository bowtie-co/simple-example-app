FROM nginx

ENV SRV_DIR=/usr/share/nginx/html

RUN mkdir -p ${SRV_DIR} \
    && rm -rf /etc/nginx/conf.d

COPY nginx /etc/nginx
COPY entrypoint.sh /

RUN nginx -t

COPY src ${SRV_DIR}

EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
