#!/bin/bash
set -e

declare -r PV_DOCKER_REGISTRY="polyverse"
declare -r PV_GIT_COMMIT="$(git rev-parse --verify HEAD)"
declare -r PV_NAME="tcp-echo-server"

declare -r PV_TARGETS="alpine centos trusty xenial bionic"

main() {
	for PV_TARGET in ${PV_TARGETS}; do
		build ${PV_TARGET}
        	[ $? -ne 0 ] && return 1
	done

        return 0
}

build() {
	declare -r PV_TARGET="${1}"

	# Build the image
        docker build -f Dockerfile.${PV_TARGET} -t "${PV_NAME}" -t "${PV_DOCKER_REGISTRY}/${PV_NAME}.${PV_TARGET}:latest" .
        [ $? -ne 0 ] && return 1

        # Don't tag when there are uncommitted changes.
        if [ -z "$(git status -s -uno)" ]; then
                declare -r PV_GIT_COMMIT="$(git rev-parse --verify HEAD)"

                docker tag "${PV_DOCKER_REGISTRY}/${PV_NAME}.${PV_TARGET}:latest" "${PV_DOCKER_REGISTRY}/${PV_NAME}.${PV_TARGET}:${PV_GIT_COMMIT}"
                [ $? -ne 0 ] && return 1
        fi

        return 0
}

main "$@"
exit $?
