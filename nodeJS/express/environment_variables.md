### Introduction

When you run your code, your code runs in an individual environment. Run your code on a different machine? Different environment. Host your website somewhere like Netlify or Vercel? Different environment to your machine. Each environment is a unique collection of tools and configurations.

You will have certainly written many functions with parameters that each time you call them, you pass in different arguments. Depending on those arguments, the outcome may differ. Just like with function parameters, your applications themselves can make use of **environment variables**. When you run your code, you can pass in values to those environment variables, and you can pass in different values in different environments as necessary.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what environment variables are and their benefits.
- Access environment variables using Node's `process` object.
- Use dotenv to store and make environment variables available to your application globally.

### Environment variables

Environment variables are just variables that have environment-specific values. For example, since they are specific to individual environments, we can use them to:

- Provide different values for different environments, such as your machine during development and a website host when deployed, without having to modify the source code.
- Store secrets, such as database URLs and credentials, or API keys.

For example, a production environment may want additional logging and analytics than a development environment. The source code may therefore have an environment variable for whether it's running in "dev" or "prod" mode, and do different things based on that.

Or perhaps you're building an API connected to a database, but you want to use a separate test database during development instead of the production one. You can pass your test database's URL and credentials into your app when you develop locally, but the deployment will have the values for the production database. On top of this, you can store environment variable values in a file that you add to your `.gitignore`, preventing the contents of that file from being exposed when changes are pushed.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
