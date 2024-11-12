### Introduction

This lesson will explain the importance of good commit messages, how to write them, when to commit, and why having a history of good commits is so important!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to write a meaningful commit message.
- Why meaningful commit messages are important.
- When to commit.

### Are commit messages so important they deserve their own lesson?

Yes! Let me give you a quick list of reasons why:

- When you are applying for jobs, employers will look through your projects on GitHub and they will look through your commit history. Having good commits as a novice developer will help you stand out.

- Having a good commit message history will allow you (or other developers working on your code) to quickly see what changes were made and why. This is useful if a bug is found in the code that needs to be fixed!

- Having a good commit message history will also be helpful if you come back to a project you were working on after stepping away from it for a while. You likely won't remember your thought process and changes made when initially writing out the code.

### Bad vs. good commits

When it comes to writing commits, it is crucial to know how to write them effectively. Here's an example of a bad commit message:

```text
fix a bug
```

Even though it describes what you did, the message is too vague, which leaves the other developers on your team confused. A good commit message will explain the **why** behind your changes. In other words, a commit message describes what problem your changes solve and how it solves them.

Effective commits consist of two separate parts: a subject, and a body:

#### Subject

A brief summary of the change you made to the project.

```text
This is the change I made to the codebase
```

<div class="lesson-note lesson-note--tip" markdown=1>

GitHub has a 72-character limit, so we recommend keeping your commits' subjects within this amount.

</div>

#### Body

A concise yet clear description of what you did.

```text
Describe the problem your commit solves and how.
```

Now that we learned the secret to creating a good commit message, let's try and fix the commit message from earlier:

```git
Add missing link and alt text to the company's logo

Screen readers won't read the images to users with disabilities without this information
```

Ahh, that's better! :) Now, developers can gain a better understanding of this commit message because it does the following:

- Provides a subject that specifies your code's action (e.g., "Add missing link and alt text to the company's logo").
- Contains a body that provides a concise yet clear description of why the commit needed to be made (e.g., "Screen readers won't read the images to users with disabilities without this information").
- Separates the subject from the body with a new/blank line. This is a best practice we highly recommend following. It makes commit messages easier for other developers to read.

### How to commit with a subject and body in the message

Up until now, you've been told to commit with `git commit -m <message>`. To make a commit with subject and body in message, the simplest way is to type `git commit` without the `-m` flag and message argument.

Doing so will open a new Visual Studio Code tab if you had [set Visual Studio Code as the Git editor](https://www.theodinproject.com/lessons/foundations-git-basics#changing-the-git-commit-message-editor). You can remove any comments and enter your multi-line messages. When you save and close the tab, your commit will be created.

### When to commit

A good way to view a commit is like a “snapshot” of your code at the moment that it was made. That version of your code up to that point will be saved for you to revert back to or look back at.

When writing code, it's considered best practice to commit every time you have a meaningful change in the code. This will create a timeline of your progress and show that your finished code didn't appear out of nowhere.

In other words, make a commit if you get a piece of code you are working on to function like you want it to, fix a typo, or fix a bug. As you gain experience, you will develop a better feel for what should be committed!

There will come a time when you are working on a project and you FINALLY get something just right (this would be a good time to commit), and then maybe 30 seconds to a few days later it breaks. You have no idea what you changed, everything *looks* to be the same and you don’t remember editing that line, but alas, it isn’t working how you want it anymore. You’d be able to go back through your commit history and either revert your code back to the last commit you made when you first got that part working or go back and see what your code looked like at that point in time.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. This article, [How to Write a Git Commit Message](https://cbea.ms/git-commit), covers all the main bases on how to write good commit messages. The whole article is great and informative but the meat of the article is “The seven rules of a great commit message.”

</div>

#### Tips and things to remember

- Using VSCode as your text editor (you should have set this up in the Git Basics section) will allow you to easily make multi-line commit messages, easily see the character length of each line, and will allow you to use [VSCode spell check extensions](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) to make sure your spelling is correct.
- Use an active voice: "Fix card generator".
- Avoid using vague commit messages such as "saved" or "updated".
- Commit early and often!

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are two benefits of having well-written commit messages and a good commit history?](https://cbea.ms/git-commit/#intro)
- [How many characters should the subject line of your commit message be?](https://cbea.ms/git-commit/#limit-50)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- One way to formulate high-information commit messages is to follow a template. [Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) is one of many commit message templates that you can explore.
- Explore this amazing tutorial video on Conventional Commits ➔ [Full Video Link](https://www.youtube.com/watch?v=OJqUWvmf4gg). The video showcases the Conventional Commits template from the resource above. It also mentions creating releases and shows using something called "Yarn". These two parts are out of scope for this part of the course, so don't worry about them and instead focus on the commit template.
