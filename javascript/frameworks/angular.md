### Introduction

First released back in 2012 by Google, AngularJS was the first big-hitter in Single Page Application(SPA) frameworks. A big appeal of AngularJS was its unobtrusive approach as you could control which parts of your page interacted with the AngularJS framework.

In 2016 Angular 2 was released simply named Angular. The reasoning was that this was a groundbreaking update with no backwards compatibility with AngularJS and therefore represented a new version that would be taken forwards.

The lack of backwards compatibility with AngularJS meant it lost a lot of trust with the developer community as entire applications would have to be rewritten from scratch to use the new Angular framework. Many see this as the reason React, and to a lesser extent VueJS, gained huge traction in the frontend framework space.

Since Angular's release, it has ensured no further groundbreaking changes with backwards compatibility maintained across versions.

At the time of writing version 6 has just been released.

### Overview

The first thing to know if you want to give Angular a try is that it's built with [Typescript](https://www.typescriptlang.org/), a superset of Javascript that gives you static typing, interfaces, classes, namespaces and many other features that Javascript doesn't natively support. All valid Javascript is valid Typescript so it's not a completely new language to learn but it does have some differences from traditional Javascript. If you want to learn Angular you should get familiar with Typescript.

Some of the main benefits of using Angular are:

- It's well supported on the main platforms (web, desktop and mobile)
- It's built on design pattern principles so when code is written well it remains maintainable as the project scales
- It comes with many tools out of the box that you'll need on a day to day basis. Forms, validations and AJAX requests all come with dynamic page support so you can get crafting incredibly quickly
- It encourages decoupling of concerns. This means components are injected where needed which ensures changes to parts of your application don't break other parts
- Application logic is kept away from your views keeping your HTML clean
- Testing is actively encouraged so Angular was built with unit testing and application testing support embedded.

Importantly, Angular is also actively maintained by a very large community which includes Google. Knowing your chosen framework is going to be updated to keep it current is a necessity for production applications. You can't afford to rewrite sites in a new framework often.

While there are many positives to choosing Angular there are some drawbacks.

- Because of its coupling to Typescript you will need to learn that to really grok Angular. Any examples you see online will be written in it and any support you'll receive from the community will probably assume you're using Typescript
- Angular makes good use of the command line so you'll need to delve into the Angular CLI
- The Node Package Manager(npm) is used extensively so you'll need a firm grasp of that
- Tests can become very complex but essential when the app grows so you need a solid understanding of test principles

Aside from Angular's coupling to Typescript all those other drawbacks can be found in other frameworks too so they aren't necessarily a reason to avoid Angular.

Probably the biggest drawback is that Angular is a huge and complex framework (think Rails compared to Sinatra) so it can have a long learning curve to master and may feel like overkill for small projects you'll make yourself.

### Getting Started

The easiest way to get started is to follow the guide on the [Angular Site](https://angular.io/guide/quickstart). That will take you through installation and editing your first components.

You will need node and npm installed. I personally prefer to use [nvm](https://github.com/creationix/nvm) to manage my node versions but however you want to do it is up to you.

### Assignment

1. Follow along with the getting started guide on the [Angular Site](https://angular.io/guide/quickstart) and ensure you have your environment set up correctly
2. Skim through this [Angular Fundamentals](https://angular.io/guide/architecture) guide on the architecture of an Angular app to get a high-level overview of how an app is put together
3. Try this [Angular 8 Tutorial](https://coursetro.com/posts/code/174/Angular-8-Tutorial-&-Crash-Course) to get an idea of the power of using a framework like Angular

### Additional Resources

- Angular has their [own tutorial](https://angular.io/tutorial) you can try
- [This blog](https://www.telerik.com/blogs/whats-new-in-angular-6) explains whats new in Angular 6
- These 33 free [interactive screencasts](https://scrimba.com/g/gyourfirstangularapp) by Dan Wahlin take you from beginner to advanced to help you gain a solid understanding of the Angular framework
