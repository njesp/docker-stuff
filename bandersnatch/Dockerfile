FROM python
RUN apt-get update \
    && apt-get -y upgrade  \
    && apt-get -y dist-upgrade \
    && apt-get -y install --no-install-recommends \
    software-properties-common \
    python3-pip \
    && apt clean \
    && apt autoremove -y \
    && pip3 install bandersnatch
COPY bandersnatch.conf /etc/
VOLUME /data
