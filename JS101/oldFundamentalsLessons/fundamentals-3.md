For the last leg of our tour of the basics of JavaScript we're going to learn about Objects and a more in-depth look at some useful things you can do with arrays.

### Points to Ponder

> Use this section to quiz yourself.  If you know all these answers then you can comfortably skip, or at least skim through this lesson.  After the lesson, come back here and read these again to make sure you haven't missed anything crucial.

<details>
  <summary>How are objects created using "object literal" syntax?</summary>
 
  * Object literal: 
      ```
      let user = {}; 
      /* you can also use let user = new Object();, but it is frowned upon in up-to-date style guides */
      ```
</details>

<details>
  <summary>How are properties added/accessed/removed from objects with dot notation?</summary>
  
  * Properties are added to objects using "key:value" pairs:
      ```
      let user = {
        name: "John", // key "name" stores value "John"
        age: 30,
        "likes birds": true
      };
      ```
  * The value of these keys can be accessed/removed/created with dot notation like so:
      ```
      alert(user.name); // John
      delete(user.age); // removes the "age" key:value pair
      user.hobby = "coding"; // creates "hobby" key:value pair
      ```
</details>

<details>
  <summary>How are properties accessed with square brackets? When is this useful?</summary>
  
  * `user["name"] // John`
  * This is useful when we have a multi-word key such as "likes birds" -- `user.likes birds // syntax error`
    * `user["likes birds"] // true`
  * Square brackets can also be used to access a property from the result of an expression - such as a variable - like so:
      ```
      let key = prompt("What property would you like?", "age");
      user[key] // 30
      user.key // undefined
      ```
  * They also come in handy when accessing a property in a sub-namespace:
      ```
      let person = {
        name: {
          first: "Bob",
          last: "Smith"
        }
      }
      
      person['name']['first']  // Bob
      ```
</details>

<details>
  <summary>How can you create an object using existing variables as its properties?</summary>
    
  * By using the function constructor method of creating objects:
  ```
  function User(name, age) {
    return {
      name,
      age
    };
  }
        
  let newUser = User("John", 30);
  alert(newUser.name); // John
  ```
</details>

<details>
  <summary>How do you call a function that is an object property?</summary>
  
 
  * It is important to remember, and easy to forget, to include the "()" at the end of the property name when calling an object's function:
      ```
      let person = {
        name: 'Bob',
        age: 32,
        bio: function() {
            alert('Hi, my name is ' + this.name + '.');
        }
      }
      
      person.bio() // Hi, my name is Bob.
      ```
</details>

<details>
  <summary>What is 'this' referring to within an object?   is it used?</summary>
    
  * `this` refers to the current object that the code  being written within.
  * In the previous example: `this` referred to `person`,  `this.name` was `Bob`.
    
</details>

### Objects101

Objects are a _very_ important part of the JavaScript language, and while for the most part you can accomplish simple and even intermediate tasks without worrying about them, any real project that you're going to attempt is going to feature Objects.  The uses of Objects in JavaScript can get deep relatively quickly, so for the moment we're only going to cover the basics.  There'll be an in-depth dive later.

1. [This JavaScript.io](http://javascript.info/object) article is the best place to get started with Objects.
2. [The MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics) isn't bad either, so check it out if you need another take on the subject.

### Intermediate/Advanced Array Magic

Besides being a quick and handy way to store data, arrays also have a set of functions for manipulating that data in very powerful ways.  Once you begin to master these functions you will start to see ways to use them all over the place! There are really only a handful of these functions... but as you'll soon see the possibilities of what you can do with them are near endless.

1. Start out by watching [this video](https://www.youtube.com/watch?v=HB1ZC7czKRs) from Wes Bos.  If you sign up for his course \(it's free!\) you can download the code and follow along.
2. Watch and code with [Part 2](https://www.youtube.com/watch?v=QNmRfyNg1lw) of Wes Bos's array series.



