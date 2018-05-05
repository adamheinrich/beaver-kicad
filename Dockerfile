FROM ubuntu:16.04

MAINTAINER Adam Heinrich <adam@adamh.cz>
LABEL description="KiCad 4.0 image based on Ubuntu 16.04"

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-add-repository --yes ppa:js-reynaud/kicad-4

RUN apt-get update && \
    apt-get -y install --no-install-recommends kicad kicad-library

CMD kicad
