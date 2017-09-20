# Writing Readable Code
Developers spend SO MUCH more time reading code than writing it.  This is true even with your own code.  As a favor to yourself and whoever will need to use, maintain or develop your code, please learn to write readable code. 

But what about documentation, Evan?  Good question other Evan.  

Documentation does not remove the need for readable code.  Documentation is for users with no interest in reading source code; readable code is for developers who want to study, modify, fix, update, or in anyother way work with your codebase. (Including your futur self.  Love yourself.)  
 
There are many different opinions on what constitutes great JavaScript code.  The most important thing is just that you're consistent.  The war between coders that use tabs and coders that use spaces to indent their code is so engrained that [it's essentially a joke by now](https://www.youtube.com/watch?v=SsoOG6ZeyUI), but it doesn't _really_ matter as long as you're consistent.

___
### Self-Documenting Code
Self-documenting code is code that reads almost like a very nerdy book.  

You have already begun your journey towards self-documenting code and you didn't even know it.  If you look to the process presented in _tictactoes_, the step from specs to empty code is giving you the start of a user-friendly project. The specs can become documentation for end-users, while the codebase is on it's way to being developmer-friendly:
* The comments are pulled from the 'purpose' field of the spec - this gaurentees that you will have a 'why' comment for each component of the code. 
* You are building your code around pure functions.
* The required functions, arguments, and return values are pre-declared with descriptive names.

 Glorious.
 ___
 ### Rules of Thumb
 Structural:
 * Place all the 'workings' of your app in one place.  This means function calls, important variable assignments (or reassignment), and any other lines crucial to understanding your code.   With good naming, this can make your app read like a continuous story instead of a bunch of sentences split up through a phone book. (see example) 
 * Use single-purpose, pure functions with simple, understandable behavior.
 * Have a helpful directory structure
 * Within a single file - organize variables, functions, objects, ... in a way that makes sense so you don't have to rescan the whole file all the time.

 Naming:
 * All names of things describe what they do, even if it means having realllly long names. 
 * Write helpful error messages
 * Decide on and stick to a naming convention. ie. camelCase or under_scores, var forty_two = 42, ...
 
 Syntax:
 * Use [prettier.js](https://github.com/prettier/prettier) to make your coding style consistent. (white space, code blocks, functions, ... visually consistent)
* Show intermediate values. ie. none of this: (array[3])()[title].name.splice(3)
* Phrase things in the most clear way, not the most 'elegant' or short way.  No one will care how brilliant you are when they're 15 minutes in and just starting to understand your code. (personal experience here)

__Do Complete Refactors__.  
* When your application or code changes, go through (at least most of) your codebase to reflect that change - modify variable and function names, reorganize what functions do what, even change your directory strucutre.  

The better you are about starting with readable code, the easier it will be to keep your code readable.


___
### Two Examples
### 1
Consider the following 2 snippets of JavaScript:
```javascript
// difficult to read
const x = 
function(z) {
let w = 0;z.forEach(
function(q){
     w += q;
});return w;
};

x([2, 2, 2]);

// easy to read
const sumArray = function(array) {
  let sum = 0;
  array.forEach(function(number) {
    sum += number;
  });
  return sum;
};

sumArray([2, 2, 2]);
```

Believe it or not, both of those functions do the exact same thing \(in the exact same way!\), and both of them are perfectly valid code, but obviously the second one is much easier to follow.  Imagine you're working on a project with someone else and they've written the first function... how long is it going to take you to figure out what's going on there so you can do your work?  Imagine you're working on a project all by yourself and YOU wrote the first function a week or two ago... chances are good that you aren't going to remember exactly what you were up to there and it's _still_ going to take you a good while to figure it all out again.

The second one, however, is much easier to follow.  Even if you don't know exactly what everything in the code is doing, things are named clearly enough that you could guess, and the indentation is consistent enough that it's easy to parse the different parts of the function.

#### 2
 * ```javascript
    // -----------  Define things in one place ------------ //
    var command_line_args = process.argv.slice(2);
    var first_arg = command_line_args[0];
    var second_arg = command_line_args[1];
    function check_input_type(input, expected_type) {
            // return true or false
        };
    function add_two_numbers(num_1, num_2) {
            // return the sum of num_1, num_2
        };
    function display_to_user(result) {
            // console log result
        };

    // ------------- Use the stuff you defined elsewhere --------------- //
    var first_arg_is_valid = check_input_type( first_arg );
    var second_arg_is_valid = check_input_type( second_arg );
    if (first_arg_is_valid && second_arg_is_valid) {
        var sum_of_args = add_two_numbers( first_arg, second_arg );
        display_to_user( sum_of_args );
    } else {
        display_to_user( " invalid argument types " );
    };
    ```
This is overkill for code that only adds two numbers, but it gets the point across. In more complicated or abstract programs the time spent writing clear code will more than pay off later.
___
### Resources
Mandatory reads:
1. [avoid comments](https://blog.codinghorror.com/coding-without-comments/)
2. when you can't, [make sure they help](https://blog.codinghorror.com/when-good-comments-go-bad/)
3. and certainly learn to know [when they are apropriate](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/)


Other resources:
* [JS tips](https://www.sitepoint.com/self-documenting-javascript/)
* [general frontend tips](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)
* [a nice op-ed](https://www.martinfowler.com/bliki/CodeAsDocumentation.html)
* THE complete guide to [self-documenting code](http://wiki.c2.com/?SelfDocumentingCode)
* [another article](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)  
* [Airbnb style guid](https://github.com/airbnb/javascript)  
* [Watch and Code](https://watchandcode.com/p/premium). Gordon teaches reading code, but costs a little.  
* [chaining methods to write sentences](http://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/)   
___
# Your Assignment

Read through these articles that discuss a few elements of writing good clean code.

1. [This article about self-documenting JavaScript](https://www.sitepoint.com/self-documenting-javascript/). \(It's not as crazy as it sounds\)  
2. [This list of clean-code tips](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/).  
3. [This article](https://blog.codinghorror.com/coding-without-comments/), [and this one too](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/) about the role of comments in your code.

 ___
### Bonus Section - LITERATE PROGRAMMING
If you take this concept to it's absurd conclusion you arrive at something called __Literate Programming__.  In literate programming, the reader comes first and the computer second.  A 'literate program' reads and looks like a story with code snippets where you would expect illustrations. We won't talk about this paradigm in class but it's worth a look if you're interested

Literate resources:
* [A tool for writing literate programs](https://github.com/zyedidia/Literate).  This repo is a CLI that allows you to write your program in markdown with snippets of JS interspersed.  It will then compile the markdown into JS.  What's super cool about this tool is you can use it for programming in any language.  The examples are in C and I bet you could still understand them.
* [The original paper by proposing Literate Programming](http://www.literateprogramming.com/knuthweb.pdf).  [Donald Knuth](http://www-cs-faculty.stanford.edu/~knuth/) came up with the idea.  He's brilliant. Awards have been invented so he could recieve them.  

