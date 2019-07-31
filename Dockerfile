FROM ubuntu:18.04

LABEL maintainer="smartlab-dev@mpt.mp.br"

ENV ORACLE_BASE=/usr/lib/instantclient_12_1 

ENV LD_LIBRARY_PATH=$ORACLE_BASE \
    TNS_ADMIN=$ORACLE_BASE \
    ORACLE_HOME=$ORACLE_BASE

RUN apt-get update \
 && apt-get install -y unzip libaio1 wget \
 && wget -q -O /tmp/basic.zip https://midia-ext.mpt.mp.br/smartlab/instantclient-basic-linux.x64-12.1.0.2.0.zip \
 && wget -q -O /tmp/sdk.zip https://midia-ext.mpt.mp.br/smartlab/instantclient-sdk-linux.x64-12.1.0.2.0.zip \
 && unzip -q /tmp/basic.zip -d /usr/lib \
 && unzip -q /tmp/sdk.zip -d /usr/lib \
 && ln /usr/lib/instantclient_12_1/libclntsh.so.12.1 /usr/lib/libclntsh.so \
 && ln /usr/lib/instantclient_12_1/libocci.so.12.1 /usr/lib/libocci.so \
 && ln /usr/lib/instantclient_12_1/libociei.so /usr/lib/libociei.so \
 && ln /usr/lib/instantclient_12_1/libnnz12.so /usr/lib/libnnz12.so \
 && rm -rf /tmp/* \
 && apt-get remove -y unzip wget \
 && apt-get clean

CMD ["bash"]
