### Introduction
This lesson is going to build on your knowledge of arrays and hashes. As you have seen, arrays and hashes are great ways to store data. However, sometimes the data is more complex and needs more structure than a basic array or hash offers. 

Let's take a look at how you can use nested arrays and nested hashes to store more complex data.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

- Describe a nested array and hash.
- Explain what data is useful to store in a nested array and hash.
- Explain how to access data in a nested array and hash.
- Explain why the `#dig` method is useful.
- Explain how to add data to a nested array and hash.
- Explain how to delete data in a nested array and hash.
- Explain how to create a new nested array that is not mutable.
- Explain how to iterate over a nested array and hash.

### Nested Arrays
Arrays can contain any type of data, including other arrays. An array that contains other arrays is called a nested array, or a multidimensional array.

Nested arrays can be useful to store groups of similar data or positional data. The following nested array of test scores is storing groups of similar data and the teacher mailboxes is storing groups of positional data.

~~~ruby
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]
~~~

### Accessing Elements
You already know that every element in an array has an index. Accessing a specific element within a nested array is as simple as calling `array[x][y]`, where `x` is the index of the nested element and `y` is the index inside of the nested element.

~~~ruby
teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"
~~~

You can also use negative indices to return elements from the end of an array, starting at [-1].

~~~ruby
teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"
~~~

If you try to access an index of a nonexistent nested element, it will raise an `NoMethodError`, because the nil class does not have a `[]` method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.

~~~ruby
teacher_mailboxes[3][0]
#=> NoMethodError
teacher_mailboxes[0][4]
#=> nil
~~~

If you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the `#dig` method. This method can also be used when accessing a nonexistent index inside of an existing nested element.

~~~ruby
teacher_mailboxes.dig(3, 0)
#=> nil
teacher_mailboxes.dig(0, 4)
#=> nil
~~~

### Creating a new nested array
Now that you have seen how to access values inside a nested array, we need to take a step back to look at creating a new nested array. In a previous lesson you were taught to create a new array, by calling the Array.new method with up to 2 optional arguments (initial size and default value), like `Array.new(3)` or `Array.new(3, 7)`. However, there is one major "gotcha" that is important to point out. According to the [documentation](https://ruby-doc.org/core-2.7.2/Array.html) the second optional argument, for the default value, should only be used with an immutable (unable to be changed) object such as a number, boolean value, or symbol. Using a string, array, hash, or other mutable object may result in confusing behavior because each default value in the array will actually be a *reference to* the same default value. Therefore, any change to **one** of the elements will change **all** of the elements in the array.

To create an array of mutable objects, you will need to pass the default value to `Array.new` in a block, using curly braces, instead of the second optional argument. This creates *distinct copies* of the default value in the array, rather than references to the same default value.

To see this for yourself, let's look at two examples. This first example uses the second optional argument for the default value.

~~~ruby
mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]
~~~

Changing the value of the first element in the first nested array, causes the first element to change in all three nested arrays! This same behavior will happen with strings, hashes, or any other mutable objects.

Now, let's take a look at an example that omits the second optional argument and instead passes in the mutable value in a block.

~~~ruby
immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]
~~~

Changing the value of the first element in the first nested array does not cause the value to change in any other nested array.

### Adding and Removing Elements
You can add another element to the end of nested array using the `#push` method or the shovel operator `<<`. If you want to add an element to a specific nested array, you will need to specify the index of the nested array.

~~~ruby
test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
~~~

Using this similar syntax, you can add or remove elements from the entire nested array or from a specific nested element.

~~~ruby
test_scores.pop
#=> [100, 99, 98, 97]
test_scores[0].pop
#=> 100
test_scores
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
~~~

### Iterating over a nested array
Let's break down how to iterate over a nested array using the `#each_with_index` method. I find it helpful to think of a nested array as having rows and columns. Each row is the nested element and each column is the index of the nested element. When we iterate over the teacher_mailboxes example, each element will be one row.

~~~ruby
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
~~~

To iterate over the individual elements inside of each row, you will need to nest another enumerable method inside.

~~~ruby
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
~~~

Although these examples are a bit contrived, it is important to note that if we only need each teacher's name it would be beneficial to use `#flatten` before iterating.

~~~ruby
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end
#=> Adams is amazing!
#=> Baker is amazing!
#=> Clark is amazing!
#=> Davis is amazing!
#=> Jones is amazing!
#=> Lewis is amazing!
#=> Lopez is amazing!
#=> Moore is amazing!
#=> Perez is amazing!
#=> Scott is amazing!
#=> Smith is amazing!
#=> Young is amazing!
#=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]
~~~

Now let's take a look at a more complicated example of nesting two predicate enumerables together. Using the above nested array of test scores, let's determine if any student scored higher than 80 on everything.

~~~ruby
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
#=> false
~~~

This seems pretty straight-forward. It returns false, because none of the nested arrays have scores that are all over 80. What do you think will happen if we switch `#any?` and `#all?`? Do you think we will get the same results?

~~~ruby
test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end
#=> true
~~~

The results are different, because now it is determining if **all** of the nested arrays contain **any** number over 80. This returns true, because each of the nested arrays have at least one number over 80.

### Nested Hashes
The hashes that you've seen so far have single key/value pairs. However, just like arrays, they can be nested, or multidimensional. Nested hashes are very common way to store complex associated data.

~~~ruby
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}
~~~

### Accessing Data
Accessing a specific element in a nested hash is very similar to a nested array. It is as simple as calling `hash[:x][:y]`, where `:x` is the key of the hash and `:y` is the key of the nested hash.

~~~ruby
vehicles[:alice][:year]
#=> 2019
vehicles[:blake][:make]
#=> "Volkswagen"
vehicles[:caleb][:model]
#=> "Accord"
~~~

Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an `NoMethodError`, therefore you may want to use the `#dig` method. As expected, if you try to access a nonexistent key in an existing nested hash, it will return nil.

~~~ruby
vehicles[:zoe][:year]
#=> NoMethodError
vehicles.dig(:zoe, :year)
#=> nil
vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil
~~~

### Adding and Removing Data
You can add more nested hashes, just like a regular hash. Let's say Dave just bought a new vehicle and we want to add it to the list.

~~~ruby
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
~~~

You can also add an element to one of the nested hashes. Let's say that Dave really loves his new Escape and thinks we should keep track of the color of the vehicles. To add a new key/value pair to a nested hash, specify the key of the nested hash right before naming the new key.

~~~ruby
vehicles[:dave][:color] = "red"
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
~~~

Deleting one of the nested hashes will be just like a regular hash. Let's say Blake has decided to sell his Beetle and backpack across Europe. So, let's delete Blake's car.

~~~ruby
vehicles.delete(:blake)
#=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
~~~

To delete one of the key/value pairs inside of a nested hash, you first specify the key of the hash. Let's say Dave decided that we don't need to specify the color of his vehicle. Therefore, we specify `vehicles[:dave]` before we indicate the key of the nested hash to delete.

~~~ruby
vehicles[:dave].delete(:color)
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
~~~

### Methods
There are many helpful methods to use with nested hashes. Once you know what data you need from a nested hash, I have found that browsing through the documentation and experimenting with them in IRB is the best way for me to understand how they work.

Let's look at an example using the vehicles nested hash. Let's say that we want to know who owns vehicles that are from 2020 or newer. At first glance in the documentation, it looks like `#select` would be a great method to use.

~~~ruby
vehicles.select { |_name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
~~~

Yes, using `#select` gives us the information that we need. However, what if we only want the names of the owners and not another nested hash. Let's keep looking through the documentation to see what else we find. The `#collect` method sounds very useful for this situation. Let's collect the names if the year is 2020 or newer.

~~~ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]
~~~

Using `#collect` gets us a lot closer to only having the names of the new vehicle owners. If you look at this method in the documentation you will see that `#collect` and `#map` have the same functionality. Both of these methods use the return value of each interation, so when the if statement is false, it will return a nil value.

Nil values can cause problems down the road, so let's look through the documentation to see if we can find a method to help solve this problem. The `#compact` method returns an array (or hash) without nil values, so let's chain it on the end of the block.

~~~ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:caleb, :dave]
~~~

Yes, using `#collect` and `#compact` returns the data that we want. As you can see, chaining methods can be very useful. However, if we continue exploring the documentation, we will find another method that combines the functionality of these two methods. Ruby version 2.7 added a new enumerable method called `#filter_map` that sounds very useful for this situation.

~~~ruby
vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]
~~~

Amazing! We have found a great solution to returning an array that only contains the names of the owners of vehicles from 2020 or newer! Plus, we got experience using other methods that you will probably use in the future. I have found some really useful methods by exploring the documentation when I have a specific use case in mind.

### Assignment
<div class="lesson-content__panel" markdown="1">

1. To learn more about using a hash with a nested array, read [this article](https://learn.co/lessons/nested-hash-iteration) from Learn.co.
2. To learn more about using an array with a nested hash, read [the answer to this post](https://stackoverflow.com/questions/50529389/manipulating-output-from-an-array-of-nested-hashes-in-ruby) on Stack Overflow.

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental if you need to dive deeper into something.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

- What is a nested array and hash?
- What data is useful to store in a nested array and hash?
- How do you access data in a nested array and hash?
- Why is the `#dig` method useful?
- How do you add data to a nested array and hash?
- How do you delete data in a nested array and hash?
- How do you create a new nested array that is not mutable?
- How do you iterate over a nested array and hash?
