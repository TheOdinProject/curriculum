# Javascript Scope and Closures

With all these functions going around, we've got to keep track of scope!  Which variables got set where?  Who can access what? What is this mysterious `this` variable which seems to embody everything strange and complicated-seeming about Javascript scope? 

All this scoping (and using closures) makes a lot of sense when you remember that functions in Javascript can get called at different times and from different places in the code, especially if they are related to events (where they get called as callbacks, which you've seen before but are also covered in the next lesson).

## Points to Ponder

* What is `this` equal to? (not a simple question...)
* How do you `bind` variables to a scope?
* Why would you define a `that` variable?
* Why is id naughty to modify or reference variables from outside your scope?
* Why aren't private variables actually private?
* Functions should always return the same thing... or..?
* How does the way you call a function (e.g. function style, method style...) affect its scope (and `this`)?

## Your Assignment

1. Read [What you Need To Know About Javascript Scope from Smashing Magazine](http://coding.smashingmagazine.com/2009/08/01/what-you-need-to-know-about-javascript-scope/)
2. Read [Javascript Closures from learn.jquery.com](http://learn.jquery.com/javascript-101/closures/)
2. Read the answers to [SO on "How do Javascript Closures Work?"](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work) for a bit of a more nuanced understanding of things.
3. Read [Understanding Javascript's `this` keyword from JSIS](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
4. Read about [Javascript's `apply` `call` and `bind` methods from JSIS](http://javascriptissexy.com/javascript-apply-call-and-bind-methods-are-essential-for-javascript-professionals/)
4. Read [Understanding Javascript Function.Prototype.Bind from Smashing Magazine](http://coding.smashingmagazine.com/2014/01/23/understanding-javascript-function-prototype-bind/) to learn about binding in greater depth.  This may be one you need to come back to a bit later because it gets deep.

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Understanding JS Closures Completely from JSIS](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
* [Understanding JS Variable Scope and Hoisting from JSIS](http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/)
