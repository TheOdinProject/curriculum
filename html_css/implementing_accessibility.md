### Introduction

In the previous lesson, you learned a few things about web accessibility: what it means, how a lack of it can negatively affect users, and the basics of the guidelines that help us implement it. With all of that information, plus some of the things you'll be learning in this lesson, you may start to feel overwhelmed and think that if you don't immediately make your site totally accessible that you've somehow failed.

**No site will ever be 100% accessible**, so don't try to aim for such an impossible goal. Sometimes the purpose or concept of a site even requires some things to not be accessible in certain ways. It's taking small steps at first and then making a site as accessible as possible in the long-run that matters. So don't feel like you have to make everything perfect when implementing accessibility, especially when you're just starting out. What you may think is a small addition could actually be a huge improvement for more users than you realize.

#### Before continuing...

This lesson and the following lesson won't cover every single accessibility feature, WCAG success criterion, or scenario you'll run into. We're focusing on some of the more common or basic things that will help you take those first steps to implement accessibility. At this point you should be in the habit of conducting your own research, so looking into other ways to make your websites more accessible should be easy, especially with some of the resources we'll be providing you.

You'll also see a lot of mentions of the term "assistive technologies", which may usually refer to screen readers. The brand of assistive technology or the browser can affect what is actually announced to a user. The version of either the technology or browser can also be a factor, which is why some users might be hesitant to upgrade or update. Just keep in mind that while there might be some differences depending on brand, browser, or version, the point is to give you a general understanding for how users of these assistive technologies may perceive a web page.

### Learning Outcomes
By the end of this lesson, you should be able to:

* Explain why semantic HTML is important for accessibility.
* Name the seven HTML elements that define landmarks on a page.
* Understand how colors can affect how perceivable a website is.
* Know how to make a website more easily operable for keyboard users.
* Know how to make a website more easily understandable with meaningful text.
* Know how to provide better `alt` attributes for images.

### Semantic HTML

In terms of web accessibility, the importance of semantic HTML is that it provides meaning and context. Some elements have a semantic meaning, but don't really provide a context when announced by assistive technologies, such as the `<p>` element. Other elements have a semantic meaning and are announced with some sort of context to help users perceive or operate them, like a `<button>`. The `<div>` and `<span>` elements, most likely two of the more common elements you use, are semantically neutral; that is, they themselves have no semantic meaning and provide no context on their own.

Think of any project you may have completed that required a user to click on something: Rock, Paper, Scissors; Calculator; Tic-Tac-Toe. If you used `<div>` or `<span>` elements for any clickable areas, things most likely worked as intended for you. For example, perhaps you had something similar to the HTML below for your Rock, Paper, Scissors game in Foundations:

~~~html
<div class='button-container'>
  <div class='rock' tabindex='0'>Rock</div>
  <div class='paper' tabindex='0'>Paper</div>
  <div class='scissors' tabindex='0'>Scissors</div>
</div>
~~~

A sighted user would most likely have no trouble playing the game if the elements looked like buttons to interact with. A screen reader user, however, would have no idea what any of these elements mean, nor would the user know that they can interact with them. The screen reader would announce the text contents of the element ("Rock"), and the user might think it's just plain text on the page and move on. There's no context to tell them that they're supposed to click on these elements. This issue can easily be fixed by using semantic HTML:

~~~html
<div class='button-container'>
  <button class='rock'>Rock</button>
  <button class='paper'>Paper</button>
  <button class='scissors'>Scissors</button>
</div>
~~~

Not only can a user interact with the buttons using both a mouse and keyboard, but now a screen reader would announce the text content as well as the role of the element ("Rock, button"), letting the user immediately know that they can interact with the element by clicking it. A little tip: if the element isn't meant to be a link, then you'll usually want to use a `<button>` element to convey to a user that they can click on it.

This of course is just a small example of how using a semantic element is important. [How screen readers navigate data tables](https://tink.uk/how-screen-readers-navigate-data-tables/) has a slightly more complex example. Be sure to click the video link at the end to hear a screen reader navigate the example that the blog post goes over.

Though the topic will be covered more in the next lesson, it's worth understanding now that every HTML element has an implicit role, but only some elements have a role that gets announced by assistive technologies to provide additional context to users.

#### Landmarks and Headings

Landmarks are HTML elements that act as regions of a page. The [ARIA Landmarks Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/HTML5.html) goes over the different landmark roles and their corresponding HTML element, and you can toggle a border around each landmark on the page itself to see how every element is contained within a landmark. Don't worry about memorizing what the landmark role of each HTML element is ("complementary", "contentinfo", etc.), as it's more important to know the native HTML elements themselves. You also don't need to worry about what "ARIA" means right now, as that will be covered in the next lesson.

If you were to use only `<div>` elements to act as regions or headings (the elements `<h1>` through `<h6>`), then a screen reader user might have to go through the entire page just to get to a specific area. By properly using landmarks and headings, you provide users of assistive technologies a more operable page with more context. Not only can screen readers navigate a page via landmarks and headings by opening a menu in their screen reader, but these elements also have their roles announced. Watch [Why headings and landmarks are so important](https://www.youtube.com/watch?v=vAAzdi1xuUY&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=19) to see how a screen reader interacts with these elements, and to hear some words of caution when using headings.

### Using Color

Even though adding color to a page can make it more visually appealing, using the wrong color combination or relying solely on color to convey information can end up making your page more difficult to perceive for some users.

#### Contrast Ratio

![Contrast ratio issues](https://user-images.githubusercontent.com/70952936/125673709-dd42bdf0-a4bc-4103-9a1b-e73e6c3bc85b.jpg)

Can you easily read the text in all three (yes, three) examples from the image above? If you can't, then that's because the contrast ratio is too low. If you can, then consider me jealous of your eye sight, but you still need to provide an easily perceivable website for visually impaired users.

Contrast ratio refers to the color of foreground text against the color of a background, and includes images of text. There are two different WCAG conformity levels for contrast ratios, both of which have rules for normal text and large text. **Normal text** is defined as text with a font size that's less than 18 points/24px (or less than 14 points/18.66px for bold text), and **large text** is defined as text with a font size that is at least 18 points/24px (or at least 14 points/18.66px for bold text).

1. **Level AA** (minimum) requires a contrast ratio of at least 4.5:1 for normal text and 3:1 for large text.
2. **Level AAA** (enhanced) requires a contrast ration of at least 7:1 for normal text and 4.5:1 for large text.

Both levels have exceptions that don't need to adhere to the required contrast ratio rule:

* Incidental text, such as text that just happens to be within an image that has other significant visual content, or text that is purely decorative.
* Text that is part of an inactive or disabled user interface component, such as a button that is disabled and has a lowered opacity.
* Text that is part of a logo or brand name.

[WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) is a fantastic tool for checking the contrast ratio. The page also has a link for a link contrast checker, which goes over what the contrast ratio should be if a text link isn't underlined (its default style).

You can also check the contrast ratio of the text within an element using your browser's dev tools. In **Chrome**, you would click the "element picker" tool in the Elements tab, then hover over an element on the web page. You can do the same thing in **Firefox**, except you have to click the "accessible object picker" tool in the Accessibility tab instead.

#### Conveying Information

Now that you know to take the contrast ratio into account when adding color for text and backgrounds, let's see if you can tell which of the buttons in the image below is red:

![Color blindness simulation](https://user-images.githubusercontent.com/70952936/125673910-66b43803-3228-4920-98f8-80ac063ef344.jpg)

The answer, by the way, is button 4. The image above is simulating achromatopsia, which is also known as total color blindness. This illustrates a key point when using color: **you shouldn't use color alone to convey information**. There may be exceptions where it's necessary to only use color, but generally you want to follow this rule. 

Let's look at another example. Imagine a form that has an instruction stating that required fields are indicated by red text. If a user is color blind or otherwise has difficulty telling some colors apart, having to rely solely on the color of this text can make it difficult or even impossible to perceive or operate the page. Instead of only using color, a form could indicate all required fields with red text and an asterisk (though this isn't the only way to convey that a form input is required).

![Conveying information with color](https://user-images.githubusercontent.com/70952936/125674026-9baafc58-2339-48f4-8b12-892375b87ad7.jpg)

#### Themes

We're not going to go in depth when it comes to themes since the topic can get pretty deep, but there are a couple of things that you should know:

1. A dark theme isn't just an aesthetic option. Some users have a sensitivity to light, which can make pages with a light theme (often the default or only option) very difficult, if not impossible, to browse. There are general work-arounds such as the Dark Reader extension for both Chrome and Firefox, but such general extensions may not always be a perfect fix. Some areas of a page might not be affected by such extensions, the extension might not change the colors on the page properly (resulting in contrast issues), or the extension could interfere with the page in unforeseen ways.

2. A dark theme isn't just taking the colors from the light theme and inverting them. Not only is this not 100% reliable in terms of color contrasts, but while light themes use shadows to simulate elevation for elements, dark themes instead rely on giving elements with a higher elevation a lighter background color. If you simply inverted the light theme colors, then the dark theme would have elements with white shadows, which doesn't simulate the elevation effect you should be going for (and it wouldn't really look good).

### Keyboard Navigation

Some users aren't able to use a mouse to navigate or operate a page and instead rely on using a keyboard or another assistive technology that can simulate keyboard inputs. Other users may even just prefer using a keyboard over a mouse, or may use a mix of both. These users require proper keyboard navigation, something that can easily be overlooked when developing a website.

#### Focus and Focus Styles

Remember our Rock, Paper, Scissors example that *didn't* use semantic HTML from earlier? The reason why the `tabindex` attribute was included in that example is because the `<div>` and `<span>` are two of the elements that aren't focusable by default. It's important to make sure that any elements you intend to be interacted with by users are focusable and can be interacted with via keyboards, and adding the `tabindex='0'` attribute is one step towards accomplishing that for a `<div>`.

Another aspect of focusable elements is their focus styles, which are usually an outline or border surrounding the element when it receives focus. One of the things you may have done, or may still do, is completely remove these focus styles by using CSS rules similar to the example below:

~~~css
*:focus {
  outline: none;
  border: none;
}
~~~

You probably assume that you're about to be told not to do this. Well... **You should never completely remove focus styles**. Instead, you should leave the default focus styles alone or replace them with your own focus styles. 

Completely removing focus styles can make a page impossible for keyboard users to navigate. It would force them to have to manually keep track of how many times they've pressed the Tab key while also trying to guess what elements are actually focusable. Imagine trying to browse a website with an invisible cursor and without any visual indication of when the cursor was hovering over interactive elements like links or buttons. Doesn't sound too fun, does it?

#### Tab Order

The tab order is the order in which elements on the page will receive focus when pressing the Tab key, and is by default in the same order as the elements listed in the HTML file. Sometimes you may find it necessary to either change the visual order of elements on a page using CSS or the tab order of elements themselves using the `tabindex` attribute. Regardless of which method you use, you'll usually want the visual order to match the actual tab order. 

If the tab order is different from the visual order of elements, some users could be left confused or frustrated trying to navigate the page with a keyboard. The best way to avoid this issue is to just place elements in your HTMl file in the order that you want them to actually receive focus. Watch [What is Focus?](https://www.youtube.com/watch?v=EFv9ubbZLKw&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=3) to see some issues that occur when trying to change the tab order, then watch [Controlling focus with tabindex](https://www.youtube.com/watch?v=Pe0Ce1WtnUM&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=4) to see how using the `tabindex` attribute can affect the tab order.

#### Hidden Content

A common trick when creating off-screen content is to use CSS rules similar to the example below:

~~~css
#menu {
  position: absolute;
  left: -10000px;
}
~~~

Then, when a user performs a certain action, the content appears on-screen somewhere. You may have done this in previous projects for hidden menus or modals. The issue with hiding content in this way is that it doesn't prevent keyboard users from being able to tab to any focusable elements *within* that hidden content.

One way to prevent this frustrating behavior is to give each individual item in that hidden content a `tabindex` value of -1, since that prevents an element from receiving focus via the keyboard (though you can still give it focus with JavaScript's `focus()` method). A better solution, though, would be to give the hidden content itself either the `display: none` or `visibility: hidden` CSS property when it's hidden, and removing or overriding that property when it's meant to be visible. This not only removes the menu items from the tab order, but it also prevents assistive technologies from announcing them.

#### Skip Links

The purpose of skip links is to reduce the amount of times a keyboard user has to press their Tab key in order to tab through items that are repeated across pages, such as navigation links. For users that can operate a keyboard with their hands this might not seem like too big a deal, but there are users who operate a keyboard in other ways, such as with mouth sticks or speech recognition software. For those users, having to repeatedly tab through the same contents on every page can be exhausting.

When added to a website, skip links should be the very first thing that receives focus when pressing the Tab key, and they are often hidden until they receive focus. You can see an example of a skip link in the top left corner of [GitHub](https://github.com/).

### Meaningful Text

Meaningful text is pretty straight forward: when a user reads text or has it announced to them, they should be able to immediately understand what it means even without any surrounding context. There are three instances where you should take particular care to provide meaningful text to both sighted users and users with a visual disability.

#### Links
~~~html
<!-- Example 1: Where's "here"? -->
<a href='https://www.theodinproject.com'>Click here</a> to start your career in web development!

<!-- Example 2: I love that place! -->
Visit <a href='https://www.theodinproject.com'>The Odin Project</a> to start your career in web development!
~~~

To a sighted user, the link in Example 1 makes perfect sense. Even to a screen reader user the link might make sense when the entire line is announced. However, in addition to being able to navigate a page via landmarks and headings as earlier mentioned, a screen reader may be able to navigate between each element of a specific type, such as links. If a user were to navigate between all of the links on a page, the only thing that would get announced in Example 1 is, "Click here, link." Where's "here" exactly? Without any surrounding context, the link is meaningless.

The link in Example 2, however, not only makes sense in context for all users, but it also makes sense out of context for screen reader users: "The Odin Project, link." Here the user doesn't necessarily need to know any more information about the link, they just need to know where the link will take them in some way (via the page title, article title, video title, etc.).

#### Messages

Messages include errors, alerts, status updates, or really any piece of information you need to make a user aware of. When a user receives a message, they should be able to make sense of it just by reading it and without having to look elsewhere on the page to figure out what it means.

~~~html
<!-- Example 1: Huh? -->
<div class='input-error'>Error: Invalid input.</div>

<!-- Example 2: That makes more sense. -->
<div class='input-error'>Error: Email is invalid.</div>

<!-- Example 2: Even better! -->
<div class='input-error'>Error: 'JohnSmith@@test.com' is not valid. Emails can only contain one '@' symbol.</div>
~~~

Imagine you received the error from Example 1 after trying to fill out a form input. Even if you can tell what input caused this error, which may not always be the case, the error doesn't provide any meaningful text. What input is invalid? Why is it invalid? How can you fix it?

The error in Example 2 clearly tells you what input is invalid, and while this might be all a user needs to know it's worth keeping in mind that it is still a vague error. The error in Example 3, however, not only tells you what input is invalid, but also why it's invalid or how to fix it. Much more meaningful and helpful to users.

Another way to provide meaningful text is with instructions, such as when websites have prerequisites for password inputs. Not only would it make little sense to wait until a user tried submitting a form to tell them that an input must include XYZ or be formatted a specific way, but it would be pretty annoying as well.

#### Alternative Text

~~~html
<!-- Example 1: This must be wrong... -->
<img src='...' alt='' />

<!-- Example 2: This must be right! -->
<img src='...' alt='Odin' />
~~~

Believe it or not, both examples above are valid! While Example 1 doesn't actually have any meaningful text (perhaps a meaningful *lack of* text), you should still understand its importance. When you're using an image purely for decoration, you generally don't want users of assistive technologies to be made aware of it. In those cases, you should *always* use an empty string for the value of the `alt` attribute (this is also known as a null value, not to be confused with the JavaScript data type). If you simply omitted the `alt` attribute, the presence of the image could still be announced, which may confuse the user.

For Example 2, the screen reader would announce, "Odin, graphic", making the user aware that there's an image and what it's an image of. What the alternative text should be for an image will ultimately depend on various factors, though. Read [Alternative Text from WebAIM](https://webaim.org/techniques/alttext) to learn about when and how you should be adding alternative text for images based on the function of the image and the context surrounding it.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* Why is semantic HTML important for accessibility?
* What are the seven HTML elements that define landmarks on a page?
* What should you avoid doing when using colors on a page?
* What are two ways you can make a website more accessible for keyboard users?
* When should you use empty strings/a null value for the `alt` attribute on images?

### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental for if you need to dive deeper into something.

* [Screen Reader Basics: VoiceOver](https://www.youtube.com/watch?v=5R-6WvAihms&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=8) and [Screen Reader Basics: NVDA](https://www.youtube.com/watch?v=Jao3s_CwdRU&list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g&index=9) goes over some basics for getting started with both brands of screen readers. Both videos are worth watching regardless of which screen reader you choose/is available to you, as they contain some universal information as well.
* [NVAccess](https://www.nvaccess.org/download/) provides a download of the NVDA screen reader, one of the more popular (and free!) screen readers available, though it's only available for the Windows OS. If you're using a macOS device, you should have the VoiceOver screen reader available to you.
* The [A11y Project Checklist](https://www.a11yproject.com/checklist/) covers many Level A and Level AA success criteria, and can be a good tool to help you start implementing accessibility.
* The [WCAG Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/) provides a list of success criteria along with techniques for how to satisfy them and links to understanding them in more detail. This tool is a great go-to when you're really ready to push your website to the next accessible level. If you often use animations, success criterion 2.2.2 ("Play, Stop, Hide") and all of the 2.3 success criteria are definitely worth reading.
* [Cognitive accessibility](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Cognitive_accessibility) is a lengthy read, but it'll help you create more accessible websites for users with cognitive or learning differences. 
* [Web accessibility for seizures and physical reactions](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Seizure_disorders) is another lengthy read, but by the end you'll have a better understanding of what can trigger reactions in users with vestibular disorders and how you can take measures to prevent that from happening.
* [A Complete Guide to Dark Mode on the Web](https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web) from CSS-Tricks can be a good starting point for implementing a dark theme for your website. It covers different ways you can toggle a theme, how to take into account a user's preferred theme on their OS, and even saving a user's preference.
