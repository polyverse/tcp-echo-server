#!/bin/bash

targets=( alpine centos trusty xenial zesty artful bionic)

buildtarget()
{
	command="pv build -f Dockerfile.$1 -n tcp-echo-server.$1 ${@:2} docker"
	echo $command
	$command
}

buildtargets()
{
	for target in "${targets[@]}"
	do
		buildtarget $target ${@:1}
	done
}

# Special keyword "all" means build and push to both polyverse and jfrog repos
if [ "$1" == "all" ]; then
	buildtargets -s -r polyverse
	buildtargets -s -r internal.hub.polyverse.io
else
	buildtarget "$@"
fi
