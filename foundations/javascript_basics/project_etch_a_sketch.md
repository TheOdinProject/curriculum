### Introduction

In this project, you'll be creating a pretty neat toy to flex your DOM manipulation skills. You're going to build a browser version of something between a sketchpad and an Etch-A-Sketch.

This project should *not* be easy. You'll probably have to Google frequently to find the right JavaScript methods and CSS to use – in fact, that's the point! You *can* build this using the tools that you have already learned. There are plenty of resources on the net for learning stuff that we haven't covered yet if you decide you need it. We'll walk you through the basic steps, but it will be up to you to actually implement them.

If you get totally stuck, drop by and ask for help in [our Discord server](https://discord.gg/theodinproject). Someone will be there to point you in the right direction.

### Assignment

<div class="lesson-content__panel" markdown="1">
Don't forget to commit early and often! You can reference the [Commit Messages lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/commit-messages)!

1. Follow our instructions on [setting up your project's GitHub repository](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/recipes#setting-up-your-projects-github-repository).
1. Create a webpage with a 16x16 grid of square divs.
    - Create the divs using JavaScript. Don't try to create them by hand by copying and pasting them in your HTML file!
    - It's best to put your grid squares inside a "container" div. This div can be written in your HTML file.
    - Use Flexbox to make the divs appear as a grid \(versus just one on each line\). Despite the name, do not be tempted to research or use CSS Grid, as it will be taught in a later lesson after the foundations path. This project is an opportunity specifically to practice Flexbox!
    - Be careful with borders and margins, as they can adjust the size of the squares!
    - "OMG, why isn't my grid being created???"
        - Did you link your CSS stylesheet?
        - Open your browser's developer tools.
        - Check if there are any errors in the JavaScript console.
        - Check your "elements" panel to see if the elements have actually shown up but are somehow hidden.
        - Go willy-nilly and add  `console.log` statements in your JavaScript to see if it's actually being loaded.
1. Set up a "hover" effect so that the grid divs change color when your mouse passes over them, leaving a \(pixelated\) trail through your grid like a pen would.
    - **Hint**: "Hovering" is what happens when your mouse enters a div and ends when your mouse leaves it. You can set up event listeners for either of those events as a starting point.
    - There are multiple ways to change the color of the divs, including:
        - Adding a new class to the div.
        - Changing the div's background color using JavaScript.
1. Add a button on the top of the screen that will send the user a popup asking for the number of squares per side for the new grid. Once entered, the existing grid should be *removed*, and a new grid should be generated *in the same total space as before* \(e.g., 960px wide\) so that you've got a new sketch pad.
    - **Tip**: Set the limit for the user input to a maximum of 100. A larger number of squares results in more computer resources being used, potentially causing delays, freezing, or crashing that we want to prevent.
    - Research `button` tags in HTML and how you can make a JavaScript function run when one is clicked.
    - Also check out `prompt`s.
    - You should be able to enter `64` and have a brand new 64x64 grid pop up without changing the total amount of pixels used.
1. Push your project to GitHub!

#### Extra credit

Transform the behavior of a square when interacting with the mouse by introducing a series of modifications.

1. Rather than squares being the same color throughout the grid, randomize the squares' RGB values with each interaction.
1. Additionally, implement a progressive darkening effect where each interaction darkens the square by 10%. The objective is to achieve a completely black square only ten interactions.
    - **Hint**: The opacity CSS property is useful here. To learn how to use it, check this [MDN docs article about the opacity CSS property](https://developer.mozilla.org/en-US/docs/Web/CSS/opacity).

You can choose to do either one or both of these challenges, it's up to you.
</div>
