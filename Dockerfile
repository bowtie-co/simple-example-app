FROM nginx

ENV BASE_DIR /app

RUN mkdir -p ${BASE_DIR} \
    && rm -rf /etc/nginx/conf.d

COPY nginx /etc/nginx
COPY entrypoint.sh /

RUN nginx -t

COPY src/* ${BASE_DIR}/

EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]
