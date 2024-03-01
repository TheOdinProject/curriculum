### Introduction

Asynchronous code can become difficult to follow when it has a lot of things going on. `async` and `await` are two keywords that can help make asynchronous read more like synchronous code. This can help code look cleaner while keeping the benefits of asynchronous code.

For example, the two code blocks below do the exact same thing. They both get information from a server, process it, and return a promise.

```javascript
function getPersonsInfo(name) {
  return server.getPeople().then(people => {
    return people.find(person => { return person.name === name });
  });
}
```

```javascript
async function getPersonsInfo(name) {
  const people = await server.getPeople();
  const person = people.find(person => { return person.name === name });
  return person;
}
```

The second example looks much more like the kind of functions you are used to writing. However, did you notice the `async` keyword before the function declaration? How about the `await` keyword before `server.getPeople()`?

If you'd like to try running these functions on your own, paste the following code block representing a server before the function definitions. How this "server" works is not important and is just an abstraction. The goal here is so that you can see that both functions behave exactly the same and return a promise.

```javascript
const server = {
  people: [
    {
      name: "Odin",
      age: 20,
    },
    {
      name: "Thor",
      age: 35,
    },
    {
      name: "Freyja",
      age: 29,
    },
  ],

  getPeople() {
    return new Promise((resolve, reject) => {
      // Simulating a delayed network call to the server
      setTimeout(() => {
        resolve(this.people);
      }, 2000);
    });
  },
};
```

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

 - Explain how you declare an `async` function.
 - Explain what the `async` keyword does.
 - Explain what the `await` keyword does.
 - Explain what an `async` function returns.
 - Explain what happens when an error is thrown inside an `async` function.
 - Explain how you can handle errors inside an `async` function.

### The async keyword

The `async` keyword is what lets the JavaScript engine know that you are declaring an asynchronous function. This is required to use `await` inside any function. When a function is declared with `async`, it automatically returns a promise; returning in an `async` function is the same as resolving a promise. Likewise, throwing an error will reject the promise.

An important thing to understand is `async` functions are just syntactical sugar for `promises`.

The `async` keyword can also be used with any of the ways a function can be created. Said differently: it is valid to use an `async` function anywhere you can use a normal function. Below you will see some examples that may not be intuitive. If you don't understand them, come back and take a look when you are done with the assignments.

```javascript
const yourAsyncFunction = async () => {
  // do something asynchronously and return a promise
  return result;
}
```

```javascript
anArray.forEach(async item => {
  // do something asynchronously for each item in 'anArray'
  // one could also use .map here to return an array of promises to use with 'Promise.all()'
});
```

```javascript
server.getPeople().then(async people => {
  people.forEach(person => {
    // do something asynchronously for each person
  });
});
```

### The await keyword

`await` does the following: it tells JavaScript to wait for an asynchronous action to finish before continuing the function. It's like a 'pause until done' keyword. The `await` keyword is used to get a value from a function where you would normally use `.then()`. Instead of calling `.then()` after the asynchronous function, you would assign a variable to the result using `await`. Then you can use the result in your code as you would in your synchronous code.

### Error handling

Handling errors in `async` functions is very easy. Promises have the `.catch()` method for handling rejected promises, and since async functions just return a promise, you can call the function, and append a `.catch()` method to the end.

```javascript
asyncFunctionCall().catch(err => {
  console.error(err)
});
```

But there is another way: the mighty `try/catch` block! If you want to handle the error directly inside the `async` function, you can use `try/catch` just like you would inside synchronous code.

```javascript
async function getPersonsInfo(name) {
  try {
    const people = await server.getPeople();
    const person = people.find(person => { return person.name === name });
    return person;
  } catch (error) {
    // Handle the error any way you'd like
  }
}
```

Doing this can look messy, but it is a very easy way to handle errors without appending `.catch()` after your function calls. How you handle the errors is up to you, and which method you use should be determined by how your code was written. You will get a feel for what needs to be done over time. The assignments will also help you understand how to handle your errors.

### Practice

Remember the Giphy API practice project? (If not, you should go back and complete the API lesson). We are going to convert the promise based code into `async/await` compatible code. Here's a refresher of the code we are starting with:

```javascript
<script>
  const img = document.querySelector('img');
  fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'})
    .then(function(response) {
      return response.json();
    })
    .then(function(response) {
      img.src = response.data.images.original.url;
    });
</script>
```

Since `await` does not work on the global scope, we will have to create an `async` function that wraps our API call to Giphy.

```javascript
<script>
  const img = document.querySelector('img');

  async function getCats() {
    fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'})
      .then(function(response) {
        return response.json();
      })
      .then(function(response) {
        img.src = response.data.images.original.url;
      })
  }
</script>
```

Now that we have a function that is asynchronous, we can then start refactoring from using promises to using `await`:

```javascript
<script>
  const img = document.querySelector('img');

  async function getCats() {
    const response = await fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'});
    response.json().then(function(response) {
      img.src = response.data.images.original.url;
    });
  }
</script>
```

Since `response` is still the same object we have passed to the `.then()` block at the start, we still need to use the `.json()` method, which in turn returns a promise. Because `.json()` returns a promise, we can use `await` to assign the response to a variable.

```javascript
<script>
  const img = document.querySelector('img');

  async function getCats() {
    const response = await fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'});
    const catData = await response.json();
    img.src = catData.data.images.original.url;
  }
</script>
```

To use this function, we just need to call it with `getCats()` in our code.

```javascript
<script>
  const img = document.querySelector('img');

  async function getCats() {
    const response = await fetch('https://api.giphy.com/v1/gifs/translate?api_key=YOUR_KEY_HERE&s=cats', {mode: 'cors'});
    const catData = await response.json();
    img.src = catData.data.images.original.url;
  }
  getCats();
</script>
```

This code will behave exactly like the code from the last lesson; it just looks a bit different after refactoring. `async/await` are very useful tools when it comes to cleaning up asynchronous JavaScript code. It is important to remember `async/await` are just promises written in a different way. Do the assignments below, and dive deeper into the understanding of `async/await`.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read this [Async and Await article](https://javascript.info/async-await) for a solid introduction to async/await. This [Async and Await examples article](https://codeburst.io/javascript-es-2017-learn-async-await-by-example-48acc58bad65) also has some good examples of its use.
2. Watch this [Async and Await video by Wes Bos](https://www.youtube.com/watch?v=9YkUCxvaLEk) for a good overview on async/await and its purpose, along with a special trick.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

 - [How do you declare an `async` function?](#the-async-keyword)
 - [What does the `async` keyword do?](#the-async-keyword)
 - [What does the `await` keyword do?](#the-await-keyword)
 - [What is returned from an `async` function?](https://javascript.info/async-await#summary)
 - [What happens when an error is thrown inside an `async` function?](https://javascript.info/async-await#error-handling)
 - [How can you handle errors inside an `async` function?](https://javascript.info/async-await#error-handling)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- This [Change promises to async/await video](https://www.youtube.com/watch?v=COKdtOgopWQ) is an example of how you can change callbacks, to promises, to async/await.
- This [Promises, Async and Await video](https://www.youtube.com/watch?v=vn3tm0quoqE) gives a comprehensive view of Promises, async, and await.
- For a more interactive explanation and example, try a [Scrim on async and await](https://scrimba.com/scrim/crd4eMc6?embed=odin,mini-header,no-next-up).
