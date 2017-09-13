FROM ubuntu:14.04.4

RUN apt-get update
RUN apt-get install -y gcc nasm git gdb curl python libc6-dev-i386 make bsdmainutils

WORKDIR /root
RUN git clone https://github.com/longld/peda.git
RUN echo "source /root/peda/peda.py" >> /root/.gdbinit
RUN echo 'peda.execute("set breakpoint pending on")' >> /root/peda/peda.py

RUN mkdir -p /opt/polyverse
WORKDIR /opt/polyverse
COPY main.c /opt/polyverse

RUN gcc -g -fno-stack-protector -o tcp_echo_server main.c

ENTRYPOINT ["/opt/polyverse/tcp_echo_server"]
