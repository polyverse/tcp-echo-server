#include    <stdio.h>
#include    <stdlib.h>
#include    <string.h>
#include    <sys/types.h>
#include    <sys/socket.h>
#include    <netinet/in.h>
#include    <unistd.h>

#define READ_SIZE 512
#define BUFFER_SIZE 80
#define PORT 8080

void vuln_read(int client_fd) {
  char buffer[BUFFER_SIZE] = {0};  // initialize array with zeroes

  int n = read(client_fd, buffer, READ_SIZE);
  printf("read: %d bytes\n", n);
  
  // echo input back to client
  write(client_fd, buffer, n + 1); // include null
}

int main (int argc, char **argv){
  int port, server_fd, client_fd;
  socklen_t cli_len;
  struct sockaddr_in server_addr, client_addr;

  server_fd = socket(AF_INET, SOCK_STREAM, 0);
  if (server_fd < 0) {
    fprintf(stderr, "Can't open socket. Exiting...\n");
    exit(EXIT_FAILURE);
  }
  
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY;
  server_addr.sin_port = htons(PORT);  // convert from host byte order (lsb) to network byte order (msb)

  if (bind(server_fd, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
    fprintf(stderr, "Error on bind(). Exiting...\n");
    exit(EXIT_FAILURE);
  }

  listen(server_fd, 1);

  while(1) {
    cli_len = sizeof(client_addr);
    client_fd = accept(server_fd, (struct sockaddr *) &client_addr, &cli_len);
    if (client_fd < 0)
      fprintf(stderr, "Error on accept().\n");

    vuln_read(client_fd);

    close(client_fd);
  }

  close(server_fd);

  return 0;
}
