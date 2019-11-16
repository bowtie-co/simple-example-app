FROM nginx

ENV BIN_DIR=/scripts
ENV SRV_DIR=/usr/share/nginx/html

RUN mkdir -p ${BIN_DIR} \
    && mkdir -p ${SRV_DIR} \
    && rm -rf /etc/nginx/conf.d

COPY bin ${BIN_DIR}
COPY nginx /etc/nginx
COPY entrypoint.sh /

RUN nginx -t

COPY src ${SRV_DIR}

EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
