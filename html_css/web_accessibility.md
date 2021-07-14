### Introduction

At this point in the curriculum you've learned incredibly valuable concepts in whichever full stack path you chose, you've created some awesome, resume worthy projects, and you should have a better understanding of some HTML and CSS concepts. One could even argue that you may now love working with CSS...?

What you may not have too much an understanding of, though, is the topic of accessibility, often referred to as "a11y" (due to there being 11 letters between the first and last letters). Unfortunately, this is a topic that many people either don't know much about, or just don't take into account when developing websites. If you fit into either of those two categories, you may have adopted some habits that aren't exactly a11y friendly. Before we dive into how you can break away from such habits and make more a11y friendly websites, it's important to first understand some basic information when it comes to web accessibility.

### Learning Outcomes
By the end of this lesson, you should be able to:

* Explain what web accessibility is.
* Explain the purpose of the Web Content Accessibility Guidelines.
* Name the 4 principles of the WCAG.
* Know the differences between the WCAG conformity levels.

### What is Web Accessibility?

Web accessibility is when websites don't have barriers that prevent interaction, access, or contribution from users with a disability, situational limitation, or changing abilities due to age.

There are different types of disabilities, including (but not limited to) auditory, physical/motor, cognitive, or visual. A disability can be permanent, such as a user who is completely blind, or it can be temporary, such as a user with a broken arm, and users may have multiple disabilities. Older users with changing abilities may even have similar conditions as those who have a disability.

Situational limitations are a little different. Using a phone outside on a bright day, browsing a site with one hand while you're busy doing something else with the other, or living in an area where the internet is slow or the bandwith is expensive are all examples of situational limitations. These limitations, unlike a disability, occur to users only in specific situations, but are still important to keep in mind when developing a website.

### Why Web Accessibility Matters

Imagine visiting a website where the text was too difficult to read due to font size or color, the layout was too difficult to navigate on a mobile device, or a form didn't have proper labels and it was more difficult to select a small input. While these issues may only be annoying to some users, to other users these issues can make a website completely unusable.

When you develop a website, you're developing it for users, and you need that website to actually be *usable* by them. People with disabilities, older people with changing abilities, people who aren't as tech savvy, and people with some sort of situational limitation are still users, and websites should be as equally usable by them as possible.

Go through [Diverse Abilities and Barriers](https://www.w3.org/WAI/people-use-web/abilities-barriers/) to get a better understanding of how users with disabilities are affected by inaccessible sites. Then, watch the videos on [Web Accessibility Perspectives](https://www.w3.org/WAI/perspective-videos/) to see how various web accessibility features can benefit everyone, not just users with disabilities. Each video is pretty short and has audio descriptions and transcripts. If you prefer, the page also has a link to a compiled version of all of the videos on Youtube.

### Web Content Accessibility Guidelines
So now you know how important web accessibility can be for certain users, and how beneficial it can be for *all* users. But how do we know not only what should be a11y friendly, but how to make those things a11y friendly? Enter the Web Content Accessibility Guidelines (WCAG). The goal of the WCAG is to create a shared standard when it comes to web accessibility. Think of web accessibility as the destination, and the WCAG as the GPS that helps get us there. 

#### The Four Principles

The WCAG are organized around four, core principles:

1. **Perceivable:** Users must be able to perceive the information or user interfaces being presented. Light text on a light background could be difficult for some users with a visual impairment to perceive, for example.

2. **Operable:** Users must be able to operate any user interfaces or navigation, and interfaces cannot require an interaction which the user cannot perform. A navigation bar with dropdown menus that only expand when a mouse cursor hovers over them, for example, would not be operable by keyboard users.

3. **Understandable:** Users must be able to understand any information or user interface that is presented to them. For example, if a user tried submitting a form and received an error such as "Error 23: Bad data", they wouldn't be able to understand what the error actually means or how to fix whatever caused the error.

4. **Robust:** Content must be accessible by current assistive technologies and other user agents, and must remain accessible as those technologies advance.

#### Conformance

In order to conform to the current version of the WCAG, a web page must satisfy various requirements. One of those requirements is meeting one of the following three conformance levels in full:

* **Level A**, or essential support, is the minimum level of conformance and means that a web page satisfies all Level A success criteria.
* **Level AA**, or ideal support, is the level many organizations strive for. This level means a web page satisfies all Level A and Level AA success criteria.
* **Level AAA**, or specialized support, means a web page satisfies all three levels (A, AA, and AAA) of success criteria. This level isn't recommended for entire sites to meet in full, as some content may make it impossible to conform to every Level AAA success criteria.

"Success criteria" are essentially testable rules that must be followed. For example, one success criterion for Level A conformance is that all non-text content has a text alternative, like the `<img>` element's `alt` attribute. You'll learn about some more success criteria in the next lesson.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

* What is web accessibility?
* What is the purpose of the Web Content Accessibility Guidelines?
* What are the 4 principles of the WCAG?
* What are the three levels of conformity for the WCAG?


### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental for if you need to dive deeper into something.

* [The Business Case for Digital Accessibility](https://www.w3.org/WAI/business-case/#drive-innovation) goes over reasons for implementing accessibility beyond just being more inclusive to more users.
* [Section 5.2 - Conformance Requirements](https://www.w3.org/TR/WCAG/#conformance-reqs) goes over the other requirements for conforming to the WCAG.