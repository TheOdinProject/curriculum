### Introduction

Although adding color to a page can make it more visually appealing, using the wrong color combination or relying solely on color to convey information can end up making things more difficult to perceive and understand for some users. This doesn't mean you have to limit yourself when choosing color schemes for a website, but it does mean you have to take extra care when actually *using* those colors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what a contrast ratio is.
- Know how to check contrast ratios.
- Understand why color alone should not be used to convey information.

### Color contrast

![Contrast ratio issues](https://user-images.githubusercontent.com/70952936/125673709-dd42bdf0-a4bc-4103-9a1b-e73e6c3bc85b.jpg)

Can you easily read the text in all three (yes, three) examples from the image above? If you can't, then that's because the contrast ratio is too low. If you can, then consider me jealous of your eye sight, but you still need to provide an easily perceivable website for visually impaired users.

A <span id='contrast-ratio'>contrast ratio</span> is the difference in brightness between two colors expressed as a ratio. White text on a white background would have lowest ratio (1:1), while black text on a white background would have the highest (21:1). Contrast ratios refer to both normal text as well as images of text.

There are two different conformance levels for contrast ratios, both of which have rules for normal text and large text. **Normal text** is defined as text with a font size that's less than 18 points/24px (or less than 14 points/18.66px for bold text), and **large text** is defined as text with a font size that is at least 18 points/24px (or at least 14 points/18.66px for bold text).

1. **Level AA** (minimum) requires a contrast ratio of at least 4.5:1 for normal text and 3:1 for large text.
2. **Level AAA** (enhanced) requires a contrast ratio of at least 7:1 for normal text and 4.5:1 for large text.

Both conformance levels have exceptions that don't need to follow the contrast ratio rules:

* Incidental text, such as text that just *happens* to be within an image that has other significant visual content, or text that is purely decorative.
* Text that is part of an inactive or disabled user interface component, such as a button that is disabled and has a lowered opacity.
* Text that is part of a logo or brand name.

At this point you might be thinking, "18.66 pixels? 4.5:1? How the heck am I supposed to remember these numbers? Wait, how am I supposed to calculate the ratios in the first place?!" Luckily for you, you don't have to!

[WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) is a fantastic tool for checking contrast ratios. Just enter the HEX code of the foreground and background colors and it calculates what conformance levels, if any, the contrast ratio passes. The page also has a link for a link contrast checker, which goes over what the contrast ratio should be if a text link isn't underlined.

You can also check the contrast ratio of the text within an element using your <span id='dev-tools'>browser's dev tools</span>. In **Chrome**, you would click the "element picker" tool in the Elements tab, then hover over an element on the web page. If you select an element with text in the Elements tab, you can click on the color picker tool for the "color" property under Styles to view the contrast ratio as well.

### Conveying information

Now that you know to take the contrast ratio into account when adding color for text and backgrounds, let's see if you can tell which of the buttons in the image below is red:

![Color blindness simulation](https://user-images.githubusercontent.com/70952936/125673910-66b43803-3228-4920-98f8-80ac063ef344.jpg)

The answer, by the way, is button 4. The image above is simulating achromatopsia, which is also known as total color blindness. This illustrates a key point when using color: <span id='color-information'>**you shouldn't use color alone to convey information**.</span> There may be exceptions where it's necessary to only use color, but generally you want to follow this rule.

Let's look at another example. Let's say you want to create a form that has an instruction stating that required fields are indicated by red text. If a user is color blind or otherwise has difficulty telling some colors apart, having to rely solely on the color of this text can make it difficult or even impossible to perceive or operate the form. Instead of only using color, your form could indicate all required fields with red text and an asterisk:

![Conveying information with color](https://user-images.githubusercontent.com/70952936/125674026-9baafc58-2339-48f4-8b12-892375b87ad7.jpg)

### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* [What is a contrast ratio?](#contrast-ratio)
* [What are two ways you can check a contrast ratio using your dev tools?](#dev-tools)
* [What should you avoid when conveying information to users?](#color-information)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

* [A Complete Guide to Dark Mode on the Web](https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web) from CSS-Tricks can be a great starting point for implementing a dark theme for your website. It covers different ways you can toggle a theme, how to take into account a user's preferred theme on their OS, and even saving a user's preference. Although providing a light and dark theme can be a great accessibility feature for users (not just an aesthetic preference), it can take a *lot* of work to implement, hence why it is considered an additional resource.
