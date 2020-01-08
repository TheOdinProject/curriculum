### Introduction
Let's practice!  This testing thing really is not that difficult, but it _is_ quite new.  The only way to get comfortable with it is to spend some time doing it.

### Assignment

<div class="lesson-content__panel" markdown="1">
Write tests for the following functions, and then make the tests pass!

1. `capitalize(string)` takes a string and returns that string with the first character capitalized.

2. `reverseString(string)` takes a string and returns it reversed.

3. A `calculator` object that contains the basic operations: `add`, `subtract`, `divide`, and `multiply`.

4. Caesar Cipher. [Read about it on this website](http://practicalcryptography.com/ciphers/caesar-cipher/)

   1. Don’t forget to test wrapping from `z` to `a`.
   2. Don’t forget to test keeping the same case.
   3. Don't forget to test punctuation!
   4. For this one, you may want to split the final function into a few smaller functions.  One concept of Testing is that you don't need to explicitly test _every_ function you write... Just the public ones.  So in this case you only need tests for the final `caesar()` function.  If it works as expected you can rest assured that your smaller helper functions are doing what they're supposed to.

5. Array Analysis.  Write a function that takes an array of numbers and returns an object with the following properties: `average`, `min`, `max`, and `length`.

   ~~~javascript
   const object = analyze([1,8,3,4,2,6]);

   object == {
     average: 4,
     min: 1,
     max: 8,
     length: 6
   };
   ~~~
</div>

### Special Note on using ES6 import statements with Jest

The current version of Jest as it is does not recognize the import statement. In order for you to be able to use ES6 modules for this project you may do the following:

1. Install the @babel/preset-env package


```
npm i -D @babel/preset-env
```

2. Create a .babelrc file in the project's root with the following lines of code:

```
{
  "presets": ["@babel/preset-env"]
 }
```

This will allow you to use import statements. Note that in the Jest docs a similar instruction is laid out [here](https://jestjs.io/docs/en/getting-started#using-babel)

###  Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it by using any of the methods listed on the contributing page.  See the Google Homepage project for examples.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [Igorashs's solution](https://github.com/igorashs/tdd-jest-practice)
- [Vedat's solution](https://github.com/mvedataydin/tdd-jest)
- [Ben's solution](https://github.com/Koshoo/jest-testing-practice)
- [Solodov's solution](https://github.com/solodov-dev/top-js-tdd)
- [ARaut9's solution](https://github.com/ARaut9/javascript_testing)
- [Jason McKee's solution](https://github.com/jttmckee/testing-javascript)
- [Max Garbers's solution](https://github.com/bubblebooy/Odin-Javascript/tree/master/jest-testing)
- [theghall's solution](https://github.com/theghall/odin-jestpractice)
- [Jmooree30's solution](https://github.com/jmooree30/Jest-Tests)
- [Devon's solution](https://github.com/defitjo/Jest-Testing-Javascript)
- [Rhys' solution](https://github.com/105ron/odin-js-test)
- [heyalvaro's solution](https://github.com/heyalvaro/jestTestPractice)
- [Mike Smith's solution](https://github.com/MikeSS281986/Unit-Testing-)
- [MPalhidai's solution](https://github.com/MPalhidai/testing)
- [Areeba's solution](https://github.com/AREEBAISHTIAQ/Jest-testing-project)
- [scotth527's solution](https://github.com/scotth527/jest_practice)
- [Ryan Floyd's solution](https://github.com/MrRyanFloyd/odin-test-driven-development)
- [Aron's solution](https://github.com/aronfischer/jest_testing_basic_exercises)
</details>

