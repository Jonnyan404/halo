
FROM amd64/alpine
LABEL maintainer="www.mrdoc.fun"
ENV TZ=Asia/Shanghai \
    JVM_XMS="256m" \
    JVM_XMX="256m" \
    JVM_OPTS=""
#ARG VER=1.3.2
WORKDIR /app
RUN set -x \
    && apk add --no-cache tzdata bash wget openjdk11 \
    && VER="$(wget -qO- -t1 -T2 "https://api.github.com/repos/halo-dev/halo/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g;s/v//g')" \
    && wget -O /app/halo.jar  https://github.com/halo-dev/halo/releases/download/v${VER}/halo-${VER}.jar \
    && addgroup -S halo  && adduser -S halo -G halo && chown -R halo.halo /app/

USER halo

ENTRYPOINT java -Xms${JVM_XMS} -Xmx${JVM_XMX} ${JVM_OPTS} -Djava.security.egd=file:/dev/./urandom -server -jar /app/halo.jar
