### Introduction

Before continuing our web development journey, we must address one important task - showcasing our hard work to the world.

Whether it's to share our creations with friends, create a portfolio for future employers, or launch an online business, we need to host our applications somewhere others can publicly access on the internet.

In this lesson, we will learn how to deploy our apps to a hosting provider, allowing us to run, build, and operate our web applications in the cloud.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what a hosting provider is.
- Understand the difference between static and dynamic sites.
- Understand what a PaaS is and how they work.
- Know how to deploy to a PaaS provider.
- Know how to troubleshoot common deployment issues.

### What are hosting providers?

Hosting providers are like server landlords. They own servers and rent space on them to customers, who can then use the space to store their websites and make them accessible to anyone on the web.

You've already had some experience using a hosting provider when you deployed projects to Github pages earlier in the curriculum. GitHub pages is great for hosting **static** web pages for free, but we won't be able to use it for hosting our **dynamic** Node apps. We're going to need something more powerful.

### Static vs dynamic sites

Static websites consist of pre-written HTML pages. They are "static" because everyone who visits them will see the same content. To build static sites, you only need HTML, CSS and JavaScript.

Dynamic websites, on the other hand, are websites that can change content based on the user who is visiting them. X (formerly known as Twitter) is a good example; every user sees different content on their homepage feed based on who they follow. To build dynamic sites, you still need HTML, CSS and JS. But additionally, you need a server-side application and a database.

This additional tech prohibits us from using GitHub Pages for hosting our Node apps. GitHub pages cannot run Node.js applications and doesn't have database services we can use. Similarly, host providers like Netlify and Vercel, which you may have used back in the React course, do not have the same capabilities to run our Node.js servers and databases. They're not the right tools for our back ends.

Luckily, many hosting providers do offer everything we need. They range from the big and complex cloud providers like [AWS](https://aws.amazon.com/), [Google Cloud](https://cloud.google.com/), and [Microsoft Azure](https://azure.microsoft.com/) to the more beginner-friendly platform as a service (PaaS) providers like [Railway](https://railway.app/) and [Render](https://render.com/). We will be focusing on and utilizing these latter providers in this lesson.

### What is a PaaS?

Platform as a Service is a specific kind of hosting provider. The most important thing to know about them is they are much easier to use and more approachable for beginners than other hosting providers. They manage many of the low-level nitty-gritty details with the underlying server infrastructure, which allows us as developers to focus more of our time on building our applications instead of configuring and managing the servers they run on.

Taking the landlord metaphor we used earlier a little further, a PaaS platform is like having a landlord who takes care of all the utilities, building maintenance and security. Meanwhile, you, the developer, focus on furnishing, decorating and living in the space.

It's an incredibly powerful model and perfect for us right now. Using a PaaS provider for deployment, we can focus on learning and mastering Node without taking a significant diversion to learn the specialized knowledge needed to manage and maintain servers ourselves.

We will provide a list of our recommended PaaS providers later in the lesson. First, let us explore from a high level how PaaS providers work.

### How do PaaS services work?

PaaS providers work by giving you easy access to a few resources that any Node app can't live without to function on the web.

#### Instances

The first and most crucial thing PaaS providers give you are virtual "computers" called instances which run your app. Basically, one instance means a single instance of your application running at one time. That's like having a single computer run your app like you do on Localhost. Multiple instances are like having several copies of your app running simultaneously, which allows you to handle more traffic.

For most of your apps, one instance is plenty enough. You can support a lot of traffic using just a single instance. Many of the PaaS providers we will recommend later in this lesson give you your first one for free.

<div class="lesson-note" markdown="1">

Learners can keep their server instance and database instance on one PaaS or use separate PaaSes if necessary. When you deal with paid plans, it might even reduce hosting costs!

</div>

#### Databases

The second most important thing PaaS providers give you is databases. They make it easy to spin up a new database for each app by doing all the setup and configuration for you.

Many providers even manage the database for you by setting up automatic backups, ensuring the database is constantly updated with the latest critical security patches and ongoing maintenance that keeps your databases up and running smoothly.

The peace of mind this affords you can't be overstated. You never want to be in a position where you're waking at 4 am to multiple alerts. Your database is on the fritz because of some security patch you forgot to apply, and there are no backups to fall back on.

Many PaaS services come with SQL databases included.

Either choice isn't too difficult to set up, but it's always nice to have a fallback option! For now, we encourage you to try and figure out how to deploy your mini-message board project with just what you learn in this lesson.

#### Domain names

PaaS providers will give you a random domain name when you first deploy. In Heroku's case, it's usually something zen-like "afternoon-falls-4209". If you want to visit the app, you can go directly to `http://afternoon-falls-4209.herokuapp.com` to see your app live on the web in all its glory.

The domain name will always be yours on a PaaS provider. They give each app a unique domain name that's yours as long as your app lives on their platform.

In the real world, you'll want to link it to your own custom domain, for example, `http://mycooldomain.com`. It's worth mentioning that you don't need custom domain names for the portfolio projects you'll be building in this course. The random domains your PaaS provider gives you will be good enough. However, if you have an itch for tricking out your app with a custom domain name, you'll first need to purchase a domain from a registrar like [Porkbun](https://porkbun.com/) or [NameSilo](https://www.namesilo.com/).

To find a new domain, try using [Domainr](https://domainr.com/).

Once you have your domain, you need to point it to your project. The provider you are using will have exhaustive documentation on using custom domain names on their platform.

### Our recommended PaaS services

Choosing a PaaS provider was once a simple decision. Heroku had a free tier that gave you everything needed to host as many small apps as you wanted, but they unfortunately discontinued it in 2022.

Luckily, there are still plenty of other great options out there. The downside is that they all have very limited free tiers. For this reason, and to accommodate as many of our learners as possible, we're going to recommend a range of options instead of just one.

You can host most of your projects for free using a combination of the different providers we recommend, but you'll have a bit more leg work to do. You'll have to create an account and get familiar with a few different providers.

If you can pay for hosting, things are more straightforward. It will afford you the luxury of choosing one provider you can learn deeply, and you'll be able to manage all your apps from one place.

Whatever your circumstances, we've got you covered. Here are the PaaS providers we recommend.

---

#### Railway.app

Can deploy both servers and databases.

- Railway has a convenient deployment process. You link to your project's GitHub repo.
- Pay for what you use model.
- $5 a month should be enough to host four applications.

##### Railway.app: Free Plan

- You get a free one-time grant of $5 on their free trial, and the applications are never put to sleep when inactive.
- However, the longevity of your free allowance depends on how many resources you consume. More complex apps with more traffic may consume all free resources within a month, whereas simpler apps may last longer.

##### Railway.app: Links

- [Railway homepage](https://railway.app/)
- [Railway documentation](https://docs.railway.app/)

---

#### Render

Can deploy both servers and databases.

- Render allows you to deploy using "Blueprints", which link to your project's GitHub repo.
- The free 750-hour allowance is enough to host a few apps without paying anything. However, databases are separate on Render, and the lowest spec databases cost $7 each.
- $21 a month is enough to host three applications as each app's database will cost $7.

##### Render: Free Plan

- 750 hours of free usage per month.
- Applications are put to sleep automatically after 15 minutes of inactivity, so the 750 free hours should be enough to host a few apps for the entire month.

##### Render: Links

- [Render homepage](https://render.com/)
- [Render documentation](https://render.com/docs/)
- [Guide: Official getting started with Node/Express on Render guide](https://render.com/docs/deploy-node-express-app)
- [Guide: CodeBrah video guide for deploying Node applications to Render](https://www.youtube.com/watch?v=bnCOyGaSe84&ab_channel=CodeBrah)

---

#### Koyeb

Can deploy both servers and databases.

- Easily Git push to deploy.
- Ability to run web apps, APIs, and workers easily.
- SSL and 10 free custom domains

##### Koyeb: Free Plan

- One free Web service.
- One free Postgres database (50 hours).
- Doesn't require a credit card to start.
- Pay-per-use by the second for more.

##### Koyeb: Links

- [Koyeb homepage](https://www.koyeb.com/)
- [Koyeb documentation](https://www.koyeb.com/docs)
- [Guide: Official getting started with Node/Express on Koyeb guide](https://www.koyeb.com/docs/deploy/express)

---

#### Neon

Can deploy databases only.

- 24/7 for your main database.
- 20 additional hours of database branching.
- Point-in-time restore (24 Hours)
- No credit card required.

##### Neon: Free Plan

- 0.5 GiB of storage
- 24/7 for your main compute
- No credit card required

##### Neon: Links

- [Neon homepage](https://neon.tech/)
- [Neon documentation](https://neon.tech/docs/introduction)
- [Guide: Connect a Node.js application to Neon](https://neon.tech/docs/guides/node)

---

#### Aiven

Can deploy databases only.

- 24/7 for all database services.
- High availability and automatic backups.
- Point-in-time recovery (varies by service).
- No credit card required.

##### Aiven: Free Plan

- 5 GiB of storage.
- 24/7 for all database services.
- One free database for every services including PostgreSQL, MySQL and Redis.
- No credit card required.

##### Aiven: Links

- [Aiven homepage](https://aiven.io/)
- [Aiven documentation](https://aiven.io/docs/get-started)
- [Guide: Connect a Node.js application to Aiven](https://aiven.io/docs/products/postgresql/howto/connect-node)

<div class="lesson-note lesson-note--tip" markdown="1">

#### Keep your secrets safe!

This guide provides a sample for configuring a database connection. Please do not store credentials directly in your code. Refer to the [Environment Variables](https://www.theodinproject.com/lessons/nodejs-environment-variables) section for best practices.

</div>

---

### Debugging and troubleshooting deployments

Errors are an inevitable part of the software development process. They especially have a habit of popping up when deploying to a new environment like a hosting provider. When this happens, the key is not to panic and to follow a calm, step-by-step debugging process.

In most cases, you'll be running into errors that thousands of developers have encountered before. These errors are well documented and often have solutions you can find with a little bit of Google-fu.

There are two stages of the deployment process where you are most likely to encounter problems. These are during deployment and right after.

#### Node version compatibility

Depending on the host provider you use, the supported Node versions and default selected version may differ. You can refer to the providers' documentation for more information on what is supported and selected, and depending on what features you use in your code, you may need to [specify what Node versions your project is compatible with in your `package.json`](https://docs.npmjs.com/cli/v10/configuring-npm/package-json#engines).

#### On deployment

If you run into an error while deploying, the first thing to do is to check the build logs. Finding the build logs should be easy; it's the stream of output you'll see after kicking off a new deployment.

Scroll through these logs and find the point where the deployment encountered the error. It should stand out from the rest of the output and will often look like the stack traces you've already seen with JavaScript/Node. The error output will tell you exactly what went wrong.

If you don't recognize the error or what might cause it, your next step will be to copy and paste it into your favorite online search engine. You'll likely find a Stack Overflow post with a solution. You can get support in our Discord server if searching doesn't lead to anything conclusive.

Most of the errors you'll face during this stage will be related to properly setting up your app with what your hosting provider needs. Double-checking the deployment guide for your hosting provider is always a good place to start. It's very easy to miss a step or mistype something.

#### After deployment

You've just deployed your app successfully; everything is going your way, and this will be a great day! However, when you visit your app... you are greeted with the dreaded 500 page.

Nothing induces panic in a developer quite like a 500 page. It could mean just about anything. Error pages in production are deliberately vague to let users know something went wrong without all the overwhelming technical jargon. Another important reason is to prevent attackers from using errors in your system to their advantage.

You have a few tools at your disposal to help you diagnose the problem. The first is the application logs.

The application logs are the output of your application as it's running. It tells you what's happening with your app as it's happening. All the incoming requests and database queries are recorded, and you can see them being recorded in real-time.

So if you're getting a 500 error, you can open up the logs and watch them closely as you refresh the page on your app in the browser to reproduce the error. This will either tell you exactly what the problem is or generate some leads you can use to dig further.

#### Going further with troubleshooting tools

As your application grows, you'll want to get more sophisticated with your error-tracking tools. For example, you can use services like [Sentry](https://sentry.io/) to track and monitor errors using a slick, easy-to-use interface and get notified when they happen.

These services will give you more information about the error and the request that caused it, saving you a ton of time. However, setting up and using these services are out of the scope of this lesson. You can get by just fine with the logs for your first few apps.

#### One final tip

If something has broken in your latest deployment after successful deployments in the past, backtrack to the last working version to determine what changes you made and slowly reintroduce those changes again if you need to.

This will be where the Git skills you've been learning will start to really pay off and save you an immense amount of time. You'll be able to use `git log` to see the history of your latest changes and `git checkout` to revert to a previous working version quickly.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Deploy your [Mini Message Board project](https://www.theodinproject.com/lessons/node-path-nodejs-mini-message-board) to one of the hosting providers we've mentioned. Any of the free options will work for curriculum purposes, so it doesn’t matter which you pick for your projects. The important thing to take away from this first deployment is getting experience deploying. Don’t worry if you don’t understand everything that’s happening. That will come with time.
   - Use one of the linked deploy guides for your PaaS provider to help you through the process.
   - If you're having trouble deploying, check out the [Debugging and Troubleshooting Deployments](#debugging-and-troubleshooting-deployments) section for some tips.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What's the difference between static and dynamic websites?](#static-vs-dynamic-sites)
- [What does 'PaaS' stand for?](#what-is-a-paas)
- [What are the advantages of using a PaaS hosting provider?](#what-is-a-paas)
- [What is an instance?](#instances)
- [What steps can you take to diagnose an issue that arises during deployment?](#on-deployment)
- [What steps can you take to diagnose an issue that only appears after deployment?](#after-deployment)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [free-for.dev](https://free-for.dev/). This is a huge repository for list of software such as SaaS, PaaS, IaaS, etc. and other offerings with free developer tiers.
