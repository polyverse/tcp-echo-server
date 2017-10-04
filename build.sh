#! /bin/bash
pv build -f Dockerfile.alpine -n tcp_echo_server.alpine $1 docker
pv build -f Dockerfile.centos -n tcp_echo_server.centos $1 docker
pv build -f Dockerfile.trusty -n tcp_echo_server.trusty $1 docker
pv build -f Dockerfile.xenial -n tcp_echo_server.xenial $1 docker
pv build -f Dockerfile.zesty  -n tcp_echo_server.zesty  $1 docker
