### Introduction
In Ruby, Enumerable is a module that provides a set of methods that are available to collection classes, such as Array or Hash. The basic requirement to use enumerable methods is that the collection class in question must have an #each method.

Collection classes that want to take advantage of Enumerable methods must implement an `#each` method. This method must yield successive members of the collection, which allows Enumerable to do it's thing. Therefore, while `#each` is *not* an Enumerable method, it is the basis for how they work.


### The `#count` method
The `#count` method returns the total number of elements in a collection. Additionally, when passed a block, it can also return the number of elements that yield a true value. Like `#each`, this method takes a block with one parameter (or two&mdash;`key` and `value`&mdash;when called on a hash).

~~~ruby
my_array = ["apple", "banana", "strawberry", "pineapple"]

my_array.count                                    #=> 4
my_array.count { |fruit| fruit.length > 6 }       #=> 2

my_hash = { "one" => 1, "two" => 2, "three" => 3, four: 4 }

my_hash.count                                     #=> 4
my_hash.count { |key, value| key.is_a?(Symbol) }  #=> 1
~~~

### The `#sort` method
`#sort` is a method that can operate with or without a block being passed to it. By default, it sorts elements in ascending order, both numerically and alphabetically, by using the elements' `<=>` operator (a.k.a., the spaceship operator). This implies that the items being compared are of the same type, naturally (you'll get `nil` otherwise). This operator returns **-1**, **0**, or **1** depending on the whether the first item is less than, equal to, or greater than the second element, respectively.

~~~ruby
"apple" <=> "strawberry"  #=> -1
"strawberry" <=> "apple"  #=> 1
~~~

When you pass a block to `#sort`, the behavior is essentially the same: lesser comes first, greater comes after. You yield and compare two elements at a time, `a` and `b`, for example. Then, the block should return:
* An integer **lesser** than 0, if `a` should come before `b`
* 0, if `a` is equal to `b` (this can produce unstable orders, though); OR,
* An integer **greater** than 0, if `a` should come after `b`

Based on all the points above, it's also possible to sort items in *descending* order:
~~~ruby
my_array = ["strawberry", "apple", "banana"]

my_array.sort
#=> ["apple", "banana", "strawberry"]

my_array.sort { |a, b| b <=> a }
#=> ["strawberry", "banana", "apple"]
~~~

Don't worry if it takes a few minutes for your mind to wrap around this. Read through it step by step, and check into our Discord to say hello if you still feel lost (mental breaks are always a good thing).

### The `#find` method
The `#find` method is similar to `#select`, except it returns only the first item which meets the given criteria. If no such item exists, it returns `nil`. Using the same example as above:

~~~ruby
my_array = ["strawberry", "apple", "banana"]

my_array.find { |word| word.length > 5 && word.length < 10 }
#=> "banana"
~~~

`#find` is useful if you want to be able to use the results in somewhat advanced conditional logic, since `nil` is falsy while anything returned (other than `false`) would be truthy. Don't worry if you can't quite follow it, but an example would be:

~~~ruby
word = my_array.find { |word| word.length > 9 && word.length < 10 }
if word
  puts word
else
  puts "No object found"
end
#=> No object found
~~~
