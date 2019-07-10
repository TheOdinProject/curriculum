### Functions
Things are about to get _really_ exciting.  So far you have been writing an impressive amount of code to solve various problems but that code has not been as useful as it could be.  Imagine taking one of your scripts and bundling it into a little package that you could use over and over again without having to rewrite or change the code.  That's the power of functions and they're used _constantly_ in JavaScript.

1. [Another lengthy MDN article](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Functions) is a good place to start.  Pay special attention to the sections on 'Function Scope'.  Scope is one topic that commonly trips up both beginner and intermediate coders so it pays to spend some time with it up front.  
2. Read this article about [return values](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Return_values).
3. Let's consider parameters and arguments in the context of the following function:
   ```javascript
   function favoriteAnimal(animal) {
     console.log(animal + " is my favorite animal!")
   }

   favoriteAnimal('Goat')
   ```
   In JavaScript, function parameters are the items listed between the parenthesis in the function declaration. Function arguments are the actual values we decide to pass to the function. In the example above, we established the function definition on the first line with `function favoriteAnimal(animal)`. Our parameter, `animal`, is found inside of the parenthesis. Does it have to be `animal`? No. We could replace it with `pet`, `x`, or `blah`. But in this case, naming it `animal` gives someone reading our code a bit of context so they don't have to guess what value `animal` may eventually contain. By putting `animal` inside of the parenthesis of `favoriteAnimal()`,  we are telling the JavaScript engine that we will send *some* value to our `favoriteAnimal` function. This means that `animal` is just a placeholder for some future value. But what value are we sending? That's our choice.
The last line, `favoriteAnimal('Goat')`, is where we are calling our `favoriteAnimal` function and passing the value `Goat`. Here, `goat` is our argument. We are telling the `favoriteAnimal` function, "Please send 'Goat' to the favorite animal function." And we can declare any animal to be our favorites. Feel free to experiment with the code and replace `Goat` with your favorite animal. Notice how we can change the argument to anything we like? Try changing `animal` in the function declaration too. What happens when you do? We can change the parameter to anything and it'll still work.
4. Next, read [this one](http://javascript.info/function-basics) from Javascript.info.  We've mentioned this before, but JavaScript has changed a bit over the years and functions have recently received some innovation.  This article covers one of the more useful new abilities: 'default parameters'. \(NOTE: The last "task" at the end of this lesson uses loops, which you will learn about in the next lesson.  Don't worry about that one.\)  
5. Finally, read [one more article](http://javascript.info/function-expressions-arrows) about functions in Javascript that will give you a little more context.  Another relatively new feature in modern JavaScript is the `arrow function` which is introduced in this article.  Arrow functions are useful, but not incredibly crucial so don't worry about them too much just yet.  We include them here because you are likely to encounter them as you move forward, and it's better that you have at least _some_ idea of what you're looking at whenever they crop up.

### Practice

Let's write some functions!  Write these in the `script` tag of a skeleton html file.  If you've forgotten how to set it up, review the instructions from __fundamentals 1__.

For now just write each function and test the output with `console.log`.

1. Write a function called `add7` that takes one number and returns that number + 7.
2. Write a function called `multiply` that takes 2 numbers and returns their product.
3. Write a function called `capitalize` that takes a string and returns that string with _only_ the first letter capitalized.  Make sure that it can take strings that are lowercase, UPPERCASE or BoTh.
4. Write a function called `lastLetter` that takes a string and returns the very last letter of that string:
   1. `lastLetter("abcd")` should return `"d"`
