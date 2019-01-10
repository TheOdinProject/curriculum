### Introduction
At the beginning of this section, you learned about creating and manipulating individual numbers and strings and assigning them to variables. In real-world development, where you'll be working with dozens (and even hundreds!) of variables, working with numbers and strings individually will be tedious, if not impossible.

One way Ruby allows you to represent a collection of data types is with the use of **arrays**. Rather than working on individual variables, numbers, or strings at a time, an array allows you to create and manipulate an indexed collection of them (known as **elements** within the array). Think of arrays as a list! An array can contain any combination of variables, numbers, strings, or other Ruby objects (including other arrays).

### Learning Outcomes
*Look through these now and then use them to test yourself after doing the assignment*

* What is an array and why is it useful?
* What are two ways to create a new, empty array?
* What are some ways of accessing the elements in an array?
* What are 3 ways to add data to an array?
* How can you remove elements from an array?

### Creating Arrays

Here are two basic arrays:

```
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]

num_array.length        #=> 5
str_array.length        #=> 5
```

Both arrays have five elements separated by commas. The first array contains integers while the second array contains strings. Arrays are commonly created with an **array literal**. In Ruby, a literal is a special syntax used to create instances of an object. For the array, that is the square brackets `[]`.

An array can also be created by calling the `Array.new` method and up to 2 optional arguments (initial size and a default value):

```
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, "Hello")   #=> ["Hello", "Hello", "Hello"]
Array.new(3, Array.new) #=> [[], [], []]
```

### Accessing Elements
Like most other programming languages, Ruby arrays use **zero-based indexing**. As you learned in Chris Pine's tutorial, accessing an array's element is as simple as calling `myArray[x]`, where `x` is the **index**, or position, you desire. Recall that calling an invalid position will result in `nil`. Ruby also allows the use of negative indices, which return elements starting from the *end* of an array, starting at [-1].

```
str_array = ["This", "is", "a", "small", "array"]

str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
```

Finally, Ruby provides the `first` and `last` methods, which should be self-explanatory. What may not be obvious, however, is that these methods can take an argument that will return a *new* array.

```
str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
```

### Adding and Removing Elements

Adding an element to an existing array is as simple as calling `push` or the shovel operator `<<`. Both methods will add elements to the **end** of an array and return that array. Consequently, either method can be repeated or chained with other Array methods. On the other hand, the `pop` method will remove an element from the end of an array and return that element, rather than returning the array. Therefore, if `pop` returns an Integer or String, you will not be able to chain `pop` with another Array method.

```
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array.push(5).push(6) #=> [1, 2, 3, 4, 5, 6]

num_array << 7            #=> [1, 2, 3, 4, 5, 6, 7]

num_array.pop             #=> 7
num_array.pop.pop         #=> undefined method `pop' for 7:Integer
```

The methods `shift` and `unshift` can be used to operate at the **beginning** of an array. This may be confusing at first, but `unshift` will *add* elements to the beginning of an array and return that array, while `shift` will *remove* the first element of an array and return that element instead of the array (much like `pop`).

```
num_array = [1, 2, 3, 4]
num_array.unshift(0)   #=> [0, 1, 2, 3, 4]

num_array = [1, 2, 3, 4]
num_array.shift        #=> 1
num_array              #=> [2, 3, 4]
```

### Adding and Subtracting Arrays
What do you think will be the outcome of `[1, 2, 3] + [3, 4, 5]`?

If you guessed `[1, 2, 3, 3, 4, 5]`, congratulations! Adding two arrays will return a new array built by concatenating them. The `concat` method works the same way.

```
a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]
```

To find the difference between two arrays, you can subtract them using `-`. This method returns a copy of the first array, removing any elements that appear in the second array.

```
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]
```

### Basic Methods
Ruby gives you many methods to manipulate arrays and their contents, many of which are beyond the scope of this article. For full documentation, go to [http://ruby-doc.org/](http://ruby-doc.org/), click on "Core API", and scroll down to Classes: Array. There, you'll find the most up-to-date documentation on the various methods available to Ruby arrays, along with explanations.

Calling the `methods` method on an array will also yield a long list of available methods, like so:

```
[1, 2].methods       #=> A very long list of methods
```

### Other Useful Methods

As previously mentioned, there are many methods available to Ruby arrays (over 150!). Additionally, the behavior of some methods change depending on a variety of factors, such as if they take arguments or not. For at least these reasons, [ruby-doc.org](http://ruby-doc.org/) ***will*** be your best friend in maximizing your aptitude with arrays. So go soon, and go often.

Nevertheless, here is a brief look at some other common methods you might run into.

```
[].empty?               #=> true
[[]].empty?             #=> false
[1, 2].empty?           #=> false

[1, 2, 3].reverse       #=> [3, 2, 1]

[1, 2, 3].include?(3)   #=> true
[1, 2, 3].include?("3") #=> false

[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"
```

### Assignment
* What do you think the methods `#clear`, `#insert`, `#sample`, `#shuffle`, and `#uniq` do? Look at the array class methods at [ruby-doc.org](http://ruby-doc.org/core-2.4.0/Array.html) and look up the methods. Were you close?
* Follow along Launch School's chapter on [Arrays](https://launchschool.com/books/ruby/read/arrays#whatisanarray), and go through the exercises using IRB or any other REPL, such as [repl.it](https://repl.it/languages/ruby).
* Read through [Ruby Explained: Arrays](http://www.eriktrautman.com/posts/ruby-explained-arrays) by Erik Trautman.

### Further Reading
*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* If you need a different take on Arrays, give this article by [zetcode](http://zetcode.com/lang/rubytutorial/arrays/)
* Arrays also allow for **set operations**. Read about them [here](http://blog.endpoint.com/2011/06/using-set-operators-with-ruby-arrays.html). Don't worry about the simple bookshelf example. Classes and Rails will be covered later!
