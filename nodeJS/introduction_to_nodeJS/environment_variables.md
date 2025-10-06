### Introduction

When you run your code, your code runs in a specific environment. Run your code on a different machine? Different environment. Host your website somewhere like Netlify or Vercel? Different environment to your machine. Each environment is a unique collection of tools and configurations.

You will have certainly written many functions that you've called multiple times with different arguments. The function may behave differently or return a different value depending on those arguments. Just like with function parameters, your applications themselves can make use of **environment variables**. When you run your code, you can pass in values to those environment variables, and different environments can be given different values.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what environment variables are and their benefits.
- Use dotenv to store and make environment variables available in your code.
- Access environment variables using Node's `process.env` object.

### Environment variables

Environment variables are just variables that have environment-specific values. For example, since they are specific to individual environments, we can use them to:

- Provide different values for different environments, such as your machine during development and a website host when deployed, without having to modify the source code.
- Store secrets, such as database URLs and credentials, or API keys.

For example, a production environment may want additional logging and analytics compared to a development environment. The source code may therefore have an environment variable for whether it's running in "dev" or "prod" mode and do different things based on that. This is very common and by convention, this environment variable is named `NODE_ENV`, though it would still work with any other name.

Or perhaps you're building an API connected to a database, but you want to use a separate test database during development instead of the production one. You can pass your test database's URL and credentials into your app when you develop locally, but the deployment will have the values for the production database. On top of this, you can store environment variable values in a file that you add to your `.gitignore`, preventing the contents of that file from being exposed when changes are pushed.

### Loading environment variables

There are multiple ways you can load environment variables, though some are more cumbersome or may not have stable support yet in many Node versions. One way is by defining the environment variables and their values directly in the command to run your code. Instead of running your app with just `node index.js`, you could run the following (note that quotes are optional for values that do not contain certain special characters like spaces or `=`):

```bash
NODE_ENV=prod VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0" node index.js
```

#### Cross-platform considerations

The inline syntax above works on macOS and Linux but **not on Windows Command Prompt**. Here are the alternatives:

**Windows Command Prompt:**
```bat
set NODE_ENV=prod && set VIDEO_URL=https://www.youtube.com/watch?v=X2CYWg9-2N0 && node index.js
```

**Windows PowerShell:**
```powershell
$env:NODE_ENV="prod"; $env:VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0"; node index.js
```

**Cross-platform solution (recommended):**

Use the `cross-env` package in your npm scripts to ensure compatibility across all operating systems:

```bash
npm install --save-dev cross-env
```

Then in your `package.json`:
```json
{
  "scripts": {
    "start": "cross-env NODE_ENV=prod VIDEO_URL=https://www.youtube.com/watch?v=X2CYWg9-2N0 node index.js",
    "dev": "cross-env NODE_ENV=development node index.js"
  }
}
```

In the above, we define environment variables called `NODE_ENV` and `VIDEO_URL`, and assign them their respective values. Now any part of our code that uses those variables will have those values, just like function parameters! The convention for naming environment variables is to use `UPPER_SNAKE_CASE` (sometimes endearingly referred to as `SCREAMING_SNAKE_CASE` or `SHOUTY_CASE`).

You might see that this could quickly get quite cumbersome though, especially if you had lots of environment variables. If you had sensitive data like database credentials, that's even worse since you wouldn't want to push your `package.json` if it contained those values in an npm script!

#### export

Instead of setting environment variables directly in the command for running your code, you can use the shell command `export`, which will save environment variables and their values to the current shell session.

```bash
export NODE_ENV=prod VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0"
```

The above command will set the two environment variables in the current shell environment only, meaning if you were to open a new shell, it would not have access to those environment variables since it's a new environment. If we ran `node index.js` in the first shell (the one with the environment variables set), anything that used the `NODE_ENV` environment variable would have the value `"prod"`. If we instead ran `node index.js` in the second shell, it would have the value `undefined` instead since nothing was set in its environment. Neat, no?

This is definitely nicer than the previous directly-in-the-command method, and means we can really keep sensitive data hidden. To overwrite any variables, just rerun `export` with the new values for those variables like above.

To view all environment variables in the current shell, you can run `printenv`. Hang on, it's showing *a lot* of stuff we never set ourselves! That's because the shell itself has a lot of environment variables already set and loaded when it first loads. That's a bit annoying, we just want to deal with our app's environment variables! Also, our environment variables will be lost when we terminate the shell. What if we had lots of variables? It'd be a nightmare to try and remember them all and export them again in the new shell. Well...

#### dotenv

[dotenv](https://www.npmjs.com/package/dotenv) is one of the most common ways to load environment variables. After installing the npm package, you can create a file called `.env` in the root of your project that will contain all of your environment variables in the format `NAME="VALUE"`. Note that **you cannot have spaces around the `=` in this file**, else the values will be read incorrectly. For example:

```properties
NODE_ENV=prod
VIDEO_URL="https://www.youtube.com/watch?v=X2CYWg9-2N0"
```

**This file must be added to your `.gitignore` file** to keep secrets safe from being published! All you'd need to do now is import dotenv into your app (as early as possible in the code) so it can load your variables.

```javascript
require("dotenv").config();
```

You can now just run your code with `node index.js` and dotenv will handle all the loading for you. Note that dotenv isn't the only way to handle environment variables and security. Projects where a whole team needs synced access to the same environment variables, or otherwise more complex applications, may benefit from more robust and flexible options. For this course, dotenv should serve our needs more than well.

#### Multiple environment files

For larger projects, you might want separate environment files for different stages of development:

```
.env.development
.env.test
.env.production
.env.local          # Personal overrides (highest priority)
```

You can load environment-specific files by modifying your dotenv configuration:

```javascript
const environment = process.env.NODE_ENV || 'development';

// Load environment-specific file first
require('dotenv').config({ 
    path: `.env.${environment}` 
});

// Then load base .env as fallback
require('dotenv').config();
```

#### .env.example pattern

Create a `.env.example` file that you **commit to version control** (unlike `.env` which should be in `.gitignore`). This shows team members what environment variables are needed:

```properties
# .env.example
NODE_ENV=development
PORT=3000
VIDEO_URL=
DATABASE_URL=
API_KEY=
SECRET_KEY=
```

New team members can then run:
```bash
cp .env.example .env
```

And fill in their own values. This pattern ensures everyone knows what variables are required without exposing actual secrets.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Environment variables and deployment

When you deploy an app that uses environment variables, your repo will not contain your `.env` file, so you will have to research how your chosen deployment service handles setting environment variable values. Typically, there will be a way via their website interface, but otherwise, always check their documentation!

</div>

Awesome! You can load environment variables now, but how do you actually access them in your code?

### Accessing environment variables

Environment variables are accessed via Node's built-in `process` object, more specifically its `env` property. Node will load each environment variable to the `process.env` object, using its name as the property. You can then access them like any normal object property.

```javascript
if (process.env.NODE_ENV === "prod") {
    // do production-specific stuff
}

// don't want to ruin the surprise by hardcoding the URL!
// it might even change every few days!
redirectUserToSuperSecretVideo(process.env.VIDEO_URL);
```

No hardcoding of those values into the source code! If you want to change the value of an environment variable, you can just change it in your `.env` file then rerun the program. Do also note that environment variables will always be strings, so you must convert if you want to use any as a number or boolean, for example.

### Validating and parsing environment variables

Since environment variables are always strings and can be undefined, it's crucial to validate and parse them properly to avoid runtime errors:

#### Basic validation

```javascript
// Check for required variables
const requiredVars = ['NODE_ENV', 'DATABASE_URL', 'API_KEY'];
for (const varName of requiredVars) {
    if (!process.env[varName]) {
        throw new Error(`Missing required environment variable: ${varName}`);
    }
}
```

#### Type conversion with validation

```javascript
// Number conversion with fallback
const PORT = parseInt(process.env.PORT || '3000', 10);
if (isNaN(PORT) || PORT <= 0) {
    throw new Error('PORT must be a positive number');
}

// Boolean conversion helper
function parseBoolean(value, defaultValue = false) {
    if (value === undefined || value === null) return defaultValue;
    return ['true', '1', 'yes', 'on'].includes(value.toLowerCase());
}

const DEBUG_MODE = parseBoolean(process.env.DEBUG_MODE);
const ENABLE_CACHE = parseBoolean(process.env.ENABLE_CACHE, true);
```

#### Using validation libraries

For more complex validation, consider using libraries like `envalid`:

```javascript
const { cleanEnv, str, num, bool } = require('envalid');

const env = cleanEnv(process.env, {
    NODE_ENV: str({ choices: ['development', 'test', 'production'] }),
    PORT: num({ default: 3000 }),
    DATABASE_URL: str(),
    DEBUG_MODE: bool({ default: false }),
});

// Now env.PORT is guaranteed to be a number
console.log(`Server running on port ${env.PORT}`);
```

This approach provides automatic validation, type conversion, and helpful error messages if variables are missing or invalid.

### Assignment

<div class="lesson-content__panel" markdown="1">

<div class="lesson-note lesson-note--critical" markdown="1">

#### Keep your secrets safe!

Environment variables aren't only for sensitive data, but you will often need them for that. In your projects, if you use environment variables with dotenv, make sure you add `.env` to `.gitignore` so you **do not publish it**.

</div>

1. Check out [dotenv's documentation](https://www.npmjs.com/package/dotenv#-documentation). While you may not need many of their other features in this curriculum, like dotenvx or dotenv-vault, it's good to be aware that they exist.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are environment variables?](#environment-variables)
- [What might you want to use environment variables for?](#environment-variables)
- [What npm package could you use to load environment variables from a `.env` file?](https://www.npmjs.com/package/dotenv)
- [How do you access environment variables in a Node app?](#accessing-environment-variables)
- [What data type will an environment variable always be?](#accessing-environment-variables)
- [Should you push your `.env` file to GitHub?](#keep-your-secrets-safe)
- [How would you set environment variables on Windows Command Prompt vs PowerShell?](#cross-platform-considerations)
- [What is the purpose of a `.env.example` file?](#envexample-pattern)
- [Why is it important to validate environment variables?](#validating-and-parsing-environment-variables)
- [How can you convert environment variables to numbers or booleans safely?](#type-conversion-with-validation)
- [What are the benefits of using multiple environment files?](#multiple-environment-files)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [The Twelve-Factor App: Config](https://12factor.net/config) - Industry standard methodology for building modern applications
- [cross-env npm package](https://www.npmjs.com/package/cross-env) - Cross-platform environment variable setting
- [envalid npm package](https://www.npmjs.com/package/envalid) - Environment variable validation library
- [dotenv-safe npm package](https://www.npmjs.com/package/dotenv-safe) - Dotenv with required variable checking
- [Node.js process.env documentation](https://nodejs.org/api/process.html#processenv) - Official Node.js documentation
- [Environment Variables in Node.js: Best Practices](https://blog.bitsrc.io/a-comprehensive-guide-to-environment-variables-in-node-js-36a53543c0e6) - Comprehensive guide with advanced patterns
