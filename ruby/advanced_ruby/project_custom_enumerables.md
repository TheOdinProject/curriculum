### Introduction
You should be very familiar with the Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods. To prove that there's no magic to it, you're going to rebuild those methods.

We will explain an example of how an enumerable works to give you an idea of how to start tackling these methods. Specifically we're going to break down the `#find` enumerable method. The `#find` method finds the first element that matches the given block's condition and returns it. If one isn't found, it returns `nil`.

```ruby
a = [1, 2, 3, 4]
a.find { |n| n == 2 }
# results in `2`

a.find { |n| n == 10 }
# results in `nil`
```

Now the question is how would we rebuild this method using our knowledge of yield and blocks? Let's go over the example shown below line by line.

```ruby
module Enumerable
  def my_find
    self.each do |elem|
      return elem if yield(elem)
    end

    nil
  end
end

a = [1, 2, 3]
a.my_find { |n| n == 2 }
#=> 2
```

First of all, we're doing something you've maybe not seen before here: manipulating an existing class/module in the Ruby language. Ruby allows you to do this. We can reopen the `Enumerable` module and add our custom methods there.

With `self.each`, we're calling the `#each` method on the object instance that's invoking this method. In the example, this will end up being an array. So `self` will refer to the array that's calling `#my_find`. We can then use the `#each` method to iterate through its elements. Now this is where `yield` becomes extremely useful. When called inside of the `#my_find` method, `yield` will give control to the block that has been provided for `#my_find`. In the usage example just below the definition, we can see the `{ |n| n == 2 }` block is passed to the `#my_find` method. Inside of `#my_find`, each element in the array gets yielded to that block as an argument.

If the block returns `true`/truthy for an element, we immediately `return` that element. If nothing is found, we'll iterate all the way through the array and end up executing the `nil` return at the very end. Pretty cool, huh? Now it's time for you to practice:

### Assignment
<div class="lesson-content__panel" markdown="1">

1. Fork and clone our [custom enumerables repo](https://github.com/TheOdinProject/custom_enumerable_project)
2. Follow the [instructions in the README](https://github.com/TheOdinProject/custom_enumerable_project#installation) to get the repo setup locally
3. Rebuild each of [the methods in this table](https://github.com/TheOdinProject/custom_enumerable_project#methods) and make sure they all pass the tests associated with them.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
