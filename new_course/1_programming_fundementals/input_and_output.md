<!-- This lesson will cover how to output things to the screen in Ruby and how to get input from the user. -->

### Introduction
When we execute a computer program in Ruby Programming Language, most of the times it is required to either **output** or **input** a piece of information to a computer screen.
For example, we may need to print (output) the information regarding a value of a number, your first and/or last name, etc. to the terminal. In contrast, we may require from the user to provide (input) the necessary information from the user screen (via using the keyboard) regarding e.g. a number (age), a small text (family’s name) etc.

### Learning Outcomes
* How can I produce an *input* ?
* How can I produce an *output* ?
* What is the basic syntax and use of the commands: *print*, *puts*, *gets*
* What is the difference in input commands (*puts* /*print*) suggested?

### Syntax of Basic Commands
* In order to output the information we want we shall use the **print** command !	
```ruby
print "Learning to code is FUN!" #=> will output to our screen the text Learning to code is FUN!
```
```ruby
print "1234" #=> will print to our screen the text 1234
```

* In order to output the information we want we can also use the **puts** command !	
```ruby
puts "Learning to code is cool!!" #=> will output to our screen the text Learning to code is cool!!
```
```ruby
puts "hey I want 2 lemonades" 
#=> will output to our screen the text hey I want 2 lemonades
x = "My name is ALEX :)"
puts x
   #=> will output to our screen the variable named x in which we have stored the text My name is ALEX :)
```

* In order to input some information from the user we can use **gets** command!
```ruby
y = gets   
#=> on our command line the program is waiting for user input. E.g. if we type blue sky and press enter
puts y  
#=> The output will be blue sky
#=> will output to our screen the variable named y which has stored the user input (as a text). 
```
#### Differences betwenn Basic Commands

Some differences between each command:

1. From the above mentioned examples we can see that for Ruby there is not a difference while declaring a text to have it enclosed between `"` or `'` (single or double quote symbol).

2. We declare a string/text with single or double quote but when we select to output it to the user screen the quotes are not included because they are used to define the text between them.

3. The **puts** command as we shall see later on has similar behavior with **print** command BUT it adds a new line at the end of each argument (we shall see the difference more extensively regarding these commands when we study about arrays and how to display them properly)

* **E.g. 1**
 ```ruby
print "Hello World"
print "I love drinking coffee"
#=> will output to our screen Hello WorldI love drinking coffee
``` 
 * **E.g.2**
```ruby 
puts "Hello World"
puts "I love drinking coffee"
#=> will output to our screen the following
#=> Hello World
#=> I love drinking coffee
```

*BEWARE*: all of the above commands are what we call Case Sensitive. This basically means that our computer (compiler) strictly considers print, gets and puts command in THIS TEXT FORMAT  and NOT ANY OTHER. For example, the computer will not execute our commands if we type Print, PRInt,  Gets, getS, pUts etc...


### Assignment
- Read through and play around with the code regarding: [user output](https://www.learnrubyonline.org/en/Hello%2C_World%21). 

- Read (and code along to your terminal) the following chapters: [The gets Statement, The puts Statement, The print Statement](https://www.tutorialspoint.com/ruby/ruby_quick_guide.htm).
