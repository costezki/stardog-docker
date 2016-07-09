FROM java:8-jre-alpine

ENV STARDOG_VERSION 4.1.1

ENV STARDOG_HOME /data
ENV STARDOG_INSTALL_DIR /opt/stardog

ENV STARDOG_START_PARAMS ""
ENV STARDOG_CREATE_PARAMS "-n stardog -v -o versioning.enabled=true preserve.bnode.ids=false strict.parsing=false --"
ENV STARDOG_JAVA_ARGS "-Xms2g -Xmx2g -XX:MaxDirectMemorySize=2g"
ENV PATH ${STARDOG_INSTALL_DIR}/bin:${PATH}

RUN mkdir -p ${STARDOG_HOME}
RUN mkdir -p ${STARDOG_INSTALL_DIR}

WORKDIR ${STARDOG_INSTALL_DIR}

RUN apk update
RUN apk add unzip bash

ADD stardog-*.zip /tmp
RUN unzip -d /tmp /tmp/stardog-*.zip
RUN rm -f /tmp/stardog-*.zip
RUN cp -r /tmp/stardog-*/* ${STARDOG_INSTALL_DIR}/
RUN rm -rf /tmp/stardog-*

ADD stardog-license-key.bin ${STARDOG_INSTALL_DIR}
ADD stardog.properties ${STARDOG_INSTALL_DIR}
ADD start-stardog.sh ${STARDOG_INSTALL_DIR}

WORKDIR ${STARDOG_HOME}

CMD ${STARDOG_INSTALL_DIR}/start-stardog.sh

EXPOSE 5820
