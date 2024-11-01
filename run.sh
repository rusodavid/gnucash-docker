xhost +LOCAL:
docker run --name gnucash \
	-e XDG_RUNTIME_DIR=/tmp \
        -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
        -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	-e DISPLAY=unix$DISPLAY \
	-v $XAUTHORITY:/root/.Xauthority \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /data/gnucash/home:/gnucash/home \
	-v /data/gnucash/files:/gnucash/files \
	gnucash

#docker run --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /data/gnucash/home:/gnucash/home -v /data/gnucash/files:/gnucash/files -e XDG_CONFIG_HOME=/gnucash/home -e USER_DATA_HOME=/gnucash/home -e USER_CONFIG_HOME=${XDG_CONFIG_HOME}/.config -e XDG_DATA_HOME=${XDG_CONFIG_HOME} -e GNC_DATA_HOME=/gnucash/home -e GNC_CONFIG_HOME=${XDG_CONFIG_HOME} -e GTK_CONFIG_HOME=${XDG_CONFIG_HOME} -e GTK_DATA_HOME=${XDG_CONFIG_HOME} gnucash
