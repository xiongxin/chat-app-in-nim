## What is socket?
In almost every programming language, transferring data over a
network is done using network sockets.

- recv(read), Allows incoming data to be read from the remote side.
For TCP sockets, recv is used, and for UDP sockets, `recvFrom` is used.
- send(write), Sends data to a scoket, allowing data to be sent to the
remote side. For TCP sockets, send is used, and for UDP sockets. `sendTo`
is used.
- connect(open), Connects a socket to a remote server. This is typically
only used for TCP sockets.
- bindAddr(None), Binds a socket to the specified address and port.
When called, the socket becomes a server socket, and other sockets can
connect to it. This is a typeically only used for TCP sockets.

