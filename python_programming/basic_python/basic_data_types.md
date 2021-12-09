### Introduction
Python is a strongly object-oriented language, which means that absolutely everything in Ruby is an object, even the most basic data types. We'll start here with four of Python's basic data types: numbers (integers and floats), strings, and Booleans (`True`, `False`).

For all of the examples throughout this lesson, feel free to follow along in irb or [repl.it](https://repl.it/languages/python) (an online REPL environment) to get a better feel for how they work.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - List the basic arithmetic operators and what they do.
 - Describe the difference between an integer and a float and how to convert between the two.
 - Explain string interpolation and concatenation.
 - Describe what escape characters are, and list several examples.
 - Define what a symbol is and how it differs from a string.
 - Explain what the Booleans `True` and `False`, and represent.

### Numbers
You probably already know what numbers are, so there's no need to go into elaborate metaphors here. Python has all the typical math operators you would expect:

~~~python
# Addition
1 + 1   # 2

# Subtraction
2 - 1   # 1

# Multiplication
2 * 2   # 4

# Division
10 / 5  # 2

# Exponent
2 ** 2  # 4
3 ** 4  # 81

# Modulus (find the remainder of division)
8 % 2   # 0  (8 / 2 = 4; no remainder)
10 % 4  # 2  (10 / 4 = 2 with a remainder of 2)
~~~

#### Integers and Floats
Python has three "numeric" types, integers, floats, and complex numbers. We'll focus on integers and floats. **Integers** are whole numbers, such as 10. **Floats** are numbers that contain a decimal point, such as 10.5, 10.0, or 0.25.

#### Converting Number Types
Python makes it very easy to convert floats to integers and vice versa.

~~~python
# To convert an integer to a float:
float(13)   # 13.0

# To convert a float to an integer:
int(13.0) # 13
int(13.9) # 13
~~~

As shown in the last example above, when Python converts a float to an integer, the decimal places are simply cut off. Python doesn't do any rounding in this conversion.

### Strings
Strings, strings, wonderful things, use them well and...your app will...grow wings? Or something.

At first glance, you might think that strings are just a bunch of characters that aren't very useful beyond getting user input and outputting some information to the screen, but like Burt Reynolds passing up the chance to play Han Solo, you'd be wrong. Very wrong. What were you thinking, Burt?

#### Double and Single Quotation Marks
Strings can be formed with either double `""` or single`''` quotation marks, also known as *string literals*. They are pretty similar, but there are some differences. Specifically, string interpolation and the escape characters that we'll discuss soon both only work inside double quotation marks, not single quotation marks.

#### Concatenation
You can put strings together using a feature called concatenation.

~~~python
# With the plus operator:
"Welcome " + "to " + "Odin!"    # "Welcome to Odin!"
~~~

#### Substrings
You can access strings inside strings inside strings. Stringception! It's super easy, too.

~~~python
"hello"[0]      # "h"

"hello"[0:2]   # "he"

"hello"[-1]     # "o"
~~~

#### Escape characters
Escape characters allow you to type in representations of whitespace characters and to include quotation marks inside your string without accidentally ending it. As a reminder, escape characters only work inside double quotation marks.

~~~python
\\  # Need a backslash in your string?
\r  # Carriage return, for those of you that love typewriters
\n  # Newline. You'll likely use this one the most.
\t  # Tab
\"  # Double quotation mark
\'  # Single quotation mark
~~~

The best thing to do is play around with them in irb or a REPL.


#### Interpolation
String interpolation allows you to evaluate a string that contains placeholder variables. This is a very useful and common technique, so you will likely find yourself using this often. There are a few ways to do this. Let's check them out!

##### f-strings
f-strings allow you to easily execute string interpolation. Take a look:

~~~python
name = "Odin"

print(f"Hello, {name}") # "Hello, Odin"
~~~

##### .format()

~~~python
name = "Odin"

print("Hello, {name}".format(name)) # "Hello, Odin"

website = "www.theodinproject.com"
print("Hello, {name}. Welcome to {website}.".format(
  name=name,
  website=website
))
~~~


#### Common String Methods
There are many useful string methods that are built into Python. You need to capitalize a word? No problem! Reverse a string? Easy peasy. Extract the binary subatomic algorithm from any regex grep? We don't know, but since this is Python, let's go with *YES*.

Just remember, strings have loads of methods provided to you for free, and you can find them all in the [Python docs](https://docs.python.org/3/library/string.html). If you're working with strings and need to do something, check the Python docs first and see if there's a method that does it for you.

Below is a quick recap of the more common string methods you might find yourself using:

**#title**

~~~python
"this is a title".title() # "This is a Title"
~~~

<span id="upcase">**#uppercase**</span>

~~~python
"hello".upper()  # "HELLO"
~~~

**#lowercase**

~~~python
"Hello".lower()  # "hello"
~~~

<span id="split">**#split**</span>

~~~python
"hello world".split()  # ["hello", "world"]

"hello, world".split(",") # ['hello', ' world']

"hello, world".split(", ") # ['hello', 'world']
~~~

**#strip**

~~~python
" hello, world   ".strip()  # "hello, world"
~~~

You'll read more about these methods and others in the assignment. You can find

#### Other useful actions you can perform on strings
**#in**

~~~python
"lo" in "hello"  # True

"z" in "hello"   # False
~~~

**#length**

~~~python
len("hello")  # 5
~~~


The assignments will go much deeper, so go through them thoroughly and be sure to play around in a REPL as you read.

#### Converting other objects to strings
Using the str() function, you can convert pretty much anything to a string. Here are some examples:

~~~python
str(5)        # "5"

str(None)      # "None"
~~~

### Booleans
You will learn about these data types in more detail in the Conditional Logic lesson later in this course. The goal of this lesson is for you to get a basic understanding of what Booleans are.

#### True and False
The Boolean values `True` and `False` represent exactly what you think they do: `True` represents something that is true, and `False` represents something that is false.

#### None
In Python, `None` represents "nothing". Everything in Python has a return value. When a piece of code doesn't have anything to return, it will return `None`. This is pretty abstract, but it will make more sense as you learn and use Python more.

### Assignment

<div class="lesson-content__panel" markdown="1">

<!-- TODO: Update w/python -->
1. Read [TODO](TODO) 
2. [TODO](TODO), for a basic understanding of what objects are in programming. We will explore this topic much deeper later in the course.
3. Finally complete the basic data types exercises provided for this lesson:
    * [Follow the instructions in the main README to set up the exercise repo](https://github.com/TheOdinProject/python-exercises)
    * [Follow the instructions in the README here to complete the basic data types exercises](https://github.com/TheOdinProject/python-exercises/tree/master/python_basics)
</div>

<!-- TODO: Update with Python -->
### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

* If you want to go deeper into Python's numeric and string data types, read TODO:
    * [Numerics](TODO)
    * [Strings](TODO)
* TODO

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* Numbers
  * <a class="knowledge-check-link" href="#numbers">What are the basic arithmetic operators you can use on numbers? </a>
  * <a class="knowledge-check-link" href="#integers-and-floats">What's the difference between an integer and a float?</a>
  * <a class="knowledge-check-link" href="#converting-number-types">What method would you use to convert a float to an integer?</a>
  * <a class="knowledge-check-link" href="#converting-number-types">What method would you use to convert an integer to a float?</a>

* Strings
  * <a class="knowledge-check-link" href="#strings">What is a string?</a>
  * <a class="knowledge-check-link" href="#double-and-single-quotation-marks">What are the differences between single and double quotes?</a>
  * <a class="knowledge-check-link" href="#interpolation">What is string interpolation?</a>
  * <a class="knowledge-check-link" href="#concatenation">How do you concatenate strings?</a>
  * <a class="knowledge-check-link" href="#upcase">What method would you use to change all the characters in your string to upper case?</a>
  * <a class="knowledge-check-link" href="#split">What method would you use to split up strings into arrays?</a>
  * <a class="knowledge-check-link" href="#escape-characters">What are escape characters?</a>
  * <a class="knowledge-check-link" href="#substrings">How do you access a specific character or substring?</a>
  * <a class="knowledge-check-link" href="#converting-other-objects-to-strings">How do you convert other data types into strings?</a>

* Booleans
  * <a class="knowledge-check-link" href="#true-and-false">What does `True` represent?</a>
  * <a class="knowledge-check-link" href="#true-and-false">What does `False` represent?</a>
  * <a class="knowledge-check-link" href="#nil">What does `None` represent?</a>
