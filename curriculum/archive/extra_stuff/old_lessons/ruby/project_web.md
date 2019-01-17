# Projects: Ruby on the Web
<!-- *Estimated Time: 3-7 hours* -->

*Don't forget to use Git to save your project!*

## A Real Web Server and Browser (from the command line)

Part of the reason for getting into how Ruby interacts with the web is because it's directly relevant to what you'll be doing later on with Rails.  Rails is just Ruby code neatly packaged and highly opinionated.  Anything Rails does, you can reproduce on your own (given the time) with some Ruby knowledge.

In this case, you'll be building a simple web server that receives requests and sends a response based on those requests.  You'll also create a simple browser client to issue those requests -- then they can talk to each other!  After this project, the web should feel a lot less magical and mysterious for you, just full of interesting challenges.

There are a lot of steps here, and you'll need to draw on some of your previous knowledge of working with files and possibly using some basic regular expressions to parse a string.

### Background Reading

From the [Ruby 1.9.x Web Servers Booklet](http://www.scribd.com/doc/20755982/The-Ruby-1-9-x-Web-Servers-Booklet):

>  Web Server Primer

>   At its core any web server is simply a never ending loop that attempts to accept connections on a listening socket. Here is a very simple TCP server:

```language-ruby
    require 'socket'

    # IP address is 0.0.0.0 and it's on port 8080:
    server = TCPServer.new("0.0.0.0", 8080)
    loop do
        connection = server.accept
        inputline = connection.gets
        ...
        connection.puts outputline
        connection.close
    end
```

>  The servers differ in how they construct this loop and how they process incoming connections. The above sample is for a blocking server. Which means that it can only process one request at a time and that other requests will be waiting for the current one to finish. A long running request might make the server unreachable for a while. A group of those will quickly render the server unusable. There are several strategies to overcome this shortcoming. We will discuss those strategies and look at how they are utilized by the different servers.

> For a server to be called a web (HTTP) server it must speak the HTTP protocol. Hence it needs a way to parse the incoming HTTP requests. Each of the servers presented here attempts to solve this problem in its own way. But we will soon find that most of them rely on some clone of Mongrel's parser. If we modify our first server to include HTTP support it could look like this:

```language-ruby
    require 'socket'
    server = TCPServer.new("0.0.0.0", 8080)
    loop do
        connection = server.accept
        request = HTTP.parse(connection.gets) # an imaginary HTTP parser
        ...
        connection.puts status
        connection.puts headers
        connection.puts body
        connection.close
    end
```

So `socket` is a library available to Ruby without needing any special downloads (it's part of the standard library, you just need to remind Ruby to `require` it).  It lets you open and close connections to other machines or servers, just like you did when you were learning how to work with files!

It's actually pretty much the same principle... a web server is just like opening and closing files on your own computer.  The response you're waiting for is just a long string of characters or binary data like it is with a file.  The steps for working with files and servers are almost identical:

1. You need to tell Ruby where to find this "file" (what's the IP address and port we're looking for?)
2. Open the connection to that file (or the socket to the remote server)
3. Send your request to start reading the file (or whatever you want from that server)
4. Read the contents of the file (or read the response from the server)
5. Close the file (or the socket connection to the server)

Cool!

### Your Task

1. Read this [explanation of how HTTP works](http://www.jmarshall.com/easy/http/#whatis) down through where it talks about the POST method (about halfway down), if you haven't already.
1. Read this brief [tutorial on Ruby socket programming](http://www.tutorialspoint.com/ruby/ruby_socket_programming.htm) from TutorialsPoint.  Don't worry about the Multi-Client server stuff too much, but keep reading past it.
2. In one file, implement their "A Simple Server".  It's easy to copy/paste code, but make sure you conceptually understand what each line is doing.

      1. Ready to get your mind blown?  When you call `TCPServer.open`, the `::open` class method is the EXACT same method that you use to call `File.open` because `TCPServer` inherits (several levels up) from the same `IO` class that `File` does! Another way working with servers is like working with files.
      2. `#accept` is just an instance method of the `TCPServer` class.  It waits around for a connection, and when it gets a connection, it returns the `TCPSocket` representing that connection (see [the docs](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/socket/rdoc/TCPServer.html)).
      3. Now when you `#puts` to that socket, it gets picked up on the other side by your client.  Not magic at all, just a stream of bytes like typing into the `STDIN` from the command line using `#gets` or to `STDOUT` using `#puts`.

3. In another file, implement their "A Simple Client".  This should *really* look a lot like working with files.  `localhost` just represents the address of your current computer (as opposed to, say `http://www.google.com`).  Whenever you're building web applications and need to test them locally before deploying, you'll run a local server whose address will be `localhost` and some port number (often 3000, but that's arbitrary).  So get familiar with it!
4. In one tab of your terminal, run your server.  Press `CTRL + c` to break from the infinite loop when you want to stop it.
5. In another tab, run your client.  You should see whatever you told the server to print get `puts`'d to the command line.  **Congratulations, you just built a server!**
6. Now let's crank it up a little bit.  Build the "A Tiny Web Browser" from the same TutorialsPoint article (the first version) and test it out against some existing webpages.  That's basically just the same thing you built before but pointing at the web instead of your `localhost`.
7. Create an HTML file and save it as `index.html`.  It should look like:

    ```language-markup
        <html>
          <body>
            <h1>Welcome to the Viking Home Page</h1>
          </body>
        </html>
    ```

8. Now comes the fun part.  Modify your simple server to take the HTTP request from the browser and, if it is a `GET` request that points to `/index.html`, send back the contents of `index.html`.  

    1. You'll need to parse the incoming request yourself to determine which verb is being used, which file it wants, and other similar information that's contained in a standard HTTP request.  Again, check [the examples here](http://www.jmarshall.com/easy/http/#whatis) for what HTTP requests look like as a reference. The easiest way may be to use a Regular Expression.
    2. Send your own properly formatted HTTP response, including a status code of `200` if the file is found, and then the actual contents of the requested file.  Don't forget to include the size (in characters) of the outgoing file (this is a normal part of every HTTP response) to help you display it using your mini-browser.
    2. If it asks for another file that doesn't exist, send back an error code (like `404`) and an appropriate (or inappropriate) error message.

9. Modify your simple web browser to send the appropriate GET request to your web server, just like you did earlier with the really simple client/server combo.  Test it out... you should be able to ask for and retrieve the `index.html` file (and `puts` it into the terminal)!  This will require you to remember some of the commands you used to open files.  You should also set it up to identify when you've got back an error code and display the error message.
8. Build another HTML file called `thanks.html`.  It should look like:

    ```language-markup
        <html>
          <body>
            <h1>Thanks for Posting!</h1>
            <h2>Here's what we got from you:</h2>
            <ul>
              <%= yield %>
            </ul>
          </body>
        </html>
    ```

9. Now set up your mini web browser client to also send POST requests.  Where before we were pretending to be browsing the web, now we're going to pretend that we just pushed the "submit" button on a form and need to send the form data to your server.

    1. Modify your client to ask the user which type of request the user wants to send.  
    2. If the user wants to send a POST request, pretend you're registering a viking for a raid.  Ask the user for a couple of pieces of data about the viking, including a `name` and an `email`.  
    3. Store the results of this in a hash-inside-a-hash, which might end up looking like  `{:viking => {:name=>"Erik the Red", :email=>"erikthered@theodinproject.com"} }`.  Why the hash-in-a-hash?  Because this is exactly what it will look like when your browser sends data back from a Rails-generated form.  You could just use a normal hash, but that would be less fun.
    3. When you send the POST request, this time include your data hash as part of the request (again, see the [examples here](http://www.jmarshall.com/easy/http/#postmethod)).  You'll want to use the JSON format to transmit your hash, which means you need to add the `require 'json'` line at the top of your server and client to use the JSON library.
    4. The method that converts your hash object into a flat JSON string for easy HTTP transmission is `#to_json`.
    5. You'll also need to include the size of the data you're sending in the `Content-Length` field of the HTTP packet.

10. Finally, set up your server to recognize and respond to a POST request.

    1. If the server detects a POST request, you should identify and parse out the JSON data from it (it will probably be helpful to use the `Content-Length` line you included to break out the data)
    2. Turn that JSON string back into an object by using `JSON.parse` and save that in another hash that we'll call `params` (again because this is what Rails does).  Your code might look like `params = JSON.parse(the_post_JSON_string_here)`.
    3. Now open the `thanks.html` file and (without modifying the original file since you will want to use it multiple times) use your script to replace the line `<%= yield %>` with a new `<li>` for each one of the data items that you originally entered in your "form" back in your browser.  Display these in whatever format you'd like, for instance `<li>Name: Erik the Red</li><li>Email: erikthered@theodinproject.com</li>`.  
    4. Now send that modified file back to your mini-browser and show it.

11. Play with your new browser! Try submitting different things into your `name` and `email` fields and watch them pop back up in the html that gets sent back.  It's not magic, it's HTTP and Ruby.

Holy cow! You just built a command line web browser that sends actual HTTP requests and a web server that can actually interpret those requests, load up files, modify those files based on the inputs, and send them back to your browser.  Take a second to pat yourself on the back.

Now think about what you did.  Let it sink in, including some of the steps that seemed a little odd, like using a hash named `params` and replacing the line in the `thanks.html` file called `<%= yield %>` with some dynamically generated HTML.  Those are the types of things that Rails does.  That's right, you sort of maybe built a little piece of Rails.  Good work.

## Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* Add your solution below this line!
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/ruby_webserver)
* [Nicolas Amaya's solution](https://github.com/nicoasp/TOP---Ruby-Web-Project/tree/master)
* [John Phelps's solution](https://github.com/jphelps413/odin-ruby/tree/master/web-server)
* [nmac's solution](https://github.com/nmacawile/ruby_web_server)
* [Raiko's Solution](https://github.com/Cypher0/ruby_server_client)
* [Jib's Solution](https://github.com/NuclearMachine/OdinTasks/tree/master/simple_webserver)
* [Stefan P's solution](https://github.com/spavikevik/web_server)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/sockets)
* [Chris's solution](https://github.com/krzoldakowski/theodinproject/tree/master/web_server)
* [Donald's solution](https://github.com/donaldali/odin-ruby/tree/master/project_ruby_web)
* [Mazin Power's solution](https://github.com/muzfuz/CodeLessons/tree/master/web_server)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project2_5_Ruby_Web/webserver)
* [Tommy Noe's solution](https://github.com/thomasjnoe/simple-ruby-http)
* [Michael Alexander's solution](https://github.com/betweenparentheses/simple_client_server) (using while loops and gets instead of read_nonblock)
* [Sahil Agarwal's solution](https://github.com/sahilda/the_odin_project/tree/master/ruby-on-the-web)
* [James MacIvor's solution](https://github.com/RobotOptimist/simple_server) with thanks to @Jberczel because I shamelessly stole syntax.
* [Aleksandar Rodić's solution](https://github.com/rodic/Odin-Ruby-Projects/tree/master/Projects:%20Ruby%20on%20the%20Web/Project%202:%20A%20Real%20Web%20Server%20and%20Browser)
* [Vidul Parthasarathy's solution](https://github.com/viparthasarathy/web_server)
* [John Quarles's solution](https://github.com/johnwquarles/simple-server-and-client) (using while loops, #gets and #read)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPRuby/tree/master/Project5/rotwproject2)
* [Dominik Stodolny's solution](https://github.com/dstodolny/web_server)
* [Jason Matthews's solution](https://github.com/fo0man/tiny_web_server)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/ruby_on_the_web/tree/master/web_server_and_client)
* [Chris Dziewa's solution](https://github.com/chrisdziewa/ruby-server)
* [Frank Peelen's solution](https://github.com/FrankPeelen/Ruby-web-server-and-browser)
* [Chris Hall's solution](https://github.com/Concretechris/odinProject/tree/master/OP%20-%20Web%20Server%20%26%20Browser) with thanks to other students solutions for help!
* [ll14m4n's solution](https://github.com/ll14m4n/the-odin-project/tree/master/3_Ruby_cli-webserver-browser)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_web_server)
* [Matias Pan's solution](https://github.com/kriox26/odin_ruby/tree/master/project_web/ruby_web_server)
* [Jon Yorg's solution](https://github.com/Yorgg/Ruby-Stuff/tree/master/client-server)
* [Cody Gipson's solution](https://github.com/Cgipson06/Ruby-server-client)
* [Joe Balsamo's solution](https://github.com/Joe-Balsamo/webserver-and-browser)
* [Dan Hoying's solution](https://github.com/danhoying/ruby_on_the_web/tree/master/web_server)
* [Solution from hiendinhngoc](https://github.com/hiendinhngoc/TheOdinProject/tree/master/ruby/ruby_on_web)
* [Mark Viola's solution](https://github.com/markviola/the-odin-project/tree/master/10-ruby-on-the-web/2%20-%20Web%20Server%20and%20Browser)
* [Noah Prescott's solution](https://github.com/npresco/top/tree/master/ruby_on_the_web)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/ruby/ruby-on-the-web/real-web-server-and-browser)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/ruby/project9--real-webserver-and-browser)
* [Aviv Levinsky's solution](https://github.com/pugsiman/Ruby_web_server)
* [Scott Bobbitt's Solution](https://github.com/sco-bo/ruby_web_server)
* [Giorgos Mitsis's solution](https://github.com/vinPopulaire/web_server_and_browser)
* [Andrew Park's solution](https://github.com/akpark93/the_odin_project/tree/master/ruby_programming_projects/webserver)
* [srashidi's solution](https://github.com/srashidi/Ruby_on_the_Web/tree/master/web_server_and_browser)
* [Panashe Fundira's solution](https://github.com/munyari/odin/tree/master/learning-ruby/web-server)
* [James Brooks's solution](https://github.com/jhbrooks/server-and-browser)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/ruby/ruby-on-the-web/server-and-browser)
* [Skye Free's solution](https://github.com/swfree/the-odin-project/tree/master/web_server) with help from other student solutions!
* [Ricardo Villegas' solution](https://github.com/claricardo/RubyBuildingBlocks/tree/master/ruby_web)
* [djhart's solution](https://github.com/djhart/ruby_web_project/tree/master/browser_project)
* [Miguel Herrera's solution](https://github.com/migueloherrera/projects/tree/master/webserver_and_browser)
* [Luke Walker's solution](https://github.com/ubershibs/ruby-programming/tree/master/server)
* [Tomasz Kula's solution](https://github.com/zetsnotdead/web_server)
* [Max Gallant's solution](https://github.com/mcgalcode/Ruby/tree/master/RubyOnWeb/Serverproject)
* [Fabricio Carrara's solution](https://github.com/fcarrara/ruby_webserver)
* [DV's solution](https://github.com/dvislearning/ruby_server_browser)
* [John's solution](https://github.com/johnTheDudeMan/the_odin_project/tree/master/servers)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/ruby_on_web/tree/master/command_line_web_server_and_browser)
* [Earth35's solution](https://github.com/Earth35/web_server)
* [Lani's solution](https://github.com/laniywh/the-odin-project/tree/master/ruby-programming/ruby-on-the-web/web-server-browser)
* [Austin Mason's solution](https://github.com/CouchofTomato/webserver)
* [John Connor's solution](https://github.com/jacgitcz/tiny-browser-simple-server)
* [Jean Merlet's solution](https://github.com/jeanmerlet/basic_browser-server)
* [Oscar Y.'s solution](https://github.com/mysteryihs/ruby_projects/tree/master/Servers)
* [Sasho's solution](https://github.com/sashoa/the-odin-project/tree/master/project-rubyontheweb/web-server-and-browser)
* [Peuchen's solution](https://github.com/Peuchen/web_server)
* [Jiazhi Guo's solution](https://github.com/jerrykuo7727/web_server_and_browser)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/ruby_on_the_web/web_server)
* [csrail's solution](https://github.com/csrail/ruby-on-the-web/tree/master/ruby-server)
* [Clint's solution](https://github.com/tholymap/Odin-Ruby-Web)
* [Anthony Vumbaca's solution](https://github.com/tvumbaca/web_server)
* [Derek Kwong's solution](https://github.com/dckwong/RubyOnTheWeb/tree/master/simple_server_practice)
* [Leonard Soai-Van's solution](https://github.com/leosoaivan/TOP_ruby_socket)
* [David Chapman's Solution](https://github.com/davidchappy/odin_training_projects/tree/master/web_server)
* [Jerry Gao's solution](https://github.com/blackwright/odin/tree/master/ruby_server_browser)
* [Jakub Peikert's solution](https://github.com/JPeikert/odin_project/tree/master/ruby/web/webserver_browser)
* [Sophia Wu's solution](https://github.com/SophiaLWu/project-ruby-on-the-web)
* [Samuel Langenfeld's solution](https://github.com/SamuelLangenfeld/web_server_and_browser)
* [Simon's Solution - Clean](https://github.com/SimonSomlai/Odin/tree/master/ruby/ruby_internet)
* [smilesr's solution](https://github.com/smilesr/op-rb-rw-15-serverclient)
* [CodyLBuffaloe's solution](https://github.com/CodyLBuffaloe/Learning_Sockets)


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*


* An [Example solution to a similar but not identical problem](http://blogs.msdn.com/b/abhinaba/archive/2005/10/14/474841.aspx)
* [Tuxradar's Ruby web server project](http://www.tuxradar.com/content/code-project-create-web-server-ruby)
* [Luke Francl's file server tutorial](https://practicingruby.com/articles/implementing-an-http-file-server)
* Detailed explanation of the TCPServer `#gets` and `#read` methods in [this stack overflow post](http://stackoverflow.com/questions/7540064/simple-http-server-in-ruby-using-tcpserver)
