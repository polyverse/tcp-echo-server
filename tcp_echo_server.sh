#! /bin/bash

SHORT_DESCRIPTION="Launch the vulnerable tcp_echo_server container for the given OS."

USAGE="$(cat <<EOF

Usage: sh tcp_echo_server.sh ${0##*/} [alpine|centos|trusty|xenial|zesty]

$SHORT_DESCRIPTION

EOF
)"

if [ $# -ne 1 ] || ! [[ "$1" =~ ^(alpine|centos|trusty|xenial|zesty)$ ]]; then
  printf "$USAGE\n\n"
  exit 1
fi

# Use this command to run
docker run -it --rm -p 8080:8080 --name echo polyverse/tcp_echo_server_$1

# Use this command to debug (and run the server by hand internally, using gdb)
# docker run --privileged -it --rm -p 8080:8080 --name echo --entrypoint /bin/bash polyverse/tcp_echo_server_$1
