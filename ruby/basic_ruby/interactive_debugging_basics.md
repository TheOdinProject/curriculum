
### Introduction

Print debugging is a great way to get started with debugging, and using `binding.irb` is even better to get interactive feedback from your program. But to really take your debugging skills to the next level, you will need to learn how to use a dedicated debugging tool. These tools are similar to an interactive REPL such as IRB, but provide even more features such as the ability to step through your code line by line. This gives you more flexibility in understanding what your code is doing without polluting it with a bunch of `puts` statements.

As of Ruby 3.1, the language has a brand new debugger called [`rdbg`](https://github.com/ruby/debug) (as in **r**uby **d**e**b**ugge**r**). If you're using Ruby 3.1 or later it comes preinstalled and ready to go. Otherwise, you can install (or update) it with the command `gem install debug`.

### Lesson overview

- What breakpoints are and how to use them
- How to use continue
- How to use basic debugging commands (ls, whereami, info)
- Debugger as a supercharged IRB

### Entering a debugging session

Getting started is easy. The first step is to require the `debug` gem in the file you want to debug. Next, we need to insert a [breakpoint](https://en.wikipedia.org/wiki/Breakpoint) - essentially, a place where we tell our program to pause so we can start controlling the flow of it manually using our debugger. We can do that by adding the command `binding.break`.

_Get more value of these by copying this into your own file and following along - don't be afraid to experiment too!_

```ruby
# debug_example.rb
require 'debug'

a = 5
b = 7

binding.break

c = 5 * 4
d = a + b
e = 'I am a'
f = 'string!'
g = e + f
h = g.split
i = h.last
p i
```

Finally, run your program as you normally would, eg:

```shell
odin@valhalla:~/odins-codin$ ruby debug_test.rb 
```

and your program should run until it hits the breakpoint, where it will begin a debugging session.

```ruby
[1, 10] in debug_test.rb
     1| require 'debug'
     2| 
     3| a = 5
     4| b = 7
     5| 
=>   6| binding.break
     7| 
     8| c = 5 * 4
     9| d = a + b
    10| e = 'I am a'
=>#0    <main> at debug_test.rb:6
(rdbg) 
```

Lets break down the output and learn what we're looking at here.

```ruby
# 1
[1, 10] in debug_test.rb
```

1. At the top we can see a signpost for what we're currently looking at - lines 1 to 10 of the file `debug_test.rb`.

```ruby
# 2
     1| require 'debug'
     2| 
     3| a = 5
     4| b = 7
     5| 
=>   6| binding.break
     7| 
     8| c = 5 * 4
     9| d = a + b
    10| e = 'I am a'
```

2. Next we have a section of the code we're debugging. The arrow on line 6 is pointing to where our program has paused.

```ruby
# 3
=>#0    <main> at debug_test.rb:6
```

3. Here we see information about the current frame(s). This code was called from `main`, the top level Ruby object and is currently stopped at line 6 of the file `debug_test.rb`. We'll go into more detail about frames and the stacktrace soon, but for now we just need to recognise what this line means.

```ruby
# 4
(rdbg)
```

4. Finally, we have the debugging prompt - this is where we can enter debugging commands or evaluate Ruby code (just like IRB). Lets learn some of the basic commands now.

### Basic Commands

Before stepping through, lets get the lay of the land and see what state our program is currently in. We can do that by running the `info` debugging command (or `i` for short. There are a lot of shortcuts like this - from now on we'll write them like this - `[i]info`).

```ruby
(rdbg) info    # command
%self = main
a = 5
b = 7
c = nil
d = nil
e = nil
f = nil
g = nil
h = nil
i = nil
(rdbg)
```

This gives us a list of all the local variables currently in scope. However, we can see that so far only `a` and `b` have values - that's because our program has stopped between `b` and `c` and doesn't know what those variables hold yet.

Lets fix that by going to the next line with the, you guessed it, `[n]ext` command, and inspect the updated value of `c`.

```ruby
(rdbg) next    # command
[3, 12] in debug_test.rb
     3| a = 5
     4| b = 7
     5| 
     6| binding.break
     7| 
=>   8| c = 5 * 4
     9| d = a + b
    10| e = 'I am a'
    11| f = 'string!'
    12| g = e + f
=>#0    <main> at debug_test.rb:8
(rdbg) p c    # command
=> nil
(rdbg) 
```

Huh, what gives? We're on line 8 but `c` is still returning `nil`. That's because the debugger stops _before_ the current line is executed. Easy fix, lets skip forward a few lines with `next 2` and try `info` again.

```ruby
(rdbg) next 2    # command
[5, 14] in debug_test.rb
     5| 
     6| binding.break
     7| 
     8| c = 5 * 4
     9| d = a + b
=>  10| e = 'I am a'
    11| f = 'string!'
    12| g = e + f
    13| h = g.split
    14| i = h.last
=>#0    <main> at debug_test.rb:10
(rdbg) info    # command
%self = main
a = 5
b = 7
c = 20
d = 12
e = nil
f = nil
g = nil
h = nil
i = nil
(rdbg) 
```

That's better. We've jumped forward two lines this time and can now see the updated values of `c` and `d`. If we want, we can also write regular Ruby in the console like we normally would in IRB. You'll see the prompt change from `rdbg` to `ruby` to indicate this.

```ruby
(ruby) 50 + 50
100
```

This can be useful to know, because sometimes variable names can clash with debugging commands. For instance, if we want to know the value `a` we can just type it to find out. But what if we wanted to know the value of `i`?

```ruby
(rdbg) a
5
(rdbg) i    # info command
%self = main
a = 5
b = 7
c = 20
d = 12
e = nil
f = nil
g = nil
h = nil
i = nil
(rdbg) 
```

Oops. We ran the debugging command shortcut for `info` instead of looking at the variable `i`. While this will only be an issue in a few cases, we can get around it easily by using our normal Ruby inspecting commands.

```ruby
(rdbg) p i    # command
=> nil
```

If we've found what we're looking for and want to exit the debugger, we can do that with the `[c]ontinue` command. Your program will resume running normally to the end, unless you've added breakpoints in other spots.

### Conclusion

In this lesson you learned the basics of what `rdbg` is, how to add it your program and some basic commands for stepping through and inspecting your code.

In the next lesson we'll introduce a few different methods for stepping through your code, and explain the differences between them.

> **Info Box** - Other helpful commands
> 
> `[o]utline` or `ls` will show you information about current local variables and objects.
> 
> `whereami` will re-display the source code along with the arrow to show you where you're at in the code. Useful if you've been typing a bunch of commands and have forgotten where you're at.
> 
> `[q]uit` similar to continue, but will immediately exit the program without running anymore code.
> 
> `irb` if you like, you can use this to enter a regular irb session inside the debugger. Use `exit` to go back to `rdbg`.
> 
> As an alternative to `binding.break`, you can also use `binding.b` or `debugger` instead. They're functionally exactly the same.

### Assignment
```html
<div class="lesson-content__panel" markdown="1">
 Add an exercise?
</div>
```

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- Q with link etc

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [Official documentation for the Ruby debug gem](https://github.com/ruby/debug)
