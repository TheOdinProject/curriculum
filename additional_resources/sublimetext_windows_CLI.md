#WORK IN PROGRESS

#How to open Sublime Text via command line

This guide assumes you are using **Windows** and the command prompt shortcut provided by the Railsbridge installfest. The shortcut should have a target of "C:\Windows\System32\cmd.exe /E:ON /K C:\RailsInstaller\Ruby1.9.3\setup_environment.bat C:\RailsInstaller" (or something similar...depending on your installation directory). Because we are using this special command prompt shortcut, other solutions you might find online for how to open Sublime Text via command line might not work. Those solutions don't account for our shortcut's special target. We're special -just as our mother's foretold.

Steps:
[linked list of steps here]

## Step 0 - Complete Railsbridge installfest
[blah blah blah]

## Step 1 - Edit setup_environment.bat
Open the setup_environment.bat file in Sublime Text. You should be able to find the .bat file in your RailsInstaller directory. The target of your Ruby on Rails command prompt shortcut reveals the location of the .bat file. For me, the file path is:
>C:\RailsInstaller\Ruby1.9.3\setup_environment.bat

On line 26, you should see some code that looks like:
>IF EXIST %ROOT_DIR%\Git\cmd SET PATH=%ROOT_DIR%\Git\cmd;%PATH%

Right below that line, you need to insert some code that discloses the location of sublime_text.exe on your computer. For me, I used the following code:
>**SET PATH=C:\Program Files\Sublime Text 2;%PATH%**

I honestly don't know exactly what is going on here. I just Google'd around and read about some variable called "PATH" that must be modified. This code adds the Sublime Text directory to the list of directories already stored in PATH. The key is that all this is happening in setup_environment.bat (so instructions on modifying the PATH variable weren't working for me because those instructions did not account for this .bat file).

## Step 2 - Create symbolic link (optional)
[instructions regarding Run As Admin cmd "mklink subl.exe sublime_text.exe"]

## Step 3 - Edit Sublime Text 2 settings
[instructions for preventing Sublime Text from annoyingly opening a new window every time a file is opened via cmd line]
