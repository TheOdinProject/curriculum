## Miscellaneous Issues
### Intro and Goals
Here are some useful things that don't really fit nicely into another section.

### Thought Questions
* What is `nil`?
* How do you check if something is `nil`?
* What's the difference between `nil` and `blank` and `empty`?
* Are the following `nil` or `empty`?
    * `" "`, `""`, `[]`, `[""]`, `{}` 
* What's the difference between `puts` and `p` and `print`?
* What does `inspect` do?
* What do `+=`, `-=`, `*=` and `/=` do?
* What is parallel assignment?
* What's the easiest way to swap two variables?
* TODO: Boolean variables getting a ? method.

### Check These Out First
* [Nil vs Empty vs Blank](http://stackoverflow.com/questions/885414/a-concise-explanation-of-nil-v-empty-v-blank-in-ruby-on-rails)
* [p vs puts in Ruby](http://stackoverflow.com/questions/1255324/p-vs-puts-in-ruby)

### A Brief Summary
So **What is `nil`?** It represents nothing... literally.  Before you assign a value to something, it starts as `nil`, for instance an item in an array or a variable:
    
    > my_arr = []
    => []
    > my_arr[3]
    => nil          # hasn't been assigned yet

Sometimes you want to know if a value or variable is `nil` before doing something (because otherwise the operation would throw a bunch of errors at you).  Use the method `nil?` to ask whether it's nil or not beforehand.

    > nil.nil?
    => true
    > [].nil?
    => false        # Waitasecond....

Why is `[]` not nil?  The array itself exists so it isn't nil... it just happens to contain no values yet so it's empty.  If we asked for the first value of that array using `[][0].nil?`, that would be `true`

If you try to run a method on something that is `nil`, which you will inevitably do many many times by accident, you'll get the familiar `NoMethodError`:

    > user_i_looked_up_but_was_not_found_so_is_nil.empty?
    => NoMethodError: undefined method `empty?' for nil:NilClass

**`blank?` and `empty?`** are similar -- both basically check if the object has nothing in it -- but `blank?` will also ignore any whitespace characters.  *Note that `blank?` is a method provided by Rails and is not available in Ruby*.

We've seen lots of `puts` so far but you've probably also run across `p`  **What's the Difference?**  `p` will give you some more information because it runs the `inspect` method on the object while `puts` runs the `to_s` method.  **`inspect`** is meant to be informative where `puts` is "pretty".  The difference may not be readily apparent while you're only working with simple objects like strings and arrays, but you'll notice it when you start creating your own objects and you want to see what's inside (without typing out `puts my_object.inspect`).

`=` is an **Assignment Operator** but there are a few others that are interesting and common shorthands as well:
* `a += b` is the same as `a = a + b`
* `a -= b` is the same as `a = a - b`
* `a *= b` is the same as `a = a * b`
* `a /= b` is the same as `a = a / b`
* `a %= b` is the same as `a = a % b`
* `a **= b` is the same as `a = a ** b`

**Parallel Assignment** is when you assign the values of more than one variable at a time (though it works for arrays as well!):

    > a, b = 1, "hi"
    => [1, "hi"]      # ignore this output
    > a
    => 1
    > b
    => "hi"
    > my_array = [1,2,3,4]
    => [1,2,3,4]
    > my_array[1], my_array[3] = 100, 200
    => [100,200]      # ignore
    > my_array
    => [1,100,3,200]

It's also a great way to **Swap Two Variables**:

    > a = 10
    > b = 20
    > a,b = b,a
    > a
    => 20
    > b
    => 10

### Exercises
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*

1. TODO 

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
