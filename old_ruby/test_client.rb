require 'socket'

hostname = 'localhost'
port = 2000

my_socket = TCPSocket.open(hostname, port)
while line = my_socket.gets 
  puts line.chomp
end
s.close