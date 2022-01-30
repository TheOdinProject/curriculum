### Introduction

This lesson will explain the importance of good commit messages, how to write them, when to commit and why having a history of good commits is so important!

### Learning Outcomes

By the end of this lesson, you should be able to:

- Write a meaningful commit message
- Understand why meaningful commit messages are important
- Have a good understanding of when to commit


### Are commit messages so important they deserve their own lesson?

Yes! Let me give you a quick list of reasons why:

- When you are applying for jobs, employers will look through your projects on GitHub and they will look through your commit history. Having good commits as a novice developer will make you stand apart. 
- Having a good commit message history will allow you (or other developers working on your code) to quickly see what changes were made and why. This is useful if a bug is found in the code that needs to be fixed!
- Having a good commit message history will also be helpful if you come back to a project you were working on after stepping away from it for a while. You likely won't remember your thought process and changes made when initially writing out the code. 

### How to Write a Good Commit Message

This article, [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/),  covers all the main bases on how to write good commit messages. The whole article is great and informative but the meat of the article is “The seven rules of a great commit message.”

### When to Commit

A good way to view a commit is like a “snapshot” of your code at the moment that commit was made. That version of your code up to that point will be saved for you to revert back to or look back at. 

When writing code, it's considered best practice to commit early and often. Commit every time you have a meaningful change in the code. This will create a timeline of your progress and show that your finished code didn't appear out of nowhere.
This means, make a commit if you get a line of code you are working on to function like you want it to, fix a typo, fix a bug, or when you are done for the day. 

There will come a time when you are working on a project and you FINALLY get something just right (this would be a good time to commit), and then maybe 30 seconds to a few days later it breaks. You have no idea what you changed, everything *looks* to be the same and you don’t remember editing that line, but alas, it isn’t working how you want it anymore. You’d be able to go back through your commit history and either revert your code back to the last commit you made when you first got that part working or go back and see what your code looked like at that point in time.

### Tips and Things to Remember:

- Using VSCode as your text editor (you should have set this up in the Git Basics section) will allow you to easily make multi-line commit messages, easily see the character length of each line, and will allow you to use [VSCode spell check extensions](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) to make sure your spelling is correct
- Use an active voice: "Fix card generator"
- Avoid using vague commit messages such as "saved" or "updated"
- Commit early and often!

### Knowledge Check
- What are two benefits of having well-written commit messages and a good commit history?
- How many characters should the subject line of your commit message be?