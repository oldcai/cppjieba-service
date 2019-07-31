FROM rikorose/gcc-cmake:latest
WORKDIR /code/

RUN wget https://github.com/yanyiwu/cppjieba/archive/master.zip && \
    unzip master.zip && rm -f master.zip && mv cppjieba-master cppjieba && \
    wget https://github.com/oldcai/cppjieba-server/archive/master.zip && \
    unzip master.zip && rm -f master.zip && mv cppjieba-server-master cppjieba-server

RUN cd cppjieba && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cd /code/cppjieba-server && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

FROM alpine:latest
COPY --from=0 /code/cppjieba-server/dict /var/dict/
COPY --from=0 /code/cppjieba-server/build/bin/cjserver /bin/cppjieba-server
COPY config.conf /config.conf
CMD ["cppjieba-server"]

EXPOSE 80
