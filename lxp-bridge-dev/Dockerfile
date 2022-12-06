ARG BUILD_FROM

FROM "celsworth/lxp-bridge:dev" as lxp-bridge


FROM $BUILD_FROM

ARG BUILD_ARCH
RUN apt-get update && apt-get install -y wget libssl1.1 && rm -rf /var/lib/apt/lists/* \
    \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    \
    && wget https://github.com/mikefarah/yq/releases/download/v4.30.5/yq_linux_${ARCH} -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

WORKDIR /data

COPY --from=lxp-bridge /usr/local/bin/lxp-bridge /lxp-bridge
COPY run.sh /

RUN chmod a+x /run.sh
RUN chmod a+x /lxp-bridge

CMD [ "/run.sh" ]
