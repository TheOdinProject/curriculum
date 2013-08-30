require 'socket'

# fire up my server to start listening on port 2000
my_server = TCPServer.open 2000
puts "Server class: #{my_server.class}!"

# listen forever because we're a server and that's what we do
loop  do

  client = my_server.accept # wait for the client to connect
  client.puts "WELCOME TO OUR SERVER DUDE!" 
  client.close

end