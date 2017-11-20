As you learn to write JavaScript you are going to have many opportunities to code-along with various tutorials, complete exercises, and practice what you've learned by writing your own code.  Because JavaScript is such a dynamic language there are _many_ ways to run the code you write.  All of them have their advantages and disadvantages and which one you use will depend mostly on what you're trying to accomplish.  For example, if you're working on a project for your portfolio it is important that you create it from scratch on your own computer, however if you're just playing around with a new method you've learned then it might be wise to use the quicker and easier method of loading up a website that does the set-up work for you.  If you're completely new to coding then this lesson might not mean too much to you just yet, so read it and keep it in the back of your mind.  Feel free to come back when it's time to start writing code!

## On a website

There are several websites that will run your code for you.  Even though writing your code on your own machine is usually a better way to go, especially for real projects, it can be useful to use these quick and easy websites for quick scripts or testing new functions as you learn about them.

Some of our favorites include:

* [https://repl.it](https://repl.it/languages/javascript) actually supports many languages besides JavaScript and allows you to save and share your code among other things.
* [http://jsbin.com/](http://jsbin.com/) includes a space for you to write html and css as well as JavaScript so that you can incorporate some visible elements if you want.
* [http://codepen.io/](http://codepen.io/) is a lot like jsbin, but has some more social features, and a different style of interface.  In the end they do the same thing.

For real projects, it is almost always going to be better for you to write your code locally and save it with git, but there are _definitely_ times when you do not need to save what you're doing, or times when you're going to want to quickly share your work with someone else.  These websites are great for such times.

## In the browser

There will be a more in depth lesson on this later, but it is possible to write and run JavaScript code directly in your browser using the Developer Tools.  How you open the devtools depends on your browser and system, but for most people you right click on the page and click the 'Inspect' option.

Once the console is open, writing code is as easy as typing it in.  To get multiple lines for functions press Shift+Enter as Enter alone will try to run the code.

**Try this now:** Open the console \(you can do it right on this page\) and type `var a = 10` then press Enter.  Now type `a` and press Enter again, the console _should_ display `10`.  Next type `a + 5` and press Enter.... the console should now display `15`.

In many cases, if you just want to quickly try something out, using the browser console is incredibly quick and easy.

## From HTML

You can run JavaScript code that you write in a script on your own computer by embedding it into an html file.  Creating a barebones HTML file is incredibly quick and easy and you can write your JavaScript directly in an html file like so:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SUPER SIMPLE HTML FILE</title>
</head>
<body>
  <script>
    // JavaScript goes here!
    console.log("HEY IT WORKS")
    console.log(5 + 5)
  </script>
</body>
</html>
```

Opening this file in a browser will run the JavaScript code and log those statements.

## The Command Line

And finally, you can run your JavaScript code from the command line.  If you've installed nodeJS you can usually run a JavaScript file in a terminal by running `node filename.js`  though this could change depending on your setup.  You can read more about setting up node [here](https://nodejs.org/en/download/package-manager/#nvm).  \(Be sure to install node using NVM\)

## So which one do I use?

For real projects, once you start creating them, it's best to work on your own computer and run the actual HTML and JS files in your browser.  JSBin and Codepen make creating such things really quick and easy, but in this case easy is not necessarily better.  Knowing how to set up and manage a project on your computer is an _essential_ skill that employers are going to require, and as you go you will find that there are some things you just can't do on websites like those.

Having said that, there's no reason to waste time setting up a whole project or littering your Hard Drive with files called `test1.html` or `tryingOutQuerySelector.js` for little tests and experiments.  By all means use whatever method is convenient for you in those cases.

