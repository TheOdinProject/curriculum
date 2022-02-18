### Introduction

Emmet is a plugin, built into VS Code, that helps you write HTML and CSS more efficiently by providing a bunch of clever shortcuts. By now, you have written a good amount of HTML and CSS, and if you have been using VS Code there's a big chance that you have already encountered Emmet in some way.

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

- Use some of Emmet's most useful shortcuts.
- Set up custom Emmet keybindings in VS Code.

### Emmet

Emmet is a really useful tool for anyone that works a lot with HTML and CSS. Luckily, Emmet does not have that big of a learning curve, and if you already know how to write HTML and CSS you'll have no trouble picking up Emmet abbreviations.

Let's start off by generating an HTML boilerplate with Emmet. Opening up an empty html file in VS Code and entering `!` should trigger Emmet suggestions like so:

<img src="https://i.imgur.com/pUgPS0S.png">
Pressing enter should generate the following text:
<img src="https://i.imgur.com/RFf5kit.png">
We have just used one of many Emmet abbreviations. There are lots of useful Emmet abbreviations that you should check out, like <a href="https://docs.emmet.io/actions/wrap-with-abbreviation/">Wrap with Abbreviation</a> and <a href="https://docs.emmet.io/actions/remove-tag/">Remove Tag</a>. Definitely go through those before moving forward.

Considering how useful these two are, we will be setting up VS Code shortcuts for them.
Start off by opening the keyboard shortcuts window. You can do so by clicking the icon on the bottom left and selecting keyboard shortcuts, or by pressing `Ctrl K` followed by `Ctrl S`.

<img src="https://i.imgur.com/ZKrMLCR.png">

After entering the keyboard shortcuts window, you should be able to access all of the Emmet actions by searching for `Emmet:<action>`. In our case, it will be `Emmet:Wrap With Abbreviation`
<img src="https://i.imgur.com/PnHroOq.png">
You can now add a shortcut to it by clicking the plus sign and entering whichever key combination you would like for that specific action.
You can do the same for `Remove Tag` by searching for `Emmet:Remove tag`.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. <a href="https://www.youtube.com/watch?v=V8vizNQKtx0">This</a> is a good video on Emmet. Go ahead and watch it.
2. Take a look at the <a href="https://docs.emmet.io/cheat-sheet/">Emmet cheat sheet</a>. You don't have to memorize it, but it's good that you get familiar with the different ways it can be used.
3. Go through the <a href="https://docs.emmet.io/">Emmet documentation</a>. Once again, no need to memorize everything but it would be good if you played around with all the different possibilities.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* [Emmet Keybindings](https://marketplace.visualstudio.com/items?itemName=agutierrezr.emmet-keybindings) by [Andrés Gutiérrez](https://agutierrezr.github.io/), is a set of Emmet keybinds for Visual Studio Code. It can be used as a pre-defined group of keybinds, in case you don't know what to map to which keys. 

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="#emmet">Why should you use Emmet?</a>
- <a class="knowledge-check-link" href="#emmet">What are some useful Emmet abbreviations?</a>
- <a class="knowledge-check-link" href="https://docs.emmet.io/cheat-sheet/">What syntax would you use to create this element `<p class="text"></p>`?</a>
- <a class="knowledge-check-link" href="https://docs.emmet.io/cheat-sheet/">What syntax expands to an element with a child element inside of it? For example: `<div><p></p></div>`</a>
- <a class="knowledge-check-link" href="https://docs.emmet.io/cheat-sheet/">What syntax would you use to create three elements that have the same class name?</a>
