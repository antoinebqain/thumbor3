FROM python:3.7-slim-stretch
RUN apt update
RUN apt search libvpx
RUN apt install -y python3-numpy python3-scipy python3-cryptography python3-pycurl ffmpeg imagemagick bash build-essential libcurl4-gnutls-dev libgnutls28-dev zlib1g-dev libtiff5-dev libjpeg62-turbo-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
    libharfbuzz-dev libfribidi-dev

RUN apt install -y webp coreutils gifsicle libvpx-dev exiftool

ADD . /thumbor
WORKDIR /thumbor
RUN make setup

RUN touch /thumbor/favicon.ico
ADD thumbor.conf /thumbor/thumbor.conf
RUN ls -lht
EXPOSE 80

ENTRYPOINT ["thumbor","--port=80","--conf=/thumbor/thumbor.conf","--log-level","debug"]
