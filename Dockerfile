FROM alpine
LABEL maintainer="www.mrdoc.fun"
ENV TZ=Asia/Shanghai
ARG VER=1.3.2
WORKDIR /app
RUN set -x \
    && apk add --no-cache tzdata bash wget openjdk11 \
    && wget -O /app/halo.jar  https://github.com/halo-dev/halo/releases/download/v${VER}/halo-${VER}.jar \
    && addgroup -S halo  && adduser -S halo -G halo && chown -R halo.halo /app/

USER halo

CMD ["java","-jar","/app/halo.jar"]
