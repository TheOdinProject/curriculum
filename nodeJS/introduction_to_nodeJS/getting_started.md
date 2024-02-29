### Introduction

Like we learned in the introduction lesson, Node.js is really just JavaScript. So a basic understanding of JavaScript is necessary in order to understand Node. For this reason, it is highly recommended that you take our prerequisite [JavaScript course](https://www.theodinproject.com/paths/full-stack-javascript/courses/javascript) before continuing with this course.

This lesson will take you through a tutorial that will teach you the basic modules and functions that you need to get up and running with Node.js. The project that comes at the end of this section will ask you to use Node to create a basic website that will include an `Index`, `About` and `Contact Me` page. So while learning the topics in this lesson, be on the lookout for things that might help you complete the project.

<div class="lesson-note" markdown="1">

### Important notice

Recently the NodeJS.dev team removed a large amount of content from their website. Several of those removed pages were linked to in this lesson. Until we find a replacement for that content we will be linking directly to the markdown files on their GitHub repository. The formatting may look a bit odd, but the content should still be just as good.

</div>

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain some things that Node.js is commonly used for.
- Create and use modules in Node.js (both built-in and user created).
- Set up a basic webserver with Node.js using the HTTP module.
- Read, create, update, and delete files from Node.js.
- Use the URL module to parse a url address and split it into readable parts.
- Understand how to use NPM.
- Create, fire and listen for your own events.

### Assignment

<div class="lesson-content__panel" markdown="1">

- Let's dive in and start looking at Node server-side code! We will be hopping around lessons in the [NodeJS.org](https://nodejs.org/en/learn) docs which you should follow along.
  - Get Started
    - Learn how to run Node.js scripts from the terminal in [this](https://nodejs.org/en/learn/command-line/run-nodejs-scripts-from-the-command-line) lesson.
    - Learn quickly about .env files and how we use them [here](https://nodejs.org/en/learn/command-line/how-to-read-environment-variables-from-nodejs)! This will become very important in the future when working with databases and other sensitive credentials!
  - HTTP Module
    - Learn [how to make HTTP requests with Node](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-web-server/node-make-http-requests.en.md).
    - Checkout `http.createServer` from the [http module](https://nodejs.org/api/http.html). The documentation shows optional parameters it can accept which you may or may not use. For now, you just need to know that the `createServer` method creates an HTTP server that accepts handlers that will be executed every time we get a request.
  - File System
    - First, take a look at the [fs module](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-fs.en.md) that we use heavily for working with files in Node.
    - Then, let's start [writing files](https://nodejs.org/en/learn/manipulating-files/writing-files-with-nodejs) in Node.
    - Finally, we'll learn how to [read files](https://nodejs.org/en/learn/manipulating-files/reading-files-with-nodejs).
  - The URL Class
    - Check out this [documentation](https://nodejs.org/api/url.html#url_the_whatwg_url_api) on the URL class. Play with the code samples to see how it works!
  - NPM
    - Let's get an [introduction](https://nodejs.org/en/learn/getting-started/an-introduction-to-the-npm-package-manager) to NPM.
    - After that, it's time to quickly get introduced to the [package.json file](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/package-json.en.md).
    - And the differences between [NPM global and local packages](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm-packages-local-global.en.md).
  - Events
    - Follow along the [Event Emitter](https://nodejs.org/en/learn/asynchronous-work/the-nodejs-event-emitter) section.
    - Look into [this](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md) section to see the `events` module.
- Optional Extra Credit!
  - Although a bit outdated, the W3 Schools introduction to Node.js is super useful! Go to the [W3 Schools node tutorial](https://www.w3schools.com/nodejs/default.asp) and code along with the following lessons (which should be listed on the sidebar of their site). Specifically, work from the **Node.js Intro** through to **Node.js Events**. You can look at the **File Uploads** and **Email** sections if you're feeling particularly ambitious!
  
  <div class="lesson-note lesson-note--warning" markdown=1>
  The URL module is very outdated. Refer to the earlier link if you run into issues in the Node.js URL Module from W3.
  </div>

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What is a File System Module? How and why would you use it?](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-fs.en.md)
- [What is the command for installing a package locally in with npm?](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm-packages-local-global.en.md)
- [What is the command for installing a package globally in with npm?](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm-packages-local-global.en.md)
- [What is the difference between a global and local package install with npm?](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm-packages-local-global.en.md)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- This [crash course video](https://www.youtube.com/watch?v=fBNz5xF-Kx4) from TraversyMedia is a great code-along for getting into Node.js. It may seem repetitive after completing the assignment, but practice is repetition!
- This [crash course playlist of 12 episodes](https://www.youtube.com/watch?v=zb3Qk8SG5Ms&list=PL4cUxeGkcC9jsz4LDYc6kv3ymONOKxwBU) from Net Ninja is a great resource to learn Node.js. There are 12 videos in this playlist, you can consider them all.
