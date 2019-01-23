### Introduction
To create programs that are user friendly and interactive, you'll need to know how to **output** data to a screen and how to get **input** from a user. In this lesson, we'll cover the most common ways to achieve these tasks in Ruby. As with other lessons, and this one in particular, following along in irb or a REPL will be helpful.

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

 - Differentiate between the `print` and `puts` commands.
 - Describe the method used to get input from the user.

### Output Commands
* In order to output the information we want we shall use the **print** command !	
```ruby
print "Learning to code is FUN!" #=> Learning to code is FUN!
```
```ruby
print "1234" #=> 1234
```

* In order to output the information we want we can also use the **puts** command !	
```ruby
puts "Learning to code is cool!!" #=> Learning to code is cool!!
```
```ruby
puts "hey I want 2 lemonades" 
#=> hey I want 2 lemonades
x = "My name is ALEX :)"
puts x
#=> My name is ALEX :)
```
The **puts** command has similar behavior with **print** command BUT it adds a new line at the end of each argument (we shall see the difference more extensively regarding these commands when we study about arrays and how to display them properly).
More specifically, pay attetion to the following examples and their outputs :

* **E.g. 1**
 ```ruby
print "Hello World"
print "I love drinking coffee"
#=> Hello WorldI love drinking coffee
``` 
 * **E.g.2**
```ruby 
puts "Hello World"
puts "I love drinking coffee"
#=> Hello World
#=> I love drinking coffee
```
*Attention:* we declare a string/text with single or double quote but when we select to output it to the user screen the quotes are not included because they are used to define the text between them.

### Input Commands
* In order to input some information from the user we can use **gets** command!
. When we use the gets command, the program execution will stop and wait for a user's input. This is achieved by displaying a cursor to the user's terminal so as to type the input value. After the user types something he MUST press enter (or return) in order for the program to continue it's execution!

* Let's say for the sake of our example that the user types blue sky and then press enter
```ruby
input = gets   
puts input  
#=> blue sky
```
So the programm above will output to our screen the variable named *input* which has stored the user input (as a text), in this case: "blue sky". 


### BEWARE
All of the above commands are what we call Case Sensitive. This basically means that our computer (compiler) strictly considers print, gets and puts command in THIS TEXT FORMAT  and NOT ANY OTHER. For example, the computer will not execute our commands if we type Print, PRInt,  Gets, getS, pUts etc...


### Assignment
- Read through and play around with the code regarding: [user output](https://www.learnrubyonline.org/en/Hello%2C_World%21). 

- Read (and code along to your terminal) the following chapters: [The gets Statement, The puts Statement, The print Statement](https://www.tutorialspoint.com/ruby/ruby_quick_guide.htm).
