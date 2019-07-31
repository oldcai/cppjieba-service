FROM alpine:latest
COPY cppjieba-server/dict /var/dict/
COPY cppjieba-server/build/bin/cjserver /bin/cppjieba-server
COPY config.conf /config.conf
CMD ["cppjieba-server"]

EXPOSE 80
