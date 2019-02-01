## Front-end Frameworks

By this point you have probably heard about JavaScript frameworks such as React, Angular or Vue. Almost all major web apps being built today use frameworks and many job postings ask for experience with at least one of them. But what are they? We aren't going to spend too much time teaching you all the nitty-gritty details of each of these frameworks, but knowing what they do and how to get started with one of them is crucial in todays web-dev world.

### What _is_ a framework?

Essentially a framework is some JS code that makes it faster and easier to write interactive web apps with reusable components. If you have completed odin assignments such as the restaurant page, the library, or the todo-list you will know that you spend a lot of time manipulating the DOM with code like `document.createElement` or `element.innerHTML`. Previously you had to manually keep the UI and state in sync by updating the UI everytime your state changed. Something you may have already noticed can quickly become a very verbose and by nature error-prone task. This is where JS framewworks come to the rescue. The frameworks will automatically sync the UI with your state when it changes in an efficient manner. All the tedious code you had to write manually is now abstracted away letting you focus on more productive things.

How is it done? You define your markup in a single shot in declarative paradigm (means that you declare _what_ it should do instead of _how_ - the framework will handle the _how_ part. The frameworks then use different strategies to detect changes and update the UI. We will not dive futher into these strategies for now but further reading can be found in the additional resources.

Why is it so crucial to keep the state and UI in sync you may ask? Because showing inaccurate information or even wrong information in the UI can lead to undesired behaviour like deleting the wrong item and ultimately leaving your end user frustrated. The compromised user experience directly affects how the end user feels about your product and can affect conversion rates (getting the user to complete a desired task) negatively.

The various frameworks (there _are_ a lot of them) tend to have a few things in common.  In general any given JS framework will have at least some sort of templating system that allows you to create reusable components (A templating system is nothing more than the ability to create bits of code that you can reuse). These components can be thought of as building-blocks that you use to build your project.  For example, you could have a `header` and a `footer` component that you re-use on all your pages, or you could have something like a `card` component that nicely wraps whatever you put inside of it with a div and a box-shadow or border.

Imagine the power of being able to do something like this as many times as you like across your whole project to get a nice looking card:

~~~
<my-card-component>
  <h1>Card title</h1>
  <p>Card Content</p>
</my-card-component>
~~~

The way that these components are created differs greatly between frameworks, but re-usuable components are the foundation of all frameworks.

Most frameworks also include some sort of state-management system.  State management means that your components can know certain things about the current environment and then present themselves differently based on those variables.  For example if you have a header component with a `log-in` button you would want to show it only when the user is not logged in (or replace it with a `log-out` button). Somewhere in your app (again, this will differ **greatly** from framework to framework) you will have a variable like `user-is-logged-in` that you can use to change the header-component content.

Different frameworks will have various other tools built-in (or easily included with plugins) such as routing, (changing the view based on the URL) rendering arrays as lists, and animation. In essense frameworks make creating complex and robust web applications much easier.

### Which framework then?

It's no secret that there are a _ton_ of Front-end frameworks in the world... so selecting one to learn is a daunting process.  Here's an incomplete and unordered list of JS frameworks you may have heard of. 

- [React](https://reactjs.org/)
- [Angular](https://angular.io/)
- [Vue](https://vuejs.org/)
- [Preact](https://preactjs.com/)
- [Svelte](https://svelte.technology/guide)
- [Inferno](https://infernojs.org/)
- [Ember](https://www.emberjs.com/)
- [HyperApp](https://github.com/hyperapp)
- [Polymer](https://www.polymer-project.org/)
- [Meteor](https://www.meteor.com/)
- [Aurelia](https://aurelia.io/)

Picking which framework to learn comes down to a few considerations.  First and probably most importantly is your goal in learning.  If you are looking to get a job or internship as soon as possible then you are going to want to look at which framework occurs most frequently in job-postings in your area.  If you are looking to pick up a framework quickly to build a side-project, then you might consider which one seems easiest to getting started. If none of that matters to you then you can just pick whichever one suits your preferences at the moment.

The good news is that it doesn't _really_ matter which framework you select.  Most of the big ones are similar enough that once you've learned one transitioning to another is relatively simple. If you've already mastered React, for example, but then notice job-postings that ask for experience with Vue, you will likely be able to pick up Vue and start using it in less than a week.

The rest of this section will go through the 3 most popular front-end frameworks (React, Angular and Vue), tell you a bit about them, and offer resources to get you started.

### Assignment

1. Spend a little time poking around the sites for various frameworks above to get a feel for what's out there.
2. Check out [this recent survey](https://2017.stateofjs.com/2017/front-end/results) to get a feel for the general popularity and usage of the various frameworks.
3. [This survey](https://insights.stackoverflow.com/survey/2018/#technology) is not JS or web centered, but includes some data about frameworks.
4. [This video](https://www.youtube.com/watch?v=KMX1mFEmM3E) gives a good overview and comparison of the 'Big 3'.

### Additional Resources

* [A blogpost diving into why frameworks exist](https://medium.com/dailyjs/the-deepest-reason-why-modern-javascript-frameworks-exist-933b86ebc445)
