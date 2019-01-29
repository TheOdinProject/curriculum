# Getting Started with Sass
=========================

__Statement of Goals__

The goals of this particular document are to familiarize beginning developers with the CSS preprocessor [Sass](http://sass-lang.com).

__So, what _is_ a preprocessor, anyway?__

A CSS preprocessor is simply a scripting language that extends CSS and then gets compiled into regular CSS syntax.

__Alright. Why should I use one?__

Using a preprocessor like Sass enables you to build your CSS like it _should_ be built, with functions and mixins and variables, which helps streamline and speed up the development cycle. It also gives you, the developer, a lot more power when writing your code. Everybody likes power, right? Here are a few more benefits of using Sass:

- Cleaner code with reusable pieces (DRY principle: __D__on't __R__epeat __Y__ourself!)
- Flexibility to create, include, exclude, and modify things on the fly
- Use a library of commonly used modules, instead of .css file after .css file
- Build and expand on those modules, or create your own
- Mathmatical formulas, mixins, functions (_if_ statements!), variables, and more!
- Painless, automatic minification of your code when you're ready to move it to production.
- and so much more...

__Sass allows you to do things like this:__

_my_module.scss_

    $color: blue;
    @mixin box-sizing($value) {
        -webkit-box-sizing: $value;
        -moz-box-sizing: $value;
        -ms-box-sizing: $value;
        box-sizing: $value;
    }

_my_scss.scss_

    @import 'my_module.scss';
    
    div.a_box {
        background-color: $color;
        @include box-sizing(border-box);
    }

_which outputs to:_

    div.a_box {
        background-color: blue;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;
    }

Now, all we need to do for future projects is include our module file, and we can use that really short mixin to produce _four_ lines of code!


I'm hooked. Let's install it!
=============================
Good choice! I was excited when I first started using Sass, and I'm learning more each day. I hope I can help you take advantage of this powerful tool - it will change your life! (No, really. You'll love me. Please?)

__Necessities___

You will need:
- A text editor (I highly recommend [Sublime Text 2](http://www.sublimetext.com/))
- A CLI (Command Line Interface), like Terminal or Command Prompt

We will be installing:
- Ruby
- Sass


The Breakdown
=============

__Ruby Installation__

Ruby is a dynamic, general-purpose object-orientend programming language. Sass runs off of Ruby, so we'll start with this.

[Ruby-lang.org download page](http://www.ruby-lang.org/en/downloads/)

- If you're on Windows, I recommend using [RubyInstaller](http://rubyinstaller.org/).
- If you're on a UNIX-based OS (Mac, Linux _[Ubuntu, Debian, Linux Mint, etc.]_), I recommend [installing RVM instead](https://rvm.io/rvm/install#explained). It allows you to manage multiple installations of Ruby, which _will_ come in handy if you decide to learn the language.

__Sass Installation__

Once Ruby is installed (just follow the instructions on one of the links, above), open up your CLI and type this:

    gem install sass

That's it! You've now got Sass and Ruby installed on your computer!


Additional resources
====================

- [sass-lang.com](http://sass-lang.com): Learn more about Sass (contains tutorial, reference)

About the Author
================
Ben Denhartog works as a web developer in northern California, USA. [Get in touch](https://github.com/bddenhartog).

To-do
=====
- Add a tutorial using Sass
- Add Compass information