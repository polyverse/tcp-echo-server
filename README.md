# tcp_echo_server
Simple TCP echo server with buffer overflow vulnerability.

## Building

The file `main.c` is built as part of the Docker image build process, resulting in a binary called `tcp_echo_server`.

```
pv build docker
```

## Usage

```
docker run -it --privileged --rm -p 8080:8080 polyverse/tcp_echo_server
```
