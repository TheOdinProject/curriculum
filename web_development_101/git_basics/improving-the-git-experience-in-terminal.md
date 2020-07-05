### Introduction

In this lesson, we would tweak our terminal to improve the git experience. This tweaks will not only make the terminal a little more visual attractive but also would save you some time by helping you skip some repetitive git commands(like git branch to check the current branch).


### Prerequisites

You require the following before starting this tutorial :
  * MacOS.
  * You need homebrew installed.
    * if you don't have it installed you can install it by typing in the terminal
      ```zsh 
      $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
      ```
    
### Instructions
  * (optional but recommended) installing iTerm2 (it is a third party replacement for the terminal in MacOS)
    * type in terminal
      ```zsh 
      $ brew cask install iTerm2
      ``` 
    * wait until the install to complete (output will be 🍺 iterm2 was successfully installed!)
    * press command + space on your keyboard to open spotlight
    * search iTerm and open the Application (you may get a warning press open, now you can close the terminal)
    
  * install zsh
    * type in iTerm or Terminal
      ```zsh 
      $ brew install zsh 
      ```
    * wait until the install to complete (output will be 
      Pouring zsh-5.8.catalina.bottle.tar.gz
      🍺  /usr/local/Cellar/zsh/5.8: 1,531 files, 13.7MB)
      
  * install Oh My Zsh
     * type in iTerm or Terminal
        ```zsh
        $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        ```
     * wait until the install to complete (output will be in big green letters oh my zsh is now installed!)
     * you will see that the $ and the text before it is replaced with -> ~ (here ~ represents Home Directory).
     
  * install a theme for oh my zsh 
    * you can choose any of the themes from https://github.com/ohmyzsh/ohmyzsh/wiki/themes.
    * we would use powerlevel10k for this tutorial
    * type in iTerm or Terminal
      ```zsh
        -> ~ git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
      ```
    * wait until the install to complete (output will be Resolving deltas: 100% (9108/9108), done.)
    * type in iTerm or Terminal
      ```zsh
        -> ~ open ~/.zshrc
      ```
    * look for `ZSH_THEME="robbyrussell"` in the text file which just opened and change it to `ZSH_THEME="powerlevel10k/powerlevel10k"` and save the file(command + s).
    * restart iTerm2/Terminal
    * go through the configuration process as per instruction given in iTerm2/Terminal.
    
### Conclusion 
Now you are ready for next lesson.
