### Introduction
At the beginning of this section, you learned how to create and manipulate numbers and strings and how to assign them to variables. In real-world development, where you'll be working with dozens (and even hundreds!) of variables, working with numbers and strings individually is tedious, if not impossible.

One way Ruby allows you to represent a collection of data is with **arrays**, which you can think of as lists. Rather than working with individual variables, numbers, or strings, an array allows you to create and manipulate an ordered and indexed collection of these dat. The individual variables, numbers, or strings within an array are known as **elements**. An array can contain any combination of variables, numbers, strings, or other Ruby objects (including other arrays), although it is advisable to keep similar data types in any one array.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Describe what an array is, and explain why it's useful.
 - Describe two different ways of creating a new array.
 - Explain how to access array elements using different methods.
 - Explain three different ways to add data to an array.
 - Explain how to remove elements from an array.

### Creating Arrays
Here are two basic arrays:

~~~ruby
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]

num_array.length        #=> 5
str_array.length        #=> 5
~~~

Both arrays have five elements separated by commas. The first array contains integers, while the second array contains strings. 

Arrays are commonly created with an **array literal**, which is simply a special syntax used to create instances of an array object. To create a new array using an array literal, use square brackets (`[]`).

An array can also be created by calling the `Array.new` method. When you call this method, you can also include up to 2 optional arguments (initial size and default value):

~~~ruby
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, "Hello")   #=> ["Hello", "Hello", "Hello"]
Array.new(3, Array.new) #=> [[], [], []]
~~~

### Accessing Elements
Every element in an array has an **index**, which is a numerical representation of the element's position in the array. Like most other programming languages, Ruby arrays use **zero-based indexing**, which means that the index of the first element is 0, the index of the second element is 1, and so on. Accessing a specific element within an array is as simple as calling `myArray[x]`, where `x` is the index of the element you want. Calling an invalid position will result in `nil`. Ruby also allows the use of negative indices, which return elements starting from the *end* of an array, starting at [-1].

~~~ruby
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
~~~

Finally, Ruby provides the `first` and `last` array methods, which should be self-explanatory. What may not be obvious, however, is that these methods can take an integer argument (`myArray.first(n)` or `myArray.last(n)`), which will return a new array that contains the first or last `n` elements of `myArray`.

~~~ruby
str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
~~~

### Adding and Removing Elements
Adding an element to an existing array is as simple as calling `push` or using the shovel operator `<<`. Both methods will add elements to the end of an array and return that array with the new elements. The `pop` method will remove the element at the end of an array and return the element that was removed.

~~~ruby
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]
~~~

The methods `shift` and `unshift` are used to add and remove elements at the beginning of an array. The `unshift` method adds elements to the beginning of an array and returns that array (much like `push`). The `shift` method removes the first element of an array and returns that element (much like `pop`).

~~~ruby
[1, 2, 3, 4].unshift(0)   #=> [0, 1, 2, 3, 4]

num_array = [1, 2, 3]

num_array.shift           #=> [1]
num_array                 #=> [2, 3]
~~~

It's also useful to know that both `pop` and `shift` can take integer arguments:

~~~ruby
num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3)          #=> [4, 5, 6]
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]
~~~

### Adding and Subtracting Arrays
What do you think will be the outcome of `[1, 2, 3] + [3, 4, 5]`?

If you guessed `[1, 2, 3, 3, 4, 5]`, congratulations! Adding two arrays will return a new array built by concatenating them. The `concat` method works the same way.

~~~ruby
a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]
~~~

To find the difference between two arrays, you can subtract them using `-`. This method returns a copy of the first array, removing any elements that appear in the second array.

~~~ruby
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]
~~~

### Basic Methods
Ruby gives you many methods to manipulate arrays and their contents, many of which are beyond the scope of this article. For full documentation, go to [http://ruby-doc.org/](http://ruby-doc.org/), click on "Core API", and scroll down to Classes: Array. There, you'll find the most up-to-date documentation on the various methods available to Ruby arrays, along with explanations.

Calling the `methods` method on an array will also yield a long list of available methods, like so:

~~~ruby
num_array.methods       #=> A very long list of methods
~~~

### Other Useful Methods
As previously mentioned, there are many methods available to Ruby arrays (over 150!). Additionally, the behavior of some methods change depending on a variety of factors, such as if they take arguments or not. For at least these reasons, [ruby-doc.org](http://ruby-doc.org/) ***will*** be your best friend in maximizing your aptitude with arrays. So go soon, and go often.

Nevertheless, here is a brief look at some other common methods you might run into.

~~~ruby
[].empty?               #=> true
[[]].empty?             #=> false
[1, 2].empty?           #=> false

[1, 2, 3].reverse       #=> [3, 2, 1]

[1, 2, 3].include?(3)   #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"
~~~

### Assignment
<div class="lesson-content__panel" markdown="1">
  1. Follow along to Launch School's chapter on [Arrays](https://launchschool.com/books/ruby/read/arrays), and go through the exercises using IRB or any other REPL, such as [repl.it](https://repl.it/languages/ruby).
  2.[Read The Definitive Guide to Ruby Arrays by Jesus Castello](https://www.rubyguides.com/2015/05/ruby-arrays/).
  3. What do you think the methods `#clear`, `#insert`, `#sample`, `#shuffle`, and `#uniq` do? Look at the array class methods at ruby-doc.org [here](http://ruby-doc.org/core-2.4.0/Array.html) and look up the methods. Were you close?
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Look over the latest Ruby API documentation on Arrays [here](http://ruby-doc.org/) by clicking on "Core API" and searching for "Array". There, you'll find the most up-to-date documentation on the various methods available to the Array object, along with explanations.
* If you need a different take on Arrays, give this article by [zetcode](http://zetcode.com/lang/rubytutorial/arrays/)
* Arrays also allow for **set operations**. Read about them [here](http://blog.endpoint.com/2011/06/using-set-operators-with-ruby-arrays.html). Don't worry about the simple bookshelf example. Classes and Rails will be covered later!

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

* What is an array and why is it useful?
* What are two ways to create a new empty array?
* What are some ways of accessing the elements in an array?
* What are 3 ways to add data to an array?
* How can you remove elements from an array?