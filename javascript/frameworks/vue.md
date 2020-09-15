### Introduction

VueJS was created by Evan You, it's the youngest of the popular frameworks, but it's quickly rising popularity proves that it's worth paying attention to. Vue is known for being one of the easiest frontend frameworks to learn while still having the same scalable power as other popular frameworks.

### Overview

Vue is awesome (and easy to learn) because it utilizes what already exists on the web. The Vue way is to use real html and css to build applications, you do not need to learn anything new such as JSX. Vue components have a very clean structure. A medium to large Vue application will usually be structured in single-file components and the separation of concerns `template` (html) `script` (javascript) and `style` (css) makes it a dream to work with, keeping your code organized and clean. Here is an example from the official Vue docs of what a "hello world" single-file component would look like:
![image](https://vuejs.org/images/vue-component.png)
The Vue ecosystem is another reason for its popularity. Unlike other frameworks that utilize external libraries to integrate state management or router for example, Vue has official libraries for most of these which were developed by the Vue team themselves, such as Vuex (comparable to redux), vue-router (comparable to react-router). All these are great reasons to pick this amazing framework as your frontend main tool. 
One downside is that unlike the other popular frameworks, Vue was not created nor is it backed by a large company (although it has significant support by large companies). Therefore, depending on where you are in the world, the job demand for Vue is noticeably lower than React and Angular.

### Getting Started

You can quickly start playing around with vue via the cdn by including 
```html
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
```
in your project, jsfiddle or codepen. You can follow the installation project [here](https://vuejs.org/v2/guide/installation.html#CDN). This is perfect for small projects, if you just want to manipulate only certain parts of the dom (\*cough\* replace jquery \*cough\*) .

For complete Vue projects you can use the [vue-cli](https://github.com/vuejs/vue-cli) by installing it `npm install -g @vue/cli` or `yarn global add @vue/cli` and easily create a project with `vue create name-of-your-project` or `vue ui`.

### Assignment

1. Read the 'Getting started' in the [official Vue doc](https://vuejs.org/v2/guide/index.html#Getting-Started), specially check out the "declarative rendering" section and try it out in JSFiddle or CodePen.
2. Check out this awesome complete getting started blog guide [here](https://www.sitepoint.com/up-and-running-vue-js-2-0/). Read the first three sections including "Writing Our First Vue.js 2.0 App" and follow along to see how easy it is, and if you find it nice I definitely recommend reading the whole thing.

### Additional Resources

- [This massive udemy course](https://www.udemy.com/vuejs-2-the-complete-guide/) is not free, but will teach you pretty much everything you need to learn about Vue, and you can often get Udemy courses for a decent discount.
- Learn Vue for free in [laracasts](https://laracasts.com/series/learn-vue-2-step-by-step)
- Here is a [free crash course on vue](https://www.youtube.com/watch?v=78tNYZUS-ps) just to show you can learn vue in about 2 hours.
- [Here](https://www.youtube.com/watch?v=KMX1mFEmM3E&t=687s) is a nice video comparing all the popular frontend frameworks.
