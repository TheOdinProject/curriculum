Let's practice!  This testing thing really is not that difficult, but it _is_ quite new.  The only way to get comfortable with it is to spend some time doing it. 

## Your Assignment

Write tests for the following functions, and then make the tests pass!

1. `multiply(a, b)` simply takes 2 numbers and returns their product

2. `capitalize(string)` takes a string and returns that string with the first character capitalized. 

3. `reverseString(string)` takes an array and returns it reversed.

4. Caesar Cipher. [Read about it on this website](http://practicalcryptography.com/ciphers/caesar-cipher/)

   1. Don’t forget to test wrapping from `z` to `a`.
   2. Don’t forget to test keeping the same case.
   3. Don't forget to test punctuation!
   4. For this one, you may want to split the final function into a few smaller functions.  One concept of Testing is that you don't need to explicitly test _every_ function you write... Just the public ones.  So in this case you only need tests for the final `caesar()` function.  If it works as expected you can rest assured that your smaller helper functions are doing what they're supposed to.

5. Array Analysis.  Write a function that takes an array of numbers and returns an object with the following properties: `average`, `min`, `max`, and `length` 

   ```javascript
   const object = analyze([1,8,3,4,2,6])

   object == {
     average: 4,
     min: 1,
     max: 8,
     length: 6
   }
   ```

   ​

##  Student Solutions

Send us your solution so we can show others! Submit a link to the Github repo with your files in it by using any of the methods listed on the contributing page.  See the Google Homepage project for examples.

- Add your solution below this line!