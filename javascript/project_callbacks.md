### Warm Up

Ok, let's get some practice writing our own callback methods.

### 1. `myEach()`
Write a function that takes an `array` as its first argument, and a `callback` as its second argument.

This function should iterate through *each item* in the array, and pass that item to the callback function as an argument.

You can do this however you want - if you want do challenge yourself, try using `Prototypes`!

Here's how the finished function might work:

~~~javascript
myEach([1,2,3,4], function(item){
  console.log(item);
});
//1,2,3,4
~~~

Hint: Do you think your function should `return` anything?

### 2. `myMap()`

Let's go one level deeper.

Map is an enumerable method common to many languages.

A `map` function takes an array, iterates over each item in the array, and then *does something* to each item.  What it does is up to you to define.  Map usually returns a brand new array, with the new values in it.

If you're familiar with Ruby, then you'll probably have had some exposure to the `#map` method, and JavaScript implements its own version as well.

* [Read about the Map method here.](https://en.wikipedia.org/wiki/Map_(higher-order_function))

* You can also read about the [Ruby](http://stackoverflow.com/questions/12084507/what-does-the-map-method-do-in-ruby) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) implementations.

Your job is to write a function called `myMap()`.  The `myMap()` function will accept an `array` and a `callback`, and `return` a new array.

You should use `myEach()` inside `myMap()`to iterate over each item and pass it to the given callback.  You're going to have to figure out how to get `myMap()` to `return` your new array.

This will help you to start to think about why callbacks don't usually use `return` statements.

Here's how the function you write might be used:

~~~javascript
myMap([1,2,3,4], function(item){
  return item * 2;
});

//[2,4,6,8]
~~~

### 3. `myMap()` continued.

`return`ing things is a bit weird in this context.  So now, you'll be implementing a version that merely collects each item and passes the new array forward.

Refactor myMap to pass your modified array forward - into another callback!

Hint: Make sure you pass in the whole modified array to your outgoing callback, and not just each individual item. Feel free to `console.log` the output.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Do the [callbacks exercise](https://github.com/bgando/functionalJS) questions from Bianca Gandolfo's course on JS Fundamentals.
</div>

### Student Solutions
Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.

* Add your solution below this line!
* [Nida's Solution](https://github.com/nidafarooqui/Callbacks/blob/master/callbacks.js)
* [Yoshua Elmaryono's Solution](https://github.com/dotm/functionalJS/blob/master/callbacks/callbackExercises.js)
* [Miguel Herrera's solution](https://github.com/migueloherrera/js-callbacks)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/js-callback-methods)
* [Austin's solution](https://github.com/CouchofTomato/js-callbacks/blob/master/callbacks.js)
* [Rhys B's solution](https://github.com/105ron/js-callbacks)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* JS Programming in the Node JS environment revolves around using callbacks.  Take a look at the [**nodeschool.io** tutorial](http://nodeschool.io/) for a nice introduction to Node, and as a side-effect : callbacks.
* Bianca's [course](https://github.com/bgando/functionalJS) also contains exercises on scopes, closures and the underscore.js library. Feel free to explore them and dive into the world of Javascript!
* Add some!
