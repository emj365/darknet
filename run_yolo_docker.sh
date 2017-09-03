IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP # add ip to x11 acl

docker run \
  -e DISPLAY=$IP:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $(pwd)/weights:/usr/src/app/weights \
  --rm -it yolo bash
