## Hashes
### Intro and Goals

Hashes may be a bit intimidating at first but they're actually pretty similar to arrays.  They're basically just containers for data, like arrays, but instead of storing data based on a numeric indices, you use "keys" which can be strings or symbols.  This makes hashes more appropriate for storing data with a bit more depth to it.

### Thought Questions
* What is a hash?
* What are keys and values?
* How is a hash similar to an Array?
* How is a hash different from an Array?
* What are 3 ways to create a hash?
* What is the hash rocket?
* How do you access data in a hash?
* How do you change data in a hash?
* What are options hashes?
* How do you delete data from a hash?
* How do you add hashes together?
* How do you list out all the keys or values?
* How do you see if the hash contains a key or value?
* What is a set?

### Check These Out First
* [Treehouse's intro to Hashes video](http://www.youtube.com/watch?v=NvXeDtKkXq8), and don't worry about the awesome_print gem, it's not required.
* [Codecademy's section on Hashes](http://www.codecademy.com/courses/ruby-beginner-en-F3loB/1/1) for the basics.
* [Codecademy's hashes and symbols section](http://www.codecademy.com/courses/ruby-beginner-en-Qn7Qw) to bring together what we talked about in the strings section.
* Go back and do [Ruby Monk's Hashes section](http://rubymonk.com/learning/books/1/chapters/10-hashes-in-ruby/lessons/46-introduction-to-ruby-hashes) if you didn't do it during the Web Dev 101 section.  Shame on you for not doing it before >:o

### A Brief Summary

A *Hash* is just a container for data where each piece of data is mapped to a *Key*.  The data is called the *Value*.  Keys can be either strings or symbols. Values can be anything, just like with arrays.  A hash looks almost like an array, but with squiggly braces `{}` instead of hard ones `[]`  There's no order to a hash (unlike an array)... you're accessing your data using strings anyway so it doesn't matter which order they're in.

Make a new hash using several methods:

    > my_hash = Hash.new
    => {}
    > my_hash = {}        # easier way
    => {}

You store data in a hash by matching a key with a value.  Use the **Hash Rocket** `=>` (not to be confused with the same symbol in our IRB examples which denotes the IRB output) if you're creating the hash, or just index into it like an array using hard brackets `[]`

    > favorite_colors = { "eyes" => "blue", "hair" => "blonde"}
    => {"eyes"=>"blue", "hair"=>"blonde"}
    > favorite_colors["eyes"]
    => "blue"

**Change Data** in a hash just like an array, by indexing into it and assigning a new value.  Unlike an array, to create a new data item, just pretend it already exists and assign it a value:

    > favorite_colors["eyes"] = "green"       # Changing an item
    => "green"
    > favorite_colors
    => {"eyes"=>"green", "hair"=>"blonde"}
    > favorite_colors["skin"] = "suburned"    # Adding a new item
    => "sunburned"
    > favorite_colors
    => {"eyes"=>"blue", "hair"=>"blonde", "skin"=>"sunburned"}

Hashes are useful for lots of reasons behind the scenes, but it should be immediately obvious that you can handle more nuanced data than you can with arrays.  How about a dictionary of words?  Just store the words as keys and the meanings as values, if you so choose.  
You see hashes all the time in Rails, including as a way of passing options or parameters to a method (since they can store all kinds of different things and be variably sized), and these are often called **Options Hashes**.  Methods are often defined along the lines of `def method_name arg1, arg2, arg3, options_hash`, allowing the user to specify any number of different parameters for that method.  

Note that, when calling a method, if a hash is the last argument you are entering, *you can skip the squiggly braces*.  It's convenient, but can be a real head-scratcher for beginners who are trying to read code and wondering why there are methods being called with strangely mixed inputs and no braces:

    > some_object.some_method argument1, argument2, :param1 => value1, :param2 => value2

Or, for a real version in Rails that creates a link on the webpage and can optionally assign it an ID (among other things):

    > link_to "click here!", "http://www.example.com", :id => "my-special-link"

If you recall our discussion from Strings, we use symbols as keys for hashes more often than not.

    > favorite_smells = { :flower => "daffodile", :cooking => "bacon" }
    => { :flower => "daffodile", :cooking => "bacon" }

**Delete** from a hash by just setting the value to `nil` or by calling the `delete` method:

    > favorite_smells[:flower] = nil
    => nil
    > favorite_smells
    => {:cooking => "bacon" }             # one deleted...
    > favorite_smells.delete(:cooking)
    => "bacon"
    > favorite_smells
    => {}                                 # ...and the other.

That's all pretty straightforward.  What if we want to **add two hashes together**?  Just use `merge`  If there are any conflicts, the incoming hash (on the right) overrides the hash actually calling the method.

    > favorite_beers = { :pilsner => "Peroni" }
    => { :pilsner => "Peroni" }
    > favorite_colors.merge(favorite_beers)
    => {"eyes"=>"blue", "hair"=>"blonde", "skin"=>"sunburned", :pilsner => "Peroni"}       # okay, that's getting silly now...

If you want to know what **All the Keys** are (more common) or **All the Values*** are (less common) in a hash, just use the aptly named `keys` and `values` methods to spit them out as an array:

    > favorite_colors.keys
    => ["eyes", "hair", "skin", :pilsner]  
    > favorite_colors.values
    => ["blue", "blonde", "sunburned", "Peroni"]

A simpler kind of hash is called a **Set**, and it's just a hash where all the values are either True or False.  It's useful because your computer can search more quickly through this than an array trying to store the same information due to the way it's set up behind the scenes.  You'll encounter them in some of the exercises later.

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
