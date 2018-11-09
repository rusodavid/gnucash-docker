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
# RUN apk update && apk add wget && rm -rf /var/cache/apk/* && apk add --no-cache gnucash
RUN apt-get update -q && apt-get install -y gnucash dbus-x11
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]
