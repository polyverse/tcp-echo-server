#! /bin/bash

#target=alpine
target=centos
#target=ubuntu

# Use this command to run
docker run -it --rm -p 8080:8080 --name echo polyverse/tcp_echo_server.$target

# Use this command to debug (and run the server by hand internally, using gdb)
#docker run --privileged -it --rm -p 8080:8080 --name echo --entrypoint /bin/bash polyverse/tcp_echo_server.$target
