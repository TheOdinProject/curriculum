### Introduction

As you continue your web development journey, it is important to keep in mind that the end users of your work might be using a variety of browsers: Chrome, Internet Explorer, Firefox, and Safari to name a few. At the same time, the number of users using mobile operating systems is growing rapidly, therefore you should also consider the mobile versions of different browsers.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand browser compatibility and its history.
- Know how new CSS features make their way into browsers.
- Know how to check for compatibility.

### Browser history

<span id="first-web-browser">The history of modern browsing began back in December of 1990 with the release of WorldWideWeb browser.</span> It was written by Tim Berners-Lee while working for the European nuclear research agency known as CERN. It was later renamed to Nexus, to avoid confusion with the World Wide Web.

Nexus was the first of its kind, and allowed users to view basic style sheets, read newsgroups, and even had spellcheck! It might not seem like a lot today, but at that time it was truly groundbreaking.

The release of Nexus was just the beginning though, as in the next decade people witnessed the first releases of browsers such as Mosaic Browser, which quickly gained popularity and quickly became the most popular browser on the globe. From there, the growth of the World Wide Web exploded with the releases of Opera and Netscape Navigator browsers.

In 1995 the world got introduced to the first version of Internet Explorer, which became the dominant player in the market. At some point, Internet Explorer was used by more than 90% of all users. To counter this dominance, Netscape launched what would become Mozilla Foundation which develops and maintains Firefox. Soon after that, in 2003, Apple launched Safari, and in 2008, Google launched Chrome.

You're most likely familiar with most, if not all these names.<span id="most-used-browser"> There is a lot of competition among the browsers still to this day, even though Chrome (and [Chromium](https://en.wikipedia.org/wiki/Chromium_(web_browser))) is the dominant player in the market</span>.

### What is browser compatibility?

Today, it is impossible to imagine the Web without the use of browsers. We have witnessed a shift from standalone applications to HTML5 and Progressive Web Apps that allow applications to fully function within a browser. For example, Microsoft Word and Excel for the longest time could only be executed via a standalone application. Now, you can utilize those applications through any browser without the need to install any files.

As companies compete for the market share, different browsers are using different engines to display information on the web page. For example, Chrome and Chromium utilize Blink, while Safari uses WebKit.

Because of these differences, your applications may behave differently in the browser. Due to Chrome dominance, the vast majority of applications are designed to work smoothly with Chromium, and providing as good a level of performance in other browsers is secondary.

For your web development projects to have a broader reach, you must make sure that you're testing your web applications against the browsers which are most likely to be used by the users. Chrome, Safari, Firefox, and other Chromium-based browsers (Microsoft Edge, Brave, etc.) are more common among regular users. But you may find you need to support less common ones (like Internet Explorer) as well depending on the user base or the company you work for. For Chromium browsers, if it works in Chrome, it should work in other related browsers as well.

### Browser releases and new CSS features

W3C [World Wide Web Consortium](https://www.w3.org/) is the authority behind developing web standards to maximize accessibility and consistency of the web experience. W3C is also the authority to develop new features in the CSS. This is a closely collaborative approach with the Web as a community as well as the companies developing the web browsers.

When the web browsers such as Nexus and Netscape were released, there was no such organization as W3C to help create more compatibility. Your application could look and function differently in each browser. Even worse, your application could've been completely unusable. Web developers had to make specific adjustments for each browser, and not every developer had enough resources to make that work for everyone.

Today, as the standards around the web evolve and change, and web developers begin implementing new features in their codebase, the browsers must provide support for those new features. If the user experience is impacted by the lack of support in the browsers, the users might find their way to the competitor.

### When is it safe to use new features?

As exciting as it is to implement new features, there is a risk of rushing. It would not be a positive experience for your users to find that, for example, your application used to work well in Firefox, but due to the changes in the codebase it is now unusable in Firefox but works well in Safari. Thankfully, there is a tool that can help you prevent this situation.

["Can I Use"](https://caniuse.com/) is a great resource to help you validate if new features are supported by the browsers. It provides statistics on which browsers and platforms are supporting new technologies, and even which versions of the browsers support specific features.

It is generally good advice to implement new features when they are supported by the most common browsers. This way you're less likely to encounter an issue that a lot of users will face.

### Mobile browsers

Traditionally, the Web was desktop computer first. The application was successful if it worked well on desktop browsers. But as smartphones have become more popular, each year more and more users are using mobile devices as their main Web-facing device. In some areas of the world, mobile users are a vast majority.

Mobile devices mostly consist of smartphones and tablets. The most popular mobile operating systems are [Android](<https://en.wikipedia.org/wiki/Android_(operating_system)>) and Apple's [iOS](https://en.wikipedia.org/wiki/IOS).

As you're developing your applications, you must also consider whether your application should be fully mobile compatible. There are a couple of specifics about mobile browsers that you need to keep in mind.

1. <span id="apple-browsers">On iOS and iPadOS, Safari is technically the only supported browser. Yes, you can install Chrome or Firefox, and you can even set them as a default, but they are not full browsers. They are still using the Safari rendering engine (WebKit). Therefore, for your web application to work for the Apple users, you have to ensure support for WebKit and other technologies used in Safari.
It's important to remember that mobile browsers are not one-to-one with their desktop counterparts. A project that works in the desktop version of Safari might still need adjustments to work properly on the mobile version of the same browser.</span>
2. Another consideration for mobile browsers is the magnitude of different screen sizes. It is virtually impossible to have every physical device available to test, and thankfully browsers provide a way to emulate other devices. The important piece to remember is that when, for example, you emulate an iPhone in Chrome, all that you're emulating is the screen size. Keep in mind that any specific considerations of the operating system will not be reproducible. Which means that even though everything functions well in Chrome when emulating a device, it could behave differently on the actual phone or tablet device.

### Assignment

<div class="lesson-content__panel" markdown="1">
- Review [Can I Use](https://caniuse.com/). Are all technologies you have encountered so far supported by popular browsers?
- Read this article [about browsers on iOS](https://adactio.com/journal/17428).
</div>

### Knowledge check

- [What is the most used browser currently?](#most-used-browser)
- [What was the original name of the first web browser?](#first-web-browser)
- [How are mobile browsers different on Apple mobile operating systems from Android?](#apple-browsers)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- Read more about the [history of web browsers](https://www.taskade.com/blog/history-of-web-browsers-internet-online-productivity/).
- Take a look at this [comprehensive primer on browsers and rendering engines](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/).


