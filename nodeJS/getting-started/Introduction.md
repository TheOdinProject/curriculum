### What is Node.js?

You probably have noticed how popular Node.js has become in recent years.  The internet is flooded with courses and articles about it and the amount of jobs that require knowledge of Node.js has been steadily increasing over the past few years. In fact, Node.js is practically a prerequisite for pretty much any modern front-end development work. By the way, the terms Node and Node.js refer to the same thing, so you will see both names used interchangeably throughout the course.

But what is Node.js _really_?  The [Node.js website](https://nodejs.org/en/about/) declares:

"As an asyncronous event driven JavaScript runtime, Node is designed to build scalable network applications."

This is a definition that requires a little unpacking.

The important bit to understand right up front is that Node is a "JavaScript runtime".  When JavaScript was first created, it was designed to run *in the browser*. In other words, you could not run JavaScript programs using a command-line. However, Node is a runtime that allows the user to run Javascript code outside of the browser, on a command-line or in a server.  This allows developers to use JavaScript to accomplish pretty much anything that other popular server-side languages such as Ruby, PHP, C# and Python can do. So, at it's most basic level, Node simply allows you to run JavaScript code on a machine such as your local computer or a server without having to go through a web-browser.

To facilitate this, Node has received some added functionality that is not found in the browser-based version of JavaScript, such as the ability to read and write local files, create http connections and listen to network requests.

### Event Driven
Now, Node isn't _just_ a JavaScript runtime, it's an **asyncronous event driven** JavaScript runtime. The words asynchronous and event-driven are really important in understanding how Node works, and in the way you will go about writing your code. Essentially the phrase "asyncronous event driven" means that instead of writing a bunch of code that tells your program what to do in a sequence, you can break your code up into smaller functions that get run in response to specific events.

For example, let's say you are writing a program and you need it to do two separate things. It should read some text from a file and then print it to the console. But it also has to query a database for a list of users and filter the users based on their age.

Instead of telling your code to do those steps sequentially like so:

1. Read File
2. Print File Contents
3. Query Database
4. Filter Database Query results

You can break up the task like so:

1. Read File _AND THEN_ Print File Contents
2. Query Database _AND THEN_ Filter Database Query Results.

So when Node steps through your file, it will start with first command, in this case it will begin reading the file (step 1) but then something special happens, the asynchronous event driven aspect of Node.js kicks in. While the file is being read, instead of waiting for the this step to finish before proceeding, it will go ahead and begin querying the database (step 2). Both of these steps, reading a file and querying a database, could take some time to complete and we don't really know which one will be done first. If our database is small and the file we're reading is huge, the database query _could_ finish first... but to our program it doesn't matter.

While both of these processes are running, Node sits and waits on an _event_ to happen.  In this case, it is waiting on the completion of two events, the reading of a file and the database query. When either of these tasks are finished, Node will fire off an event that will run the next function we've defined. For example, if the program finished reading the file first, then it will begin printing the file contents. If instead the database query finished first, then it will start filtering the database query results.

This process, while a little confusing at first, is very similar to they way that you would use `addEventListener` in front-end JavaScript to wait for a user action such as a mouse-click or keyboard press.  The main difference is that in this case the events are going to be things such as network requests and the completion of a database query. This functionality is facilitated through the use of callbacks. Remember how callbacks work? It's probably been a while since you first learned about callbacks but it's _incredibly important_ in Node. So take a minute to read through [this article](https://briggs.dev/blog/understanding-callbacks), which is a deep dive into how callbacks work in JavaScript.

You will see this concept in more detail in the tutorial that accompanies the next lesson, so keep an eye out for it! In the meantime, let's look at a quick real-world example:

~~~javascript
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello World!');
}).listen(8080);
~~~

This snippet is from the very first lesson in a tutorial that you'll be following very soon. Basically this code is creating a server and saying, "any time we get a network request run this function".  This function happens to respond with the text 'Hello World'. So, as mentioned before, the server is created and is waiting for a network request. If there were other code in the file then that code could be executed while we wait. That's the power of Node being an asyncronous event driven JavaScript runtime. 

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe the purpose of a server.
 - Describe the differences between static and dynamic sites.
 - Explain why you might need a back-end for your project.
 - Explain when you would't need a back-end for a project.
 - Explain the event loop.
 - Understand the origin of the Node.js runtime.
 - Write a simple "hello world" application and run it in the console of your machine.
 - Understand what Node.js really is.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [This short module](https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps) on "The Server Side" from MDN is a great source for obtaining the background knowledge needed to understand what we're about to learn. Read through at least the first two articles posted under the 'Guides' section: Introduction to the server side and Client-Server Overview. The other two are interesting and worth reviewing, but less relevant to our immediate concerns.
2. To gain a little more insight into the nature of Node, and to unpack the rest of the above definition, read [this article](https://medium.freecodecamp.org/what-exactly-is-node-js-ae36e97449f5). There's a long, but *really* fantastic video linked in that article that we highly encourage you to watch.
3. Take a minute or two to browse through the main [Node.js website](https://nodejs.org/en/).  The getting-started article is a little *too* basic for our needs, and at this point the API documentation is probably a little too complicated for us to make use of just yet. But it will be very useful to become familiar with this resource as we progress.
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
