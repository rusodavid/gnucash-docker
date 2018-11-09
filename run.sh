xhost +LOCAL:
docker run --rm --name gnucash -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -e XDG_CONFIG_HOME=/gnucash/home -v /data/gnucash/home:/gnucash/home -v /data/gnucash/files:/gnucash/files gnucash

