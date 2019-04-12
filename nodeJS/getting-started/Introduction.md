### What is Node.js?

You have no doubt noticed the popularity of Node.js.  There are many courses and articles about it around the net, installing it is a prerequisite for pretty much any front-end development work, and of course the amount of jobs that require knowledge of it has been steadily increasing for the past few years.

So what is it?  The [Node.js website](https://nodejs.org/en/about/) declares:

"As an asyncronous event driven JavaScript runtime, Node is designed to build scalable network applications."

This is a definition that requires a little unpacking.

The important bit to understand right up front is that Node is a "JavaScript runtime".  When JavaScript was first invented, and for most of its life (until the creation of Node) it has been a language that runs *in the browser*.  Node is a runtime that allows the user to run javascript code outside of the browser, on a command-line or in a server.  This allows developers to use JavaScript for pretty much anything that other popular server-side languages such as Ruby, PHP, C# and Python can do. So, at it's most basic, Node simply allows you to run JavaScript code on a machine such as your local computer or a server without having to go through a web browser.

To facilitate this, Node has some added functionality that is not found in browser-based JS such as the ability to read and write files to the filesystem, create HTTP connections and listen to network requests.

### Event Driven
Node is an **asynchronous event driven** JavaScript runtime. The words asynchronous and event-driven here are really important to how Node works, and how you are going to go about writing code for it. Essentially what that means is that instead of writing a bunch of code that tells your program what to do in a sequence, you break your code up into smaller functions that get run in response to specific events.

For example, let's say you are writing a program and you need to do two separate things such as read some text from a file and then print it to the console, AND query a database for a list of users, then filter the users based on their age. Instead of telling your code to do those steps sequentially like so:

1. Read File
2. Print File Contents
3. Query Database
4. Filter Database Query results

You will break up the task like so:

1. Read File _AND THEN_ Print File Contents
2. Query Database _AND THEN_ Filter Database Query Results.

So when node steps through your file, it will start with whatever you have first (Read File), but (and this is the important part) while that file is being read it will go ahead and begin step 2 (Query Database). Since both of those steps (Reading a File and Querying a Database) take a little time to complete, we don't really know which one will be done first. If our database is small and the file we're reading is huge, the Database Query _could_ finish first... but to our program, it doesn't matter.

While both of those processes are running, Node sits and waits on an _Event_ to happen.  In this case, it is waiting on 2 events, the completion of our file reading and database query. When either of those things occurs Node will fire off an event that will run the next function we've defined either Printing File Contents or Filtering Database Query Results.

This process, while a little confusing at first, is very similar to the way that you would use `addEventListener` in front-end JavaScript to wait for a user action such as a mouse-click or keyboard press.  The main difference is that in this case, the events are going to be things such as network requests, or the completion of a database query. This functionality is facilitated through the use of callbacks. It's probably been a while since you first learned that concept, and it's _incredibly important_ in Node, so take a minute to read through [this article](https://briggs.dev/blog/understanding-callbacks), which is a deep dive into how callbacks work in JavaScript.

You will see this in action in the tutorial that comes up in the next lesson, so keep an eye out for it! Let's look at one quick real-world example:

~~~javascript
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello World!');
}).listen(8080);
~~~

This snippet is from the very first lesson in a tutorial that you'll be following very soon. Basically what it's doing is creating a server and saying "any time we get a network request run this function".  This function happens to respond with the text 'Hello World'. So, as mentioned before, the server is created and is waiting for a network request.  If there were other code in the file then that code could be executed while we wait.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe the purpose of a server
 - Describe the differences between static and dynamic sites
 - Explain why you might need a backend for your project
 - Explain when you don't need a backend for a project
 - Explain the event loop
 - Understand where the Nodejs runtime comes from
 - Write a simple "hello world" application and run it in the console of your machine
 - Understand what Nodejs really is

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [This short module](https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps) on "The Server Side" from MDN is a great source of the background knowledge needed to understand what we're about to learn. Read through at least the first 2 the articles posted here under 'Guides': Introduction to the server side and Client-Server Overview. The other 2 are interesting and worth reviewing, but less relevant to our immediate concerns.
2. to gain a little more insight into the nature of Node, and to unpack the rest of the above definition, read [this article](https://medium.freecodecamp.org/what-exactly-is-node-js-ae36e97449f5). There's a long, but *really* fantastic video linked in that article.. you should definitely watch it.
3. Take a minute or two to browse through the main [node.js website](https://nodejs.org/en/).  The getting-started article is a little *too* basic for our needs, and at this point the API documentation is probably a little too complicated for us to make use of just yet, but it will be useful to be familiar with this resource as we progress.
4. [This short video](https://www.youtube.com/watch?v=uVwtVBpw7RQ) is a great introduction as well!

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.
- link to stuff!

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers.

<details>
<summary>a question</summary>
<ul><ul>
  <li>the answer to that question</li>
</ul></ul>
</details>
