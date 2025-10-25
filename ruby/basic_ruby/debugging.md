### Introduction

Tracking down and fixing both errors and unexpected behavior in your code is an inevitable part of being a developer. The art of finding the cause of problems and then fixing them in code is known as **debugging**. The [origin of the term "debugging"](https://en.wikipedia.org/wiki/Debugging#Etymology) is a classic computer science tale worth reading if you haven’t already.

In this lesson, we'll cover all of the main techniques you can use to debug your code when you run into a problem.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What a stack trace is.
- Using a stack trace to debug your code.
- Using `puts`, `p`, Pry and debug gem's VSCode integration to debug your code.
- How you should decide to start with debugging.

### Reading the stack trace

When your Ruby program crashes after encountering a runtime error or exception, it will produce a wall of text known as a **stack trace** that is then output in your terminal. A stack trace looks something like this:

![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)

Don't let the stack trace intimidate you. You don't need to read it all or even know what most of it means.

The stack trace prints each line of code in your program that was executed before it crashed. <span id='most-useful-stack-trace-line'>The very first line of the stack trace</span> will generally provide the most useful information about the error your program encountered:

![First line of stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/01.png)

<span id='stack-trace-first-line-info'>First, this line of the stack trace will tell you what specific line caused the runtime error. In the above example, the error was encountered in line 31 of the file `bottles.rb`. This line also provides a brief explanation of the error and the name of the error. (In this case, it's a [`NameError`](https://docs.ruby-lang.org/en/3.4/NameError.html)). And yes, in Ruby, [errors (Exceptions) are also objects](https://docs.ruby-lang.org/en/3.4/Exception.html).</span>

There you have it. At this point, you know where in your code the exception is being raised, and you know the type of error you're dealing with. You might even know what fixes need to be implemented in your code.

But what if you don't know how to fix your code? Then it's time to dive into debugging!

### Debugging with puts

The debugging process is all about confirming assumptions about your code until you find something that goes against your assumptions. For example, does a variable or method return what you expect? Does a calculation or iteration over an array or hash give the output you expect?

The easiest and quickest way to confirm your assumptions while debugging is by using `puts` statements to output the return value of variables, methods, calculations, iterations, or even entire lines of code to your terminal.

Let's say that for *whatever* reason, we need to write a method that takes a string and checks if the string is an **isogram** (a word that has no repeating letters) or not. Perhaps it's a hostage situation that requires a pro debugger? Let's take a look at a first draft:

```ruby
def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split
  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")

#=> false
```

Okay, that didn't work. We didn't expect that. Why? Because the string *Odin* is an isogram but we got `false`. The method didn't throw an exception, so we don't even have a line to start debugging at. Now what?

We know that `original_length == unique_length` returns `false` since it's the last statement, so why not place a `puts` on the line before that to see what `unique_length` is. As an alternative to `puts`, `p` is also commonly used for debugging; `p` is a combination of `puts` and `inspect` (more on that below). To better show the differences between what Ruby is printing to the terminal and returning, the examples in this section use the full IRB syntax, which is exactly what you'd see if you typed these commands into your own terminal IRB session.

```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*   unique_length = string_array.uniq.length
irb(main):005:1*
irb(main):006:1*   p unique_length
irb(main):007:1*
irb(main):008:1*   original_length == unique_length
irb(main):009:0> end
=> :isogram?
irb(main):010:0> isogram?("Odin")
1
=> false
```

*INTERESTING*. Using `p` on `unique_length` prints it to the console and shows us something must be wrong with how we called `#uniq` on `string_array` because we know that we have `4` unique characters in our input but we got `1` as output. For verification, let's place another `p` statement before the `unique_length` statement:

```ruby
irb(main):001:1* def isogram?(string)
irb(main):002:1*   original_length = string.length
irb(main):003:1*   string_array = string.downcase.split
irb(main):004:1*
irb(main):005:1*   p string_array
irb(main):006:1*
irb(main):007:1*   unique_length = string_array.uniq.length
irb(main):008:1*
irb(main):009:1*   p unique_length
irb(main):010:1*
irb(main):011:1*   original_length == unique_length
irb(main):012:0> end
=> :isogram?
irb(main):013:0> isogram?("Odin")
["odin"]
1
=> false
```

Indeed, we didn't use `#split` correctly, as it creates an array with the given string rather than an array of the string's characters. Why? By default, if we didn’t provide arguments, [the #split method](https://docs.ruby-lang.org/en/3.4/String.html#method-i-split) will divide the string using `whitespace` as the delimiter. Try running the above code in IRB using `#split('')` or an appropriate online REPL instead, and you'll see the difference.

Hostage situation resolved! That wasn't so bad, was it?

#### Debugging with puts and nil

Using `puts` is a great way to debug, but there's a **HUGE** caveat with using it: calling `puts` on anything that is `nil` or an empty string or collection will just print a blank line to your terminal.

This is one instance where using `p` will yield more information. As mentioned above, `p` is a combination of puts and [the #inspect method](https://docs.ruby-lang.org/en/3.4/Object.html#method-i-inspect), the latter of which essentially prints a string representation of whatever it's called on. To illustrate this, try the following in a REPL:

```ruby
puts "Using puts:"
puts []
p "Using p:"
p []
```

### Debugging with Pry-byebug

[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive REPL while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.

To use Pry-byebug, you'll first need to install it in your terminal by running `gem install pry-byebug`. You can then make it available in your program by requiring it at the top of your file with `require 'pry-byebug'`. Finally, to use Pry-byebug, you just need to call `binding.pry` at any point in your program.

To follow along with these examples save the code into a Ruby file (e.g., `script.rb`) and then run the file in your terminal (e.g., `ruby script.rb`)

```ruby
require 'pry-byebug'

def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

  binding.pry

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")
```

When your code executes and gets to `binding.pry`, it will open an IRB-like session in your terminal. You can then use that session to check the values of anything within the scope of where you included `binding.pry`. However, keep in mind that any code written *after* the `binding.pry` statement will not have been evaluated during the Pry session.

For example, here `original_length` and `string_array` are in scope. However, `unique_length` is not in scope, because it is written after `binding.pry` and has not been evaluated yet.

Thus, adding a `binding.pry` line in our code is similar to creating a breakpoint in JavaScript.

To see this point in action, try running the following:

```ruby
require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")
```

During the session, if you check for the value of `name`, you will notice that you get back the value `bob` instead of `BOB`. What value do you think `greeting` will return? Yup, it will be `nil`. This is because `name = name.upcase` and `greeting = "WASSAP, #{name}!"` occurred after the `binding.pry` call and were never evaluated.

Using the same example above, you can use one of pry-byebug's commands to figure out what `name = name.upcase` will return. You won't need to quit the session or add another `binding.pry` beneath it. Enter `next` to step over to the next line.

```ruby
[1] pry(main)> name
=> "bob"
[2] pry(main)> greeting
=> nil
[3] pry(main)> next

     5: def yell_greeting(string)
     6:   name = string
     7:
     8:   binding.pry
     9:
    10:   name = name.upcase
 => 11:   greeting = "WASSAP, #{name}!"
    12:   puts greeting
    13: end

[4] pry(main)> name
=> "BOB"

```

It stops after evaluating the next line. `name` now returns `BOB`. Calling `next` again will evaluate the following line. Try it out to know what `greeting` will return. [Pry-byebug has a few more commands](https://github.com/deivid-rodriguez/pry-byebug). Play around with them to get a feel of what they do.

As you can see, using Pry-byebug for debugging achieves the same outcome as `puts` debugging: it allows you to confirm the assumptions you have about particular parts of your code. If your code is complex, Pry-byebug will probably allow you to debug quicker thanks to its interactive runtime environment. In such scenarios, Pry-byebug will be easier to interact with than having to add `puts` statements everywhere and re-running your code each time.

There is far, far more that you can do with Pry-byebug, but that's beyond the scope of this lesson. Check out the Assignments and Additional Resources to find out where you can learn more about this useful gem.

### Debugging with vscode-rdbg

#### Step 1: Installation

1. Go to your [VSCode Extensions](https://code.visualstudio.com/docs/editor/extension-marketplace) and install the [Ruby LSP](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp) extension. This is a LSP(Language Server Protocol) which gives you autocompletion as you type ruby code in editor and much more amazing stuff.

1. Before installing `vscode-rdbg` extension let's fulfill it's requirements first.
You need to install latest `debug` gem and `rdbg` command should be in `$PATH` environment variable. A command in `$PATH` can be called from any directory.

   ```shell
   gem install debug
   ```

   ```shell
   which rdbg
   # /home/yourusernamehere/.rbenv/shims/rdbg
   ```

   If you don't see path output like the comment above ask for help in our [Discord community](https://discord.gg/fbFCkYabZB).

1. Now install the [VSCode rdbg Ruby Debugger](https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg) extension.

#### Step 2: Setup

1. Set version manager.

   1. Open VScode.
   1. Press <kbd>Ctrl</kbd> + <kbd>,</kbd> to open settings.
   1. Search "rdbg ruby version manager".
   1. Set it to `rbenv` which we made you install in [installing ruby lesson](https://www.theodinproject.com/lessons/ruby-installing-ruby#step-21-install-rbenv) , it's your version manager for ruby : [rbenv documentation](https://github.com/rbenv/rbenv).
   1. Search "ruby lsp version manager"
   1. Click on the 'Edit in settings.json' link
   1. Edit the identifier which is by default "auto" to "rbenv"

   1. Confirm settings.json have these two configurations set correctly:

      ```json
      {
        "rdbg.rubyVersionManager": "rbenv",
        "rubyLsp.rubyVersionManager": {
            "identifier": "rbenv"
        },
      }
      ```

#### Step 3: Get some bugs

Let's Add Some code files for demo:

1. Go to Desktop `cd ~/Desktop/` and create a new folder `mkdir dummy_name`.
1. Open the folder in vscode `code dummy_name/`
1. Create new file `main.rb` inside `dummy_name/` and copy the following code containing some bugs:

   ```ruby
   # check if password is correct
   def check_password(input)
     password = 'xajxwashere'
     if input = password
       puts "Access granted!"
     else
       puts "Wrong password."
     end
   end

   def start_password_input
     puts "Enter a password:"
     input = gets.chomp
     puts "result : #{check_password(input)}"
   end

   # give day name of the given day number
   def day_name(num)
     days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
     if num >= 1 && num <= 7
       days[num]
     else
       "Invalid"
     end
   end

   def start_day_name_input
     puts "Enter day number (1–7):"
     n = gets.to_i
     puts "Day is #{day_name(n)}"
   end
   ```

1. Create another file `not_main.rb` inside `dummy_name/` and copy the following code into `not_main.rb` :

   ```ruby
   puts "Sup Odin Student"

   def message_number(index)
     index + 1
   end

   5.times do |index|
     num = message_number(index)
     puts "message number: #{num}"
   end
   ```

#### Step 4: Create launch.json

1. Press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>D</kbd> to go to `Run And Debug` inside vscode.
1. Click 'create a launch.json file.' This file is used to configure our debugger.
1. Select `Ruby (rdbg)` option on the pop-up menu.
1. Close the 'launch.json' file tab and confirm that it's saved at this place `dummy_name/.vscode/launch.json`:
   ![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)

#### Step 5: Run Debugger

1. Open `not_main.rb` file and press <kbd>F5</kbd> OR on the menu bar click `Run` and inside it `Start Debugging`. By default the file currently opened will be ran.
1. You can toggle the `Debug Console Output` using <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Y</kbd>.
1. Confirm the code outputs inside `Debug Console Output` like this:
   ![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)
1. Move your mouse pointer to the left side of line number 7 and then left click to add a breakpoint:
   ![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)
1. Run Debugger again by pressing <kbd>F5</kbd>, the debugger will stop program on our breakpoint and give us some debugging actions to use.
   ![Sample stack trace](https://cdn.statically.io/gh/TheOdinProject/curriculum/a2cfa47e944fa8127ccf5faa6e1c7c328de42428/ruby/basic_ruby/debugging/imgs/00.png)
1. Read details of the commonly used debugging actions:

     | Action | Description |
     |:--|:--|
     | Continue / Pause <kbd>F5</kbd> | **Continue**: Resume normal program/script execution (up to the next breakpoint). **Pause**: Inspect code executing at the current line and debug line-by-line. (for short and fast programs you might not get the chance to pause quickly and code will execute fully) |
     | Step Over <kbd>F10</kbd> | Execute the next method as a single command without inspecting or following its component steps. |
     | Step Into <kbd>F11</kbd> | Enter the next method to follow its execution line-by-line. |
     | Step Out <kbd>Shift</kbd> + <kbd>F11</kbd> | When inside a method or subroutine, return to the earlier execution context by completing remaining lines of the current method as though it were a single command. |
     | Restart <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>F5</kbd> | Terminate the current program execution and start debugging again using the current run configuration. |
     | Stop <kbd>Shift</kbd> + <kbd>F5</kbd> | Terminate the current program execution. |

1. While watching local variables in the `VARIABLES` window of `Run And Debug` which is by default on the left side and also keeping `Debug Console Output` opened, keep pressing <kbd>F11</kbd> OR `Step Into` button and follow the code execution line-by-line, this file was only for introduction there are no bugs in it so start reading next step.

#### Step 6: Debug some code

1. Open `main.rb` and press <kbd>F5</kbd> to start debugger, notice the debugger disconnected immediately without running any code.
1. This is because currently the `main.rb` file is only defining methods using the `def method_name ... end` syntax but no method is being called in this file, so let's call a method:

   Add this at the end of file to call `start_password_input` method:

   ```ruby
   # calling the method
   start_password_input
   ```

1. Put a breakpoint on method call and press <kbd>F5</kbd> to start debugger, When you keep stepping into you will notice in the `Debug Console Output` the program will ask you for user input, but there's a problem you can't enter any input here.
1. If your program needs user input we have to use `Terminal` instead of `Debug Console Output` so we can enter input while debugging, for that we have to configure our debugger so open `launch.json` at `dummy_name/.vscode/launch.json` and add `"useTerminal": true` at end of config named `Debug current file with rdbg` like this:

   ```json
   {
     "type": "rdbg",
     "name": "Debug current file with rdbg",
     "request": "launch",
     "script": "${file}",
     "args": [],
     "askParameters": true,
     "useTerminal": true
   },
   ```

1. Open `main.rb` and put a breakpoint on method call (if there isn't already), press <kbd>F5</kbd> to start debugging.
1. Keep Stepping Into till you hit the user input line (`Step Into` one more time if you see still yellow background on the gets.chomp line), open `Terminal` (if it's not opened already) using <kbd>Ctrl</kbd> + <kbd>`</kbd> and enter any input inside the "Ruby Debug Terminal".
1. You can now debug while giving user input in between, keep stepping into till you reach the `if` condition, `Step Into` one time and notice the flow. It passed the condition and went inside if condition and in local variables we see that `input` variable got assigned the value of `password` variable, instead of comparing it with that value. Can you guess the fix? Drop your answer in [TOP Discord's #ruby-rails-general channel](https://discord.com/channels/505093832157691914/690591236922409012).

#### Step 7: Debug some more code

1. Open `main.rb` and comment out `start_password_input` method call and add `start_day_name_input` at end of file :

   ```ruby
   # start_password_input
   start_day_name_input
   ```

1. Run the debugger and on user input enter "7".
1. Notice the output is only "Days is" and no name after it.
1. Put a breakpoint on the method call if there isn't already, run the debugger and on user input enter "7" again.
1. Keep Stepping into till the `if` condition line and press `Step Into` one more time.
1. Notice how the condition passes meaning 7 is valid input, so problem is `days[num]`.
1. On `WATCH` window of `Run And Debug` inside vscode click add expression(the plus icon) and add  `days[num]`, and you will see the value returned by `days[num]` is nil. (use mouse to hover over `WATCH` to get "add expression" button)
1. Add `days` and `num` to `WATCH` too, click on `days` to expand it and notice the array index starts with 0 and ends at 6 and currently the `num` 7 is out of range.
1. The `WATCH` section can evaluate expressions and it's helpful when the local variable you want to check is deeply nested when checking inside local variable of `VARIABLES` window, let's try some expressions inside `WATCH` to figure out some working code for the `days[num]` bug. Add `days[num+1]` and `days[num-1]` to `WATCH` , local variables will show you just the current value of a variable and using `WATCH` expressions you can play with your variables and check the value of conditions like `num >= 1 && num <= 7`, add this condition to `WATCH` and it will show `true` if `num` is greater than 0 and smaller than 8 else false. Notice the fix for this bug is using `days[num-1]` since allowed inputs are  1-7 and array index are 0-6.

### How to start debugging

Programs generally go wrong due to two main reasons:

1. The program encounters an error and won't run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.

1. The program runs but does not work the way you expect. For example, you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

Obviously, if available, <span id='debugging-with-stack-trace'>the stack trace is the first place you should look when debugging.</span> <span id='debugging-without-stack-trace'>If there's no stack trace, then `puts` and Pry are the easiest and quickest tools you can use to get yourself back up and running.</span>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Go through the Ruby Guides [Ruby Debugging](https://www.rubyguides.com/2015/07/ruby-debugging/) tutorial, which covers the same topics we went over, but in more depth.
1. Read through the [Exceptions and Stack Traces](https://launchschool.com/books/ruby/read/more_stuff#readingstacktraces) section of Launch School's online book *Introduction to Programming with Ruby*.
1. Although VSCode's debugger is a helpful tool that can make debugging simpler, many companies won't be using it - and will want you to be familiar with debugging using the concepts this lesson focused on: the stack trace, `puts`,`debug`, `pry-byebug`. Let's practice them by completing the debugging exercises from the [ruby-exercises repo](https://github.com/TheOdinProject/ruby-exercises/tree/main/ruby_basics#readme) that you previously cloned.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is a stack trace?](#reading-the-stack-trace)
- [What is generally the most useful line in a stack trace?](#most-useful-stack-trace-line)
- [What are the two things you can learn from the first line of a stack trace?](#stack-trace-first-line-info)
- [How do `puts` and Pry help you in the debugging process?](#debugging-with-puts)
- [What should you use instead of `puts` for `nil` values?](#debugging-with-puts-and-nil)
- [Where should you start with debugging if you encounter a runtime error?](#debugging-with-stack-trace)
- [Where should you start with debugging if your program runs but does not work the way you expect?](#debugging-without-stack-trace)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- Read the article on [Debugging without doom and gloom](https://practicingruby.com/articles/debugging-without-doom-and-gloom) by Practicing Ruby.
- Poke around [Debug's repo and its README](https://github.com/ruby/debug) that will help you master this invaluable gem.
- Watch [debug.gem: Ruby's new debug functionality talk by Koichi Sasada](https://www.youtube.com/watch?v=XeWHrsp6nwo), one of debug's maintainers to learn about its history and functionality.
- Read this brilliant article about [reading Ruby error messages](https://medium.com/@roni.shabo/overcoming-ruby-error-messages-ebf53928b64e).
