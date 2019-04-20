FROM ubuntu:18.04
MAINTAINER rusodavid@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV LANG es_ES.UTF-8

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
	software-properties-common
RUN add-apt-repository ppa:sicklylife/gnucash

RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \ 
	gnucash dbus-x11 \ 
	locales \
	libcanberra-gtk3-module \
	vim \
        wget \
	libgtk2.0-dev

RUN locale-gen es_ES es_ES.UTF-8
RUN dpkg-reconfigure locales

COPY environment.local /etc/gnucash/environment.local
COPY saved-reports-2.8 /gnucash/home/saved-reports-2.8
COPY net-barchart.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/net-barchart.scm
#COPY savings-rate.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/savings-rate.scm

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]
