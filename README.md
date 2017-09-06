# exploits/tcp_server
This container listens on port 1234 and expects a TCP payload where the first 8 bytes represents the size to read, and then the data to read. The internal buffer size is 1024, so any payload greater than that will overflow the buffer since there's no size checking.

The container also installs gdb and peda tools.


## Building

The file `main.c` is built as part of the Docker image build process, resulting in a binary called `tcp_server`.

```
pv build docker
```

## Usage

There are 2 parts:

Server
======
```
docker run -it --privileged --rm -p 1234:1234 --name tcp_server polyverse/tcp_server
```

Client
======
```
python client.py <payload>
```
