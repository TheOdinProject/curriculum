### Introduction

Links are one of the key features of HTML. They allow us to link to other HTML pages on the web. In fact, this is why it's called the web. The internet is essentially a web of HTML pages connected to one another with links.

In this lesson, we will learn how to create links and add some visual flair to our websites by embedding images.

### Learning Outcomes

- How to create links to pages on other websites on the internet
- How to create links to other pages on your own websites
- The difference between absolute and relative links
- How to create images in HTML

### Preparation

To get some practice using links and images throughout this lesson we need an HTML project to work with.

1. Create a new directory named `odin-links-and-images`.
2. Within that directory create a new file named `index.html`
3. Fill in the usual HTML boilerplate
4. Finally, add the following h1 to the body:

~~~html
<h1>Homepage</h1>
~~~

### Anchor Elements

To create a link in HTML, we use the anchor element. An anchor element is defined by wrapping the text or another HTML element we want to be a link with a  `<a>` tag.

Add the following to the body of the index.html page we created and open it in the browser:

~~~html
<a>click me</a>
~~~

You may have noticed that clicking this link doesn't do anything. This is because an anchor tag on its own won't know where we want to link to. We have to tell it a destination to go to. We do this by using an HTML attribute.

An HTML attribute gives additional information to an HTML element and always goes in the elements opening tag. An attribute is made up of two parts, a name, and a value. In our case, we need to add a href (hyperlink reference) attribute to the opening anchor tag. The value of the href attribute is the destination we want our link to go to.

Add the following href attribute to the anchor element we created previously and try clicking it again, don't forget to refresh the browser so the new changes can be applied.

~~~html
<a href="https://www.theodinproject.com/about">click me</a>
~~~

By default, the browser will give any text wrapped in an anchor tag a blue color and underline it to signify it is a link.

It's worth noting you can use anchor tags link to any kind of resource on the internet, not just other HTML documents. You can link to videos, pdf files, images, and so on, but for the most part, you will be linking to other HTML documents.

### Absolute and Relative Links

Generally, there are two kinds of links we will create:

1. Links to pages on other websites on the internet.
2. Links to pages located on our own websites.

#### Absolute Links

Links to pages on other websites on the internet are called absolute links. A typical absolute link will be made up of the following parts: `protocol://domain/path`. An absolute link will always contain the protocol and domain of the destination.

We've already seen an absolute link in action. The link we created to The Odin Project's About page earlier was an absolute link as it contains the protocol and domain.

`https://www.theodinproject.com/about`

#### Relative Links

Links to other pages within our own website are called relative links. Relative links do not include the domain name, since it is another page on the same site, it assumes the domain name will be the same as the page we created the link on.

Relative links only include the file path to the other page, *relative* to the page you are creating the link on. This is quite abstract, let's see this in action using an example.

Within the `odin-links-and-images` directory, create another HTML file named `about.html` and paste the following code into it:

~~~html
<!DOCTYPE html>
<html>
  <head>
    <title>Odin Links and Images</title>
    <meta charset="UTF-8">
  </head>

  <body>
    <h1>About Page</h1>
  </body>
</html>
~~~

Back in the index page, add the following anchor element to create a link to the about page:

~~~html
<body>
  <h1>Homepage</h1>
	<a href="https://www.theodinproject.com/about">click me</a>

	<a href="about.html">About</a>
</body>
~~~

Open the index file in a browser and click on the about link to make sure it is all wired together correctly. Clicking the link should go to the about page we just created.

This works because the index and about page are in the same directory. That means we can simply use the name of the about.html file `about.html` as the value of the href in the link.

But we will usually want to organize our website directories a little better. Normally we would only have the index.html at the root directory and all other HTML files in their own directory.

Create a directory named `pages` within the `odin-links-and-images` directory and move the `about.html` file into this new directory.

Refresh the index page in the browser and then click on the about link. It will be now be broken. This is because the location of the about page file has changed.

To fix this, we just need to update the about link href value to include the `pages/` directory since that is the new location of the about file *relative* to the index file.

~~~html
<body>
  <h1>Homepage</h1>
  <a href="pages/about.html">About</a>
</body>
~~~

Refresh the index page in the browser and try clicking the about link again, it should now be back in working order.

#### A Metaphor

Absolute and relative links are a tricky concept to build a good mental model of, a metaphor may help:

Think of the directory a website is located in as a house and each page on the website as a room in that house. Relative links are directions from the room you are currently in (the bedroom) to another room (the kitchen). Absolute links on the other hand, are directions to an entirely different house.

### Images

Websites would be fairly boring if they could only display text. Luckily HTML provides a wide variety of elements for displaying all sorts of different media. The most widely used of these is the image element.

To create an image in HTML we use the `<img>` element. Unlike the other elements we have encountered so far, the `<img>` element is empty. Which means it doesn't have a closing tag.

Instead of wrapping content with an open and closing tag, it embeds an image into the page using a src attribute which tells the browser where the image file is located. The src attribute works much like the href attribute for anchor tags. It can embed an image using both absolute and relative paths.

For example, using an absolute path we can display an image located on The Odin Project site:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="gORbExZ" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/gORbExZ">
  absolute-path-image</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

To use images that we have on our own websites, we can use a relative path.

1. Create a new directory named `images` within the `odin-links-and-images` project.
2. Next, download [this image](https://unsplash.com/photos/Mv9hjnEUHR4/download?force=true&w=640) and move it into the images directory we just created.
3. Rename the image to `dog.jpg`

Finally add the image to the `index.html` file:

~~~html
<body>
  <h1>Homepage</h1>
	<a href="https://www.theodinproject.com/about">click me</a>

	<a href="pages/about.html">About</a>

	<img src="images/dog.jpg">
</body>
~~~

Save the `index.html` file and open it in a browser to view Charles in all his glory.

### Parent Directories
What if we want to use the dog image in the about page? we would first have to go up one level out of the pages directory into its parent directory so we could then access the images directory.

To go to the parent directory we need to use two dots in the relative filepath like this: `../`. Lets see this in action, within the body of the `about.html` file, add the following image below the heading we added earlier:

~~~html
<img src="../images/dog.jpg">
~~~

To break this down:

1. First we are going to the parent directory of the pages directory which is `odin-links-and-images`.
2. Then from the parent directory, we can go into the `images` directory.
3. Finally we can access the `dog.jpg` file.

Using the metaphor we used earlier, using `../` in a filepath is kind of like stepping out from the room you are currently in to the main hallway so you can go to another room.

### Alt attribute

Besides the src attribute, every image element should also have an alt(alternative text) attribute.

The alt attribute is used to describe an image, it will be used in place of the image if it cannot be loaded. It is also used with screen readers to describe what the image is to visually impaired users.

This is how the The Odin Project logo example we used earlier looks with an alt attribute included:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="ExXjoEp" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/ExXjoEp">
  image-alt-attribute</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

As a bit of practice, add an alt attribute to the dog image we added to the `odin-links-and-images` project.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. [Watch Kevin Powell's HTML Links video](https://www.youtube.com/watch?v=tsEQgGjSmkM&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=5)
2. [Watch Kevin Powell's HTML Images Video](https://www.youtube.com/watch?v=0xoztJCHpbQ&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=6)
3. [Watch Kevin Powell's File Structure Video](https://www.youtube.com/watch?v=ta3Oxx7Yqbo&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=7)
4. [Read about the four main image formats that can used on the web](https://www.internetingishard.com/html-and-css/links-and-images/#image-formats)
</div>

### Additional Resources
This section contains helpful links to other content.  It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [Interneting is hards treatment on HTML links and images](https://www.internetingishard.com/html-and-css/links-and-images/)

### Knowledge Check

- What element is used to create a link?
- What is an attribute?
- What attribute tells links where to go to?
- What is the difference between an absolute and relative link?
- What element is used to create an image?
- What two attributes do images always need to have?
- How do you access a parent directory in a filepath?
- What are the four main image formats that you can use for images on the web?
