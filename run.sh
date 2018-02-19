#!/bin/bash

SHORT_DESCRIPTION="Launch the vulnerable tcp-echo-server container for the given OS."

USAGE="$(cat <<EOF

Usage: sh tcp-echo-server.sh ${0##*/} [alpine|centos|trusty|xenial|zesty|artful|bionic]

$SHORT_DESCRIPTION

EOF
)"

if [ $# -ne 1 ] || ! [[ "$1" =~ ^(alpine|centos|trusty|xenial|zesty|artful|bionic)$ ]]; then
  printf "$USAGE\n\n"
  exit 1
fi

# Use this command to run
# docker run -it --rm -p 8080:8080 --name echo polyverse/tcp-echo-server.$1

# Use this command to debug (and run the server by hand internally, using gdb)
docker run --privileged -it --rm -p 8080:8080 -p 8008:8008 --name echo --entrypoint /bin/bash polyverse/tcp-echo-server.$1
