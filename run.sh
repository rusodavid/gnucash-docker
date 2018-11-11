xhost +LOCAL:
#docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /data/gnucash/home:/gnucash/home -v /data/gnucash/files:/gnucash/files gnucash

docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -e XDG_CONFIG_HOME=/root/.gnucash -e USER_DATA_HOME=${XDG_CONFIG_HOME} -e XDG_DATA_HOME=${XDG_CONFIG_HOME} -e GNC_DATA_HOME=${XDG_CONFIG_HOME} -e GTK_CONFIG_HOME=${XDG_CONFIG_HOME} -v /data/gnucash/home:/root/.gnucash -v /data/gnucash/files:/gnucash/files gnucash
