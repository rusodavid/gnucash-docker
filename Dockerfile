# build with:
#  # docker build -t gnucash .
# run with
#  # xhost +LOCAL:
#  # docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix   gnucash
# or
#  # xhost +LOCAL:
#  # mkdir $HOME/gnucash-home
#  # docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group  -e HOME=${HOME} -e USER=${USER} -e LOGNAME=${LOGNAME} -u ${USER} -v $HOME/gnucash-home:$HOME  -v /where/you/keep/your/gnucash_files:/gnucash gnucash [options] /gnucash/[gnucash file]


FROM ubuntu:18.04
MAINTAINER rusodavid@gmail.com
ENV DEBIAN_FRONTEND noninteractive
ENV LANG es_ES.ISO-8859-1
ENV LANGUAGE es_ES.ISO-8859-15@euro  
ENV LC_ALL es_ES.ISO-8859-1     
# RUN apk update && apk add wget && rm -rf /var/cache/apk/* && apk add --no-cache gnucash
RUN apt-get dist-upgrade 
RUN apt-get update -q 
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:sicklylife/gnucash
RUN apt-get update -q 
RUN apt-get install -y gnucash dbus-x11 
RUN apt-get install -y locales 
RUN dpkg-reconfigure locales
RUN apt-get install -y libcanberra-gtk3-module
COPY environment.local /etc/gnucash/environment.local
COPY saved-reports-2.8 /gnucash/home/saved-reports-2.8
COPY net-barchart.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/net-barchart.scm
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]
