# tcp-echo-server
Simple TCP echo server with buffer overflow vulnerability.

## Building

The file `main.c` is built as part of the Docker image build process, resulting in a binary called `tcp-echo-server`.

```
sh build.sh [options to pv build docker]

-or for a complete build and push to both repos (as in Jenkins)
pv switch jenkins
sh build.sh all
```

## Usage

```
docker run -it --privileged --rm -p 8080:8080 polyverse/tcp-echo-server
```
