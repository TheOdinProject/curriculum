### Python Types

Now that we've made it through the installations and have mastered git, we can start learning some Python!  We're going to start with the foundational skills necessary to grow and develop into a true web developer. Types are the building blocks of any programming language because they tell the computer what kind of input to expect. Let's dig in.

### Learning Outcomes

* What is a string?
* What is an Integer?
* What is a Float?
* What is a Boolean Value?
* What is a List?
* What is a Dictionary?

### Strings

When you think about computers you probably think about 1's and 0's. While this is technically true most of the information we use are words and letters. These words and letters are called "strings."  When we want to display our favorite quote what do we use? String. When we text our bestie "What's hoppin?" we send them a string. Strings are ubiquitous and used all over the place.

### Integers

Less commonly used than strings, Integers are still an important part of any good program. Integers are simply whole numbers. 1, 2, and 3 are integers. 3.14 is not.

### Floats

We just learned that 3.14 is not an integer. If it's not an integer what is it? It's a Float. Floats are simply numbers with decimal points.

### Booleans

True or False: You know what a boolean is? "Booleans" data types are either "True" or "False." Booleans are often used in programming when you want to check if a condition has been met. "Is 1 greater than 2?" False - let's exit the program. "Is this user signed into their account?" True - let's show them their customized homepage.

### Lists

What happens when we want to store more than one string or number in a structured format? Say you were a school teacher and wanted to store the scores of all your student's grades on their midterm. It sure wouldn't make sense to store them as one long string, "76 89 67 94 86". In this case, we would want to use a "List." A list is a storage structure designed to hold multiple values in an organized way. There are many benefits to using a list such as the ability to easily select a value from the list, or run a task over each item in the list. We'll dig in to Lists in a bit.

### Dictionaries

Similar to Lists, Dictionaries are a "storage structure" for Strings, Integers, and Floats.  They are different from Lists in that they are called "Key-Value Stores", which simply means that all the data can be retrieved by using the key. Let's take a look:

```
students = {
  bob: {
    nickname: "Rob",
    weight: 150
    hight: 62.5
    funny: False
  },
  leslie: {
    nickname: "Les"
    weight: 122
    height: 56.0
    funny: True
  }
}
```

Don't get too worried about the syntax here, just understand that we can access any of the data of a student by accessing their "key." If we want all the data on Bob/Rob we can ask the students dictionary to return it to us: `bob.nickname` is "Rob"

### Test your knowledge

<details>
<summary>1. T/F: We store words and letters as <b>strings</b></summary>
<br>
True. Words are stored as <b>strings.</b>
</details>


<details>
<summary>2. The number 42 is a ____________ </summary>
<br>
The number 42 is an <b>integer</b>
</details>


<details>
<summary>3. T/F: We store organized data in <b>floats</b></summary>
<br>
False. We use <b>lists</b> and <b>dictionaries</b> to store organized data
</details>


<details>
<summary>4. The number 8.42 is a <b>string</b></summary>
<br>
False. The number 8.42 is a <b>float</b>
</details>

<details>
<summary>5. T/F: This question is a <b>boolean</b></summary>
<br>
True. True/False questions are <b>boolean</b> values.
</details>

### Conclusion

These 6 python types are the most important building blocks of any programming language. Knowing when to use a float over an integer or a dictionary over a list is a key concept that you can guarantee you'll be asked about in an interview when the time comes.
