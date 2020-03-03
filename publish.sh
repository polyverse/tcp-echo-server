#!/bin/bash
set -e

declare -r PV_DOCKER_REGISTRY="polyverse"
declare -r PV_GIT_COMMIT="$(git rev-parse --verify HEAD)"
declare -r PV_NAME="tcp-echo-server"

declare -r PV_TARGETS="alpine centos trusty xenial bionic"

main() {
	for PV_TARGET in ${PV_TARGETS}; do
		publish ${PV_TARGET}
        	[ $? -ne 0 ] && return 1
	done

        return 0
}

publish() {
	declare -r PV_TARGET="${1}"

	# Don't publish when there are uncommitted changes.
	if [ ! -z "$(git status -s -uno)" ]; then
		echo "COMMIT IS DIRTY, aborting"
		exit 1
	fi

        docker push "${PV_DOCKER_REGISTRY}/${PV_NAME}.${PV_TARGET}:latest"
        [ $? -ne 0 ] && return 1

        docker push "${PV_DOCKER_REGISTRY}/${PV_NAME}.${PV_TARGET}:${PV_GIT_COMMIT}"
        [ $? -ne 0 ] && return 1

        return 0
}

build() {
	# Build the image
        [ $? -ne 0 ] && return 1

        return 0
}

main "$@"
exit $?




#!/bin/bash
set -e

declare -r PV_DOCKER_REGISTRY="polyverse"
declare -r PV_GIT_COMMIT="$(git rev-parse --verify HEAD)"
declare -r PV_NAME="readhook-node-echo-server"

main() {
        publish
        [ $? -ne 0 ] && return 1

        return 0
}

main "$@"
exit $?
