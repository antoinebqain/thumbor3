FROM alpine:edge
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk add --no-cache --update \
    build-base\
    boost boost-dev\
    linux-headers\
    bzip2-dev\
    python3 python3-dev\
    gifsicle\
    build-base git cmake coreutils gcc gfortran cairo\
    zlib-dev\
    expat-dev\
    exiftool exiv2-dev\
    ca-certificates freetype-dev libpng-dev openblas-dev libffi-dev libwebp libvpx x265-dev jpeg-dev\
    py3-pip\
    wget curl curl-dev\
    py3-numpy py3-scipy py3-cryptography\
    imagemagick ffmpeg\
    bash\
    && rm -rf /var/cache/apk/*

RUN ln -sfv /usr/bin/pip3 /usr/bin/pip && ln -sfv /usr/bin/python3 /usr/bin/python
ADD . /thumbor
WORKDIR /thumbor
RUN ls -lht
RUN make setup

RUN touch /thumbor/favicon.ico
ADD thumbor.conf /thumbor/thumbor.conf
RUN ls -lht
EXPOSE 80

ENTRYPOINT ["thumbor","--port=80","--conf=/thumbor/thumbor.conf","--log-level","debug"]