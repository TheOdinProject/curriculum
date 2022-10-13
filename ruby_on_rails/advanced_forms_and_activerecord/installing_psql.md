### Introduction

One of the great things about Rails is that it comes with some sensible defaults so that you can get started quickly. That being said, as awesome as SQLite is, it is typically not used for production. There are a bunch of reasons, but one of the major speed bumps with SQLite is that many cloud providers that can host Rails applications for public access also often have ephemeral file systems. Because SQLite relies on flat files to store your database, the persistence of your data may be questionable.

For the toy applications we've written so far, this data persistence is usually not a problem. However, as we progress in our knowledge and expand our toolbox, it will become increasingly more sensible to make sure that our data can be persisted if our application's instance gets restarted or wakes up from sleep. It is also sensible to make sure our application development environment is fairly close to our intended production environment so we can avoid a whole class of problems that stem from using different tools in different environments.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Discuss what an environment is
- Briefly discuss environment variables and how to utilize them
- Install PostgreSQL locally and set it up
- Scaffold a simple Rails application to test our installation

### Environments and Their Variables

In the context of application development, an environment is the collection of tools, configurations and conventions that allow developers to make changes to the application. For a particular environment, this collection of tools also run the application. There are often four basic types of environments that are set up for a specific purpose, and the collection of these steps forms what is called a pipeline.

The *development* environment is intended to be the place where we can make changes, add features, or improve our code without having any impact on the practical experience of any users that might be using our application. The dev environment is typically local to the developer.

The *test* environment is set up to facilitate testing of our application. This environment is usually not that different from our development environment, but there may be some additional tooling that is added to monitor and analyze the performance of our application that wouldn't be present in the development environment. The testing environment is usually local, but certain deployment pipelines will run tests in a test environment in the cloud.

The *staging* environment is the pre-production environment. Usually, this environment mirrors the production environment completely, but the deployment is private or restricted to the developers. This environment exists usually as a final pre-flight check for changes that are intended to go to a live/production environment to make sure everything works as expected.

Finally, the *production* environment is what your users will access on a day-to-day basis. This environment is what actually runs your application every day.

Because an environment is just a collection of tools and configurations, they come in handy as a place we can store secrets or other information that may change based on how we intend to use our application. It turns out, you've been working in an *everything* environment already! But once you start thinking about deploying larger applications that you intend to be public, starting to think about the separate environments can come in handy.

For example, when we are developing locally, we may have different access credentials to certain tools compared to what we might use in production. Another example might be that our production application could include an analytics suite and more logging which would not be useful and potentially wasteful, if it's a paid service, in a development environment.

Well, how exactly does our application know what credentials or even bits of software to use or not to use? Well, we can tell Rails what kind of environment it is in, and through that environment, we can provide rules or secrets to our Rails application to use.

The foundation of any environment is the operating system and they generally do provide ways for us to store variables that are local to whatever application is running. These are known as *environment variables* and they can be very important to getting our application running. A git repository (and by extension Github) are great places to store and share your code, but you definitely don't want to share things like API keys that allow anyone to access your resources. With environment variables. This type of private data can be saved in the environment so that only those with access to the operating system can access them.

### Installing PostgreSQL

If you've been following the curriculum, then you should already have Ruby, Rails and all the supporting bits and pieces installed. If not, please go back and refer to those lessons before continuing with this one.

Pick your operating system below to get the relevant steps for installing PostgreSQL.

<details markdown="block">
<summary class="dropDown-header">Ubuntu
</summary>

Content here

</details>

<details markdown="block">
<summary class="dropDown-header">macOS
</summary>

Content here

</details>

### Assignment
Now that we've installed and configured our local PostgreSQL server, let's build a quick demo application to make sure everything is working.

<div class="lesson-content__panel" markdown="1">

1.  A RESOURCE ITEM
    *   AN INSTRUCTION ITEM
2. A PRACTICE ITEM
    * A TASK ITEM
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
