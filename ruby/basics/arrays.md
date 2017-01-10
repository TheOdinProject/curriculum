<!--Chris Pine covers:-->
<!--* array literals-->
<!--* accessing via index-->
<!--* #each & #times methods-->
<!--* #to_s, #join-->
<!--* #push/#pop, #last, #length-->

I add:
* array initializing
* negative indices

# Arrays
At the beginning of this section, you learned about creating and manipulating individual instances of number and string objects. In real-world development, where you'll be working with dozens (and even hundreds!) of such objects and variables, working with individual instances will be tedious, if not impossible.

One way Ruby allows you to represent a collection of such objects is with the use of **arrays**. Rather than working on individual objects at a time, an array allows you to create and manipulate an ordered and indexed collection of such objects (known as **elements** within the array) as a list. An array can contain any combination of Ruby objects (including other arrays), though it is advised that you keep similar objects in any one array.

## Learning outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* The student understands what an array is
* The student knows how to create an array
* The student knows how to access data in an array
* The student knows the different methods for adding data to an array
* The student knows the different methods for removing data from an array
* The student knows the different methods for iterating through an array

## Creating arrays
Here are two basic arrays:

```
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]

num_array.length        #=> 5
str_array.length        #=> 5
```

Both arrays have five elements. The first array contains integers separated by commas, while the second array contains strings. Arrays are commonly created with an **array literal**. In Ruby, a literal is a special syntax used to create instances of an object. For the array, that is the square brackets.

An array can also be created by calling the `#new` method and 0-2 arguments, including initial size and a default object:

```
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, "Hello")   #=> ["Hello", "Hello", "Hello"]
Array.new(3, Array.new) #=> [[], [], []]
```

## Basic Methods
Ruby gives you many methods to manipulate arrays and their contents, many of which are beyond the scope of this article. For full documentation, go to [http://ruby-doc.org/](http://ruby-doc.org/), click on "Core API", and scroll down to Classes: Array. There, you'll find the most up-to-date documentation on the various methods available to Ruby arrays, along with explanations.

Calling `#methods` on an array will also yield a long list of available methods, like so:

```
num_array.methods       #=> A very long list of methods
```

### Accessing element
Like most other programming languages, Ruby arrays use **zero-based indexing**. As you learned in Chris Pine's tutorial, accessing an array's element is as simple as calling the `#[]` method with the **index**, or position, you desire. Recall that calling an invalid position will result in `nil`.

Additionally, Ruby also allows the use of negative indices, which return elements starting from the *end* of an array at [-1].

```
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[10]           #=> nil

str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
```

Finally, Ruby provides the `#first` and `#last` methods, which should be self-explanatory. What may not be obvious, however, is that these methods can take an argument that will return a *new* array.

```
str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
```

### Adding and removing elements
Adding an element to an existing array is as simple at calling `#push` or the shovel operator `<<`. Both methods will add elements to the end of an array and return that array, so the methods can be chained. The `#pop` method will remove an element from the end of an array and return that element, rather than returning the array. Therefore, it cannot be chained.

```
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array.push(5).push(6) #=> [1, 2, 3, 4, 5, 6]

num_array << 7            #=> [1, 2, 3, 4, 5, 6, 7]

num_array.pop             #=> 7
num_array.pop.pop         #=> undefined method 'pop' for Fixnum
```

The methods `#shift` and `#unshift` can also be used to remove the first element of an array and to add elements to the beginning of an array, respectively.



* Addition/concatenation and substraction/difference
* Other useful methods (empty?, include?, reverse, join)

## Exercises
A group of exercises (If Applicable) for the student to complete in relation to the topic taught in the lesson.

## Assignment
* Read [Beginning Ruby](https://www.amazon.co.uk/Beginning-Ruby-Professional-Peter-Cooper/dp/1484212797/ref=sr_1_1?ie=UTF8&qid=1475608118&sr=8-1&keywords=beginning+ruby) Chapter 3: "Ruby's Building Blocks: Data, Expressions, and Flow Control", focusing on pages 47-52 (third ed.) titled "Arrays and Lists" for a preliminary treatment on what arrays can do.
* Follow along this [article](https://launchschool.com/books/ruby/read/arrays#whatisanarray) by Launch School, and go through the exercises using IRB or any other REPL, such as [repl.it](https://repl.it/languages/ruby).

## Additional Resources
* Look over the latest Ruby API documentation on Arrays [here](http://ruby-doc.org/) by clicking on "Core" and searching for "Array". There, you'll find the most up-to-date documentation on the various methods available to the Array object, along with explanations.

Link to no more than three additional resources to avoid this section becoming too cluttered.
