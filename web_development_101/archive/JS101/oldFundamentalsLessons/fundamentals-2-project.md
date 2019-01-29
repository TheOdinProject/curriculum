It's time to write some code. Here we're going to introduce you to automated code testing and then give you a _lot_ of practice writing code that uses the skills you've been obtaining throughout the lessons.

## Test Driven Development

Test Driven Development \(TDD\) is a phrase you hear thrown around quite a lot in the dev world.  Basically it refers to the practice of writing automated tests that describe exactly how you want your code to work before you actually write that code.  For example, if you want to write a function that adds a couple of numbers, you would first write a test that uses the function and supplies the expected output.  Before you write your code the test will fail, and you should be able to know that your code works correctly when the tests pass.

In many ways TDD is much more productive than writing code without tests.  If we didn't have the test for the adding function above, we would have to run the code ourselves over and over, plugging in different numbers until we were sure that it was working... not a big deal for a simple `add(2, 2)`, but imagine having to do that for more complicated functions, like checking whether or not someone has won a game of tic tac toe: \(`game_win(["o", null,"x",null,"x",null,"x", "o", "o"])`\)

For the moment we are not going to teach you how to write these tests, because it can be a bit of an art in and of itself.  The following exercises have the tests already written out for you. All you have to do is read the specs and write the code that makes them pass!  The very first exercise \(`01-helloWorld`\) is intentionally very simple and walks you through the process of running the tests and making them pass.

### Good Luck!

1. JS test-first exercises \(roll our own\)

   * We have a repo for these: [https://github.com/TheOdinProject/javascript-exercises](https://github.com/TheOdinProject/javascript-exercises "We have a repo for these").  There are instructions on downloading and running them there!
   * Complete the following exercises:

     * helloWorld
     * repeatString
     * reverseString
     * removeFromArray
     * sumAll
     * leapYears

     * tempConversion



