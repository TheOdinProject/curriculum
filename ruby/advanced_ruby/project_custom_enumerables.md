### Introduction
You should be very familiar with the Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods. To prove that there's no magic to it, you're going to rebuild those methods.

We will explain an example of how an enumerable works to give you an idea of how to start tackling these methods. Specifically were going to breakdown the `sort` enumerable method. The sort method sorts the elements by comparing their values based on whether one elment is bigger, equal or smaller than the next element as shown below. 

~~~

a = [1, 2, 3, 4]

a.my_map {|n| n + 2}
# results in [3, 4, 5 6]

~~~

Now the question is how would we rebuild this method using our knowledge of yield and blocks? Let's go over the example shown below line by line.

~~~

class Array
  def my_map
    ary = []
    
    self.each do |elem|
      ary << yield(elem)
    end
    
    ary
  end
end

~~~

ary in this case would be the array that we use to put in our results from building our map method. Self in this case is _calling the method on itself_ which is how were able to do `.my_map` without having to pass the array directly through the method parameters. Now that we that self refers to the array we can use the `each` method to pass each element. Now this is where yield becomes extremely useful. In our very first example of using `a.map` we used a special tool called a block. The block in this case is the `a.my_map {}` and this is where the values our changed. `yield` in this case specifies _what_ is passed, in this case the elem. Now that elem has been yielded it's accessible through the `{}` brackets and we can perform an operation on it. In this case adding two and therefore we use the shovel method to add that element to the array that has been yield to the block/`{}`. To recap briefly, the element is given to the `yield` through the elem or can be done by just putting something in the `{}` such as `puts 5` and the `{}` brackets is where the operation is performed. In essence the block/`{}` is where the `yield` operation is performed.
### Assignment
<div class="lesson-content__panel" markdown="1">

1. Fork and clone our [custom enumerables repo](https://github.com/TheOdinProject/custom_enumerable_project)
2. Follow the [instructions in the README](https://github.com/TheOdinProject/custom_enumerable_project#installation) to get the repo setup locally
3. Rebuild each of [the methods in this table](https://github.com/TheOdinProject/custom_enumerable_project#methods) and make sure they all pass the tests associated with them.

</div>
