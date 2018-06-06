# Front-end Frameworks

By this point you will probably already have heard about JavaScript frameworks such as React, Angular and Vue.  While we aren't going to spend too much time teaching you all the details of each of these frameworks, knowing a bit about them and how to get started with one of them is crucial in todays web-dev world.  Almost every major web app that is being built today will use a framework of some sort and almost every front-end job posting mentions at least one of them.

## What _is_ a framework?

Essentially, a framework is some JS code that makes it faster and easier to write interactive webapps with reusable components.  If you have completed odin assignments such as the restaurant page, the library or the todo-list you will know that doing things like this with plain-JS can be a rather time consuming process filled with `document.createElement` and `element.innerHTML`.  Frameworks try to make this much easier, much quicker and much more sustainable.

The various frameworks (there _are_ a lot of them) tend to have a few things in common.  In general, any given JS framework will have at least some sort of templating system that allows you to create reusable components.  Components can be thought of as building-blocks that you use to build your project.  For example, you could have a `header` and a `footer` component that you re-use on various pages, or you could have something like a `card` component that essentially wraps whatever you put inside of it with a div and a nice box-shadow or border.

Imagine the power of being able to do something like this as many times as you like across your whole project to get a nice looking card:
~~~
<my-card-component>
  <h1>Card title</h1>
  <p>Card Content</p>
</my-card-component>
~~~

The way that this is accomplished obviously differs greatly between frameworks, but re-usuable components is one of the big selling points of learning about them.

Most frameworks also include some sort of state-management system.  State management means that your components can know things about the state of your application and then present themselves differently based on  that state.  For example, if you have a header component with a `log-in` button, you would want for that component to know whether or not a user is logged in, and you would probably want to hide the `log-in` button (or replace it with a `log-out` button) if a user has logged in.  Somewhere in your app (again, this will differ **greatly** from framework to framework) you will have a variable like `user-is-logged-in` that you can change, and then see that change reflected in your header-component.

Different frameworks will have various other tools built-in, or easily included with plugins such as routing, (changing the view based on the URL) rendering arrays as lists, (Imagine creating a `<ul>` filled with `<li>`s by passing your template an array rather than repeating the `<li>` tag 100 times) and animation.  So, in essense, the point of frameworks is to make creating complex and robust web applications much easier.

## Which framework then?

It's no secret that there are a _ton_ of Front-end frameworks in the world... so selecting one to learn is a daunting process.  Here's an incomplete and unordered list of JS frameworks for your perusal. 

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

Picking which framework to learn then, comes down to a few considerations.  First, and probably most importantly is your goal in learning.  If you are looking to get a job or internship as soon as possible then you are going to want to look at which framework comes up the most often in job-postings in your area.  If you are looking to pick up a framework quickly to build a side-project, then you might consider which one seems easiest to learn, or quickest for getting started... if none of that matters to you then  you can just pick whichever one suits your preferences at the moment.

The good news is that it doesn't _really_ matter all that much which framework you select.  Most of the big ones are similar enough that once you've learned one well transitioning to another one is relatively simple. If you've already mastered React, for example, but then notice job-postings that ask for experience with Vue, you will likely be able to pick up Vue and start using it in less than a week.

The rest of this section will go through the 3 most popular front-end frameworks (React, Angular and Vue), tell you a bit about them and offer resources to get you started.



## Assignment

- Spend a little time poking around the sites for various frameworks, to get a feel for what's out there (the list above is a good place to start).  
- Check out [this recent survey](https://stateofjs.com/2017/front-end/results/) to get a feel for the general popularity and usage of the various frameworks.
- [This survey](https://insights.stackoverflow.com/survey/2018/#technology) is not JS or web centered, but includes some data about frameworks.
- [This video](https://www.youtube.com/watch?v=KMX1mFEmM3E&t=676s) gives a good overview and comparison of the 'big 3'.