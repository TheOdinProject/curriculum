### Introduction
"Responsive Design" is an incredibly important concept when it comes to developing for the web. In many ways, you are already equipped to create beautiful responsive websites. In this section we're going to fill in the gaps.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn what "Responsive Design" is and why it's important.

### Terminology
"Responsive Design" is the term used to describe creating websites that _respond_ to changes in browser size in order to create something that works on any device. Unfortunately, that phrase is a little bit misleading, due to the word 'design'. These lessons are not going to focus much on the actual _design_ of responsive websites, but the techniques you can use to implement responsiveness on websites.

The word 'design' refers to making decisions about what kinds of things look nice, crafting a user experience, and deciding exactly what a project should look like. There might be some tidbits about that sprinkled throughout these lessons, but it is not the primary focus. _However_, since this phrase has been pretty much universally adopted, it's the phrase we'll use here.

### So what is it?
 Since the release of the first iPhone in 2007, it has become a _requirement_ that your web projects function correctly on everything from normal desktop monitors to tiny phone screens.

As you have likely discovered, this kind of responsiveness doesn't often happen automatically, especially once your projects get more complex than simple text on a page (your first HTML-only recipe project probably worked just fine on a phone, aside from the images getting cut off). So, when it comes down to it, <span id='what-is-responsive-design'>"Responsive Web Design" is a set of techniques you can use to make your sites work on any size screen.</span> 

There are ways to make your designs flexible enough that they work well on most screens, and there are ways to dramatically change the layout of your page at certain sizes. You'll probably end up relying on both in most of your projects.

### What screens sizes should you support?
The smallest phones in common circulation rarely get smaller than `320px`, so that should serve as a reliable lower end target. If your website works as low as `320px` width, then it should work on any small device. The upper limit is a little harder to clarify. These days super-duper-ultra-wide monitors aren't uncommon, so you should plan for the possibility that your site could be viewed on some ridiculously wide monitor. Often, this is accomplished by setting up a max-width for _all_ of your content and then centering that on the page. With a setup like that your content will look fine even on super-wide resolutions.

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [What is Responsive Design?](#what-is-responsive-design)

### Additional resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* As usual, MDN has a great article on [Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design), but it goes quite a bit deeper than we need right now.
