### Introduction

Let's practice!  This testing thing really is not that difficult, but it *is* quite new.  The only way to get comfortable with it is to spend some time doing it.

### Using ES6 import statements with Jest

By default, the current version of Jest will not recognize ES6 import statements. In order for you to be able to use ES6 modules for this project you may follow the [Jest instructions for using Babel](https://jestjs.io/docs/en/getting-started#using-babel).

### Assignment

<div class="lesson-content__panel" markdown="1">

Write tests for the following, and then make the tests pass!

1. A `capitalize` function that takes a string and returns it with the first character capitalized.
1. A `reverseString` function that takes a string and returns it reversed.
1. A `calculator` object that contains functions for the basic operations: `add`, `subtract`, `divide`, and `multiply`. Each of these functions should take two numbers and return the correct calculation.
1. A `caesarCipher` function that takes a string and a shift factor and returns it with each character "shifted". Read more about [how a Caesar cipher works](https://crypto.interactive-maths.com/caesar-shift-cipher.html).
   1. Don’t forget to test wrapping from `z` to `a`. For example, `caesarCipher('xyz', 3)` should return `'abc'`.
   1. Don’t forget to test case preservation. The shifted lettercase should follow the original lettercase. For example, `caesarCipher('HeLLo', 3)` should return `'KhOOr'`.
   1. Don't forget to test punctuation. Punctuations, spaces, and other non-alphabetical characters should remain unchanged. For example, `caesarCipher('Hello, World!', 3)` should return `'Khoor, Zruog!'`.
   1. For this one, you may want to split the final function into a few smaller functions.  One concept of Testing is that you don't need to explicitly test *every* function you write... Just the public ones.  So in this case you only need tests for the final `caesarCipher` function.  If it works as expected you can rest assured that your smaller helper functions are doing what they're supposed to.
1. An `analyzeArray` function that takes an array of numbers and returns an object with the following properties: `average`, `min`, `max`, and `length`.

   ```javascript
   const object = analyzeArray([1,8,3,4,2,6]);

   object == {
      average: 4,
      min: 1,
      max: 8,
      length: 6
   };
   ```

</div>
