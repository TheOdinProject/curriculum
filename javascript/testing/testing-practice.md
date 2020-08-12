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

By default, the current version of Jest will not recognize ES6 import statements. In order for you to be able to use ES6 modules for this project you may do the following:

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
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/javascript/testing/testing-practice.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [ray0h's Solution](https://github.com/ray0h/TOP-TDDPractice)
- [Rizwan's Solution](https://github.com/xRizwan/TDD-jest)
- [Kevin's Solution](https://github.com/Kevin-Satti-Projects/Projects/tree/master/Testing)
- [vonhoro's Solution](https://github.com/vonhoro/Testing-with-jest)
- [Andres Ruiz's Solution](https://github.com/Andrsrz/unit-test-practice)
- [blackstate's solution](https://github.com/blackstate/testing-practice-jest/)
- [Luky's solution](https://github.com/lcyne/testing-practice-jest)
- [Cody Degen's solution](https://github.com/codydegen/testing_practice)
- [Jdonahue135's solution](https://github.com/jdonahue135/jest-testing-practice)
- [mjwills-inf's solution](https://github.com/mjwills-inf/-TOP-testing-practise)
- [Andrey's solution](https://github.com/AndreySkopintsev/javascript-unit-testing)
- [jc's Solution](https://github.com/avazkhan2808/project-testing)
- [Chaitanya's solution](https://github.com/Chaitanya-Raj/TDD-Jest)
- [James's solution](https://github.com/ericksen-github/testing_practice)
- [Kevin Vuong's solution](https://github.com/fffear/jest-testing-practice)
- [Julio's solution](https://github.com/julio22b/tdd-jest)
- [Martink-rsa's solution](https://github.com/martink-rsa/Jest-testing)
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
- [Ivnosing's solution](https://github.com/Ivnosing/testing-practice)
- [barrysweeney's solution](https://github.com/barrysweeney/JestTestingPractice)
- [gathoni's solution](https://github.com/gathoni-k/testing-practice-jest)
- [ranmaru22's solution](https://github.com/ranmaru22/the_odin_project/tree/master/js_testing)
- [Rey van den Berg's solution](https://github.com/Rey810/jest-practice)
- [Emil Dimitrov's solution](https://github.com/edmtrv/testing-practice)
- [JoshAubrey's solution](https://github.com/JoshAubrey/jest-testing-practice)
- [Joe Thompson's Solution](https://github.com/jlthompso/js_tests)
- [Tim Kelly's Solution](https://github.com/timkellytk/project-testing-practice)
- [Nijepa's Solution](https://github.com/nijepa/testing-practice)
</details>

