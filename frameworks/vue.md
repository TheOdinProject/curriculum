# Introduction

VueJS was created by Evan You, it's the youngest of the popular frameworks, but it's quickly rising popularity proves that it's worth paying attention to. Vue is known for being one of the easies frontend framework to learn while still having the same scalable power as all the other popular existing frameworks.

# Overview

The reason why Vue is so awesome and easy to learn, is because it utilizes what already exists in the web. The Vue way is to use real html and css to build application, you do not need to learn anything new such as JSX for example, although you can integrate it if that is what you want. Vue has a very clean structure for its components, a medium to large Vue application will usually be structured in single file components and the separation of concerns `template` (html) `script` (javascript) and `style` (css) is why the framework is loved, keeping your code organized and clean. Here is an example from the official Vue docs of what a "hello world" single file component would look like:
![image](https://vuejs.org/images/vue-component.png)
Another reason why it is a great choice, is due to its ecosystem, Unlike other frameworks that utilize external libraries to integrate state management or router for example, Vue has official libraries for most of these which were developed by the Vue team themselves, such as Vuex (comparable to redux), vue-router (comparable to react-router) and others more. All these are great reason to pick this amazing framework as your frontend main tool. Since not everything can be perfect, let's talk about downside. Unlike the other popular frameworks, Vue was not created nor is it backed by a large company (although it has significant support by large companies). Therefore, depending on where you are in the world, it is highly likely that you will not find many jobs demanding Vue.

# Getting Started

You can quickly start playing around with vue via the cdn by including 
```html
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
```
in your project, jsfiddle or codepen. You can follow the installation project [here](https://vuejs.org/v2/guide/installation.html#CDN). This is perfect for small projects, if you just want to manipulate only certain parts of the dom (\*cough\* replace jquery \*cough\*) .

For complete Vue projects you can use the [vue-cli](https://github.com/vuejs/vue-cli) by installing it `yarn global add @vue/cli` and easily create a project with `vue create name-of-your-project`.

# Assignment

- Read the 'Getting started' in the [offial vue doc](https://vuejs.org/v2/guide/index.html#Getting-Started), specially check out the "declarative rendering" section and try it out in jsfiddle of codepen.
- Check out this awesome complete getting started blog guide [here](https://www.sitepoint.com/up-and-running-vue-js-2-0/). Read the first three section including "Writing Our First Vue.js 2.0 App" and follow along to see how easy it is, and if you find it nice I definitely recommend reading the whole thing.
# Additional Resources
- Learn Vue for free in [laracasts](https://laracasts.com/series/learn-vue-2-step-by-step)
- Here is a [free crash course on vue](https://www.youtube.com/watch?v=78tNYZUS-ps) just to show you can learn vue in about 2 hours.
- [Here](https://www.youtube.com/watch?v=KMX1mFEmM3E&t=687s) is a nice video comparing all the popular frontend frameworks.
