### Introduction

When you run your code, your code runs in an individual environment. Run your code on a different machine? Different environment. Host your website somewhere like Netlify or Vercel? Different environment to your machine. Each environment is a unique collection of tools and configurations.

You will have certainly written many functions with parameters that, each time you call them, you pass in different arguments. Depending on those arguments, the outcome may differ. Just like with function parameters, your applications themselves can make use of **environment variables**. When you run your code, you can pass in values to those environment variables, and you can pass in different values in different environments as necessary.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what environment variables are and their benefits.
- Access environment variables using Node's `process` object.
- Use dotenv to store and make environment variables available to your application globally.

### Environment variables

Environment variables are just variables that have environment-specific values. For example, since they are specific to individual environments, we can use them to:

- Provide different values for different environments, such as your machine during development and a website host when deployed, without having to modify the source code.
- Store secrets, such as database URLs and credentials, or API keys.

For example, a production environment may want additional logging and analytics than a development environment. The source code may therefore have an environment variable for whether it's running in "dev" or "prod" mode and do different things based on that.

Or perhaps you're building an API connected to a database, but you want to use a separate test database during development instead of the production one. You can pass your test database's URL and credentials into your app when you develop locally, but the deployment will have the values for the production database. On top of this, you can store environment variable values in a file that you add to your `.gitignore`, preventing the contents of that file from being exposed when changes are pushed.

### Accessing environment variables

<div class="lesson-note" markdown="1">

#### Environment variables are always strings

Even if you load or assign an environment variable with something other than a string, such as a number, the value stored will always be a string. If you want to use an environment variable as an actual number, you must convert it to one.

</div>

We will go through loading environment variable values shortly, but first, how do you access them in a Node app?

Environment variables are accessed via Node's built-in `process` object, more specifically its `env` property. Node will load each environment variable to `process.env`, using its name as the property. The convention for environment variable names is to use `UPPER_SNAKE_CASE` (sometimes lightheartedly referred to as `SCREAMING_SNAKE_CASE` or `SHOUTY_CASE`). For example:

```javascript
if (process.env.MODE === "prod") {
    // do production-specific stuff
}

// don't want to ruin the surprise!
// it might even change every few days!
redirectUserToSuperSecretVideo(process.env.VIDEO_URL);
```

But how exactly do you set their values?

### Loading environment variables

There are multiple ways you can load environment variables, though some are more cumbersome or may not have stable support yet in many Node versions. With one such way, instead of running your app with just `node index.js`, you could pass the values directly in the command, such as the following (note that quotes are optional for values that do not contain certain special characters like spaces or `=`):

```bash
MODE=prod VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0" node index.js
```

We're sure that you can see this might get quite cumbersome. If you had sensitive data like database credentials, that's even worse since you wouldn't want to push your `package.json` if it contained those values in an npm script!

#### dotenv

[dotenv](https://www.npmjs.com/package/dotenv) is one of the most common ways to load environment variables. After installing the npm package, you can create a file called `.env` in the root of your project that will contain all of your environment variables in the format `NAME="VALUE"`. For example:

```properties
MODE=prod
VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0"
```

This file can be added to your `.gitignore` file, making sure any secrets are kept safe! All you'd need to do now is import dotenv into your app so it can load those variables.

```javascript
// index.js - as early in the code as possible
require("dotenv").config();

// { MODE: "prod", VIDEO_URL: "https://www.youtube.com/watch?v=X2CYWg9-2N0" }
console.log(process.env);
```

You can now just run your code with `node index.js` and dotenv will handle all the loading for you. Note that dotenv isn't the only way to handle environment variables and security. Projects where a whole team needs synced access to the same environment variables, or otherwise more complex applications, may benefit from more robust and flexible options. For this course, dotenv should serve our needs more than well.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Environment variables and deployment

When you deploy an app, since your repo will not contain your `.env` file, you will have to research how your chosen deployment provider handles setting environment variable values. Typically, there will be a way via their website interface, but otherwise, always check their documentation!

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

<div class="lesson-note lesson-note--critical" markdown="1">

#### Keep your secrets safe!

Environment variables aren't only for sensitive data but you will often need them for that. Make sure you add `.env` to `.gitignore` so you **do not publish it**.

</div>

1. ASSIGNMENT ITEM

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
