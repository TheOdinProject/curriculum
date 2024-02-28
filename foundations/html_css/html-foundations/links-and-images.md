### Introduction

Links are one of the key features of HTML. They allow us to link to other HTML pages on the web. In fact, this is why it's called the web.

In this lesson, we will learn how to create links and add some visual flair to our websites by embedding images.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to create links to pages on other websites on the internet.
- How to create links to other pages on your own websites.
- The difference between absolute and relative links.
- How to display an image on a webpage using HTML.

### Preparation

To get some practice using links and images throughout this lesson we need an HTML project to work with.

1. Create a new directory named `odin-links-and-images`.
1. Within that directory, create a new file named `index.html`.
1. Open the file in VS Code and fill in the usual HTML boilerplate.
1. Finally, add the following h1 to the body:

```html
<h1>Homepage</h1>
```

### Anchor elements

To create a link in HTML, we use the anchor element. An anchor element is defined by wrapping the text or another HTML element we want to be a link with an `<a>` tag.

Add the following to the body of the `index.html` page we created and open it in the browser:

```html
<a>click me</a>
```

You may have noticed that clicking this link doesn't do anything. This is because an anchor tag on its own won't know where we want to link to. We have to tell it a destination to go to. We do this by using an HTML attribute.

<span id="attribute"></span>An HTML attribute gives additional information to an HTML element and always goes in the element's opening tag. An attribute is usually made up of two parts: a name, and a value; however, not all attributes require a value. <span id="where-to-go"></span>In our case, we need to add an href (hypertext reference) attribute to the opening anchor tag. The value of the href attribute is the destination we want our link to go to.

Add the following href attribute to the anchor element we created previously and try clicking it again, don't forget to refresh the browser so the new changes can be applied.

```html
<a href="https://www.theodinproject.com/about">click me</a>
```

By default, any text wrapped with an anchor tag without an `href` attribute will look like plain text. If the `href` attribute is present, the browser will give the text a blue color and underline it to signify it is a link.

It's worth noting you can use anchor tags to link to any kind of resource on the internet, not just other HTML documents. You can link to videos, pdf files, images, and so on, but for the most part, you will be linking to other HTML documents.

### Opening links in a new tab

The method shown above opens links in the same tab as the webpage containing them. This is the default behaviour of most browsers and it can be changed relatively easily. All we need is another attribute: the `target` attribute.

While `href` specifies the destination link, `target` specifies where the linked resource will be opened. If it is not present, then, by default, it will take on the `_self` value which opens the link in the current tab. To open the link in a new tab or window (depends on browser settings) you can set it to `_blank` as follows:

```html
<a href="https://www.theodinproject.com/about" target="_blank" rel="noopener noreferrer">click me</a>
```

<span id="target-security"></span>You may have noticed that we snuck in the `rel` attribute above. This attribute is used to describe the relation between the current page and the linked document.

The `noopener` value prevents the opened link from gaining access to the webpage from which it was opened. The `noreferrer` value prevents the opened link from knowing which webpage or resource has a link (or 'reference') to it. It also includes the `noopener` behaviour and thus can be used by itself as well.

Why do we need this added behaviour for opening links in new tabs? Security reasons. The prevention of access that is caused by `noopener` prevents [phishing attacks](https://www.ibm.com/topics/phishing) where the opened link may change the original webpage to a different one to trick users. This is referred to as [tabnabbing](https://owasp.org/www-community/attacks/Reverse_Tabnabbing). Adding the `noreferrer` value can be done if you wish to not let the opened link know that your webpage links to it.

Note that you may be fine if you forget to add `rel="noopener noreferrer"` since more recent versions of browsers [provide this security](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#security_and_privacy) if only `target="_blank"` is present. Nevertheless, in line with good coding practices and to err on the side of caution, it is recommended to always pair a `target="_blank"` with a `rel="noopener noreferrer"`.

### Absolute and relative links

Generally, there are two kinds of links we will create:

- Links to pages on other websites on the internet.
- Links to pages located on our own websites.

#### Absolute links

Links to pages on other websites on the internet are called absolute links. A typical absolute link will be made up of the following parts: `protocol://domain/path`. An absolute link will always contain the protocol and domain of the destination.

We've already seen an absolute link in action. The link we created to The Odin Project's About page earlier was an absolute link as it contains the protocol and domain.

`https://www.theodinproject.com/about`

#### Relative links

Links to other pages within our own website are called relative links. Relative links do not include the domain name, since it is another page on the same site, it assumes the domain name will be the same as the page we created the link on.

Relative links only include the file path to the other page, *relative* to the page you are creating the link on. This is quite abstract, let's see this in action using an example.

Within the `odin-links-and-images` directory, create another HTML file named `about.html` and paste the following code into it:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Odin Links and Images</title>
  </head>

  <body>
    <h1>About Page</h1>
  </body>
</html>
```

Back in the index page, add the following anchor element to create a link to the about page:

```html
<body>
  <h1>Homepage</h1>
  <a href="https://www.theodinproject.com/about">click me</a>

  <a href="about.html">About</a>
</body>
```

Open the index file in a browser and click on the about link to make sure it is all wired together correctly. Clicking the link should go to the about page we just created.

This works because the index and about page are in the same directory. That means we can use its name (`about.html`) as the link's href value.

But we will usually want to organize our website directories a little better. Normally we would only have the `index.html` at the root directory and all other HTML files in their own directory.

Create a directory named `pages` within the `odin-links-and-images` directory and move the `about.html` file into this new directory.

Refresh the index page in the browser and then click on the about link. It will now be broken. This is because the location of the about page file has changed.

To fix this, we just need to update the about link href value to include the `pages/` directory since that is the new location of the about file *relative* to the index file.

```html
<body>
  <h1>Homepage</h1>
  <a href="pages/about.html">About</a>
</body>
```

Refresh the index page in the browser and try clicking the about link again, it should now be back in working order.

In many cases, this will work just fine; however, you can still run into unexpected issues with this approach. Prepending `./` before the link will in most cases prevent such issues. By adding  `./` you are specifying to your code that it should start looking for the file/directory *relative* to the `current` directory.

```html
<body>
  <h1>Homepage</h1>
  <a href="./pages/about.html">About</a>
</body>
```

#### A metaphor

Absolute and relative links are a tricky concept to build a good mental model of, a metaphor may help:

Think of your domain name (`town.com`) as a town, the directory in which your website is located (`/museum`) as a museum, and each page on your website as a room in the museum (`/museum/movie_room.html` and `/museum/shops/coffee_shop.html`). Relative links like `./shops/coffee_shop.html` are directions from the current room (the museum movie room `/museum/movie_room.html`) to another room (the museum shop). Absolute links, on the other hand, are full directions including the protocol (`https`), domain name (`town.com`) and the path from that domain name (`/museum/shops/coffee_shop.html`): `https://town.com/museum/shops/coffee_shop.html`.

### Images

Websites would be fairly boring if they could only display text. Luckily HTML provides a wide variety of elements for displaying all sorts of different media. The most widely used of these is the image element.

To display an image in HTML we use the `<img>` element. Unlike the other elements we have encountered, the `<img>` element is self-closing. Empty, self-closing HTML elements do not need a closing tag.

Instead of wrapping content with an opening and closing tag, it embeds an image into the page using a src attribute which tells the browser where the image file is located. The src attribute works much like the href attribute for anchor tags. It can embed an image using both absolute and relative paths.

For example, using an absolute path we can display an image located on The Odin Project site:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="gORbExZ" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/gORbExZ">
  absolute-path-image</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

To use images that we have on our own websites, we can use a relative path.

<details markdown="block">
<summary class="dropDown-header">Linux, macOS, ChromeOS
</summary>

1. Create a new directory named `images` within the `odin-links-and-images` project.
1. Next, download [this image](https://unsplash.com/photos/Mv9hjnEUHR4/download?force=true&w=640) and move it into the images directory we just created.
1. Rename the image to `dog.jpg`.

</details>

<details markdown="block">
<summary class="dropDown-header">WSL2
</summary>

When you download a file from the internet, Windows has a security feature that creates a hidden `Zone.Identifier` file with the same name as your downloaded file and it looks like `mypicture.jpg:Zone.Identifier` This file is harmless, but we'd like to avoid copying it over and cluttering up our directories.

1. Create a new directory named `images` within the `odin-links-and-images` project.

1. Next, [download the stock dog image](https://unsplash.com/photos/Mv9hjnEUHR4/download?force=true&w=640).

1. Right click on the new download at the bottom of the chrome window and select "Show in folder".

   1. Alternatively, if you do not see anything at the bottom of the chrome window, open the "Customize and control Google Chrome kebab menu and select the "Downloads" item. This will show all of your downloads, each with its own "Show in folder" button.

1. Drag the file from your downloads folder to VSCode's file browser into your new `images` directory.

    1. Alternatively, using your Ubuntu terminal, navigate to the folder you want to copy the image to (`cd ~/odin-links-and-images` for example)

    1. Type `cp <space>`

    1. Drag the `dog.jpg` image from a Windows Explorer window and drop it onto the terminal window, it should appear as `"/mnt/c/users/username/Downloads/dog.jpg"`

    1. Type `<space> .` to tell cp that you want to copy the file to your current working directory.

        1. The full command will look something like `cp "/mnt/c/users/username/Downloads/dog.jpg" .`

    1. Hit <kbd>Enter</kbd> to complete the command, and use ls to confirm the file now exists.

Dragging files from Windows into the VSCode file browser prevents the `Zone.Identifier` files from being copied over. From now on, any time you need to copy pictures or other downloaded files like this into WSL2, you can do it in this way. If you ever accidentally copy these `Zone.Identifier` files into WSL2, you can safely delete them without any issue.

</details>

Finally add the image to the `index.html` file:

```html
<body>
  <h1>Homepage</h1>
  <a href="https://www.theodinproject.com/about">click me</a>

  <a href="./pages/about.html">About</a>

  <img src="./images/dog.jpg">
</body>
```

Save the `index.html` file and open it in a browser to view Charles in all his glory.

### Parent directories

What if we want to use the dog image in the about page? We would first have to go up one level out of the pages directory into its parent directory so we could then access the images directory.

<span id="parent-filepath"></span>To go to the parent directory we need to use two dots in the relative filepath like this: `../`. Let's see this in action, within the body of the `about.html` file, add the following image below the heading we added earlier:

```html
<img src="../images/dog.jpg">
```

To break this down:

1. First, we are going to the parent directory of the pages directory which is `odin-links-and-images`.
1. Then, from the parent directory, we can go into the `images` directory.
1. Finally, we can access the `dog.jpg` file.

Using the metaphor we used earlier, using `../` in a filepath is kind of like stepping out from the room you are currently in to the main hallway so you can go to another room.

### Alt attribute

<span id="two-attributes"></span>Besides the src attribute, every image element must also have an alt (alternative text) attribute.

The alt attribute is used to describe an image. It will be used in place of the image if it cannot be loaded. It is also used with screen readers to describe what the image is to visually impaired users.

This is how the The Odin Project logo example we used earlier looks with an alt attribute included:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="ExXjoEp" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/ExXjoEp">
  image-alt-attribute</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

As a bit of practice, add an alt attribute to the dog image we added to the `odin-links-and-images` project.

### Image size attributes

While not strictly required, specifying height and width
attributes in image tags helps the browser layout the page without causing the page to jump and flash.

It is a good habit to always specify these attributes on every image, even when the image is the correct size or you are using CSS to modify it.

Here is our Odin Project logo example with height and width tags included:

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="PoXJKvy" data-user="FabulousPBB" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/FabulousPBB/pen/PoXJKvy">
  Image Height and Width Attributes</a> by Brian Lister (<a href="https://codepen.io/FabulousPBB">@FabulousPBB</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Go ahead and update the `odin-links-and-images` project with width and height tags on the dog image.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [Watch Kevin Powell's HTML Links Video](https://www.youtube.com/watch?v=tsEQgGjSmkM&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=5).
1. [Watch Kevin Powell's HTML Images Video](https://www.youtube.com/watch?v=0xoztJCHpbQ&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=6).
1. [Watch Kevin Powell's File Structure Video](https://www.youtube.com/watch?v=ta3Oxx7Yqbo&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=7).
1. [Read about the four main image formats that can be used on the web](https://internetingishard.netlify.app/html-and-css/links-and-images/#image-formats).

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What element is used to create a link?](#anchor-elements)
- [What is an attribute?](#attribute)
- [What attribute tells links where to go to?](#where-to-go)
- [What security considerations must be taken if you wish to use the target attribute to open links in a new tab/window?](#target-security)
- [What is the difference between an absolute and relative link?](#absolute-and-relative-links)
- [Which element is used to display an image?](#images)
- [What two attributes do images always need to have?](#two-attributes)
- [How do you access a parent directory in a filepath?](#parent-filepath)
- [What are the four main image formats that you can use for images on the web?](https://internetingishard.netlify.app/html-and-css/links-and-images/#image-formats)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [Interneting is hard's treatment on HTML links and images](https://internetingishard.netlify.app/html-and-css/links-and-images)
- [What happened the day Google decided links including (`/`) were malware](https://www.itpro.co.uk/609724/google-apologises-after-blacklisting-entire-internet)
- [Chris Coyier's When to use target="_blank" on CSS-Tricks](https://css-tricks.com/use-target_blank/)
