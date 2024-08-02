### Introduction

In the previous courses, you'll have learned a lot of CSS and all of those skills are still applicable to React. However, there are a couple of things we'd like to highlight. As you've probably already noticed, all of the styles we write share the global scope, which means that as our application grows, it will become increasingly difficult to manage our CSS. Some of the tools mentioned below are things people use to help solve this problem.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Know about ways to style React applications

### CSS modules

Regular CSS is the simplest way to style. CSS Modules let you write CSS style declarations that are scoped locally, which means that we finally no longer have to worry about our class names potentially conflicting with other classes in the global scope.

### CSS in JS

Why even write CSS in CSS when you can write it in JavaScript? Just kidding, of course!

CSS-in-JS is a paradigm for styling front-end projects. It allows you to entirely take control of CSS with JavaScript and extends it with various features. Additionally, it also helps to apply styling in a logical fashion, e.g. based on state, and also supports modular CSS in the same way that CSS Modules do. There are various CSS-in-JS solutions. One of the most popular ones in the React ecosystem is [styled-components](https://styled-components.com/).

### CSS Utility Frameworks

CSS Utility Frameworks are a popular choice for styling React applications. They provide a set of pre-defined classes that you can directly use in your HTML, or JSX in our case. [Tailwind CSS](https://tailwindcss.com) is by far the most popular choice.

### Component libraries

Component libraries allow developers to skip implementing common features like dropdown menus, calendars, toggles, tabs, toasts and others.

These usually come in three flavours:

#### Headless UI component libraries

These libraries come with no extra styling at all. They essentially provide components that have accessibility taken care of, for example you might forget to implement a dropdown menu closing when clicking <kbd>esc</kbd> key, headless UI libraries take care of that for you. All other functionality is usually exposed via an API.

An example of a headless UI library is [Radix UI primitives](https://www.radix-ui.com/primitives). Check out their [dropdown primitive component](https://www.radix-ui.com/primitives/docs/components/dropdown-menu) for an example.

#### Component libraries

Sometimes built on top of headless UI component libraries. These add extra styling to primitives. For example, [shadcn-ui](https://ui.shadcn.com/docs/components/dropdown-menu) builds on top of previously mentioned radix-ui, acting as a sort of wrapper. Other component libraries worth a mention are [Material UI](https://mui.com/) and [Chakra UI](https://chakra-ui.com/).

#### Icon component libraries

These are unlike the other two, and act as `<svg>` wrappers. They allow you to seamlessly add icons to your react application as they expose icons as react components. An example is [lucide react](https://lucide.dev/guide/packages/lucide-react).

<div class="lesson-note lesson-note--tip" markdown="1" >

For learning purposes throughout this course, we strongly recommend that you avoid using CSS frameworks or component libraries (using icon component libraries is fine), and instead implement your component's styling from scratch i.e. use [CSS Modules](#css-modules) or a [CSS-in-JS](#css-in-js) option.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [CSS Modules documentation](https://github.com/css-modules/css-modules) and [How to style React components using CSS Modules](https://www.makeuseof.com/react-components-css-modules-style/).

1. Read [CSS vs CSS-in-JS](https://blog.logrocket.com/css-vs-css-in-js/) and [a thorough analysis of CSS-in-JS](https://css-tricks.com/a-thorough-analysis-of-css-in-js/).

1. Skim through the [styled components documentation](https://styled-components.com/).

1. Check out the [lucide icons](https://lucide.dev/icons/) to see what is possible.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How can you use CSS Modules in your React app?](https://www.makeuseof.com/react-components-css-modules-style/)
- [What does CSS-in-JS mean?](#css-in-js)
- [What are component libraries?](#component-libraries)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Josh Comeau has a nice article on [getting the most out of styled-components](https://www.joshwcomeau.com/css/styled-components/).
