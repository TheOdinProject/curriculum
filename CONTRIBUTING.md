# Contributing Guide

## How to Contribute
1. Find a [issue tagged with "help wanted"](https://github.com/TheOdinProject/theodinproject/labels/Help%20Wanted) to work on. Please comment on the issue to let others know you are working on it.

2. Fork this repo on your local machine.

	* Fork and clone the this to your local machine, use [this guide](https://help.github.com/articles/fork-a-repo/) if you don't know how to do that
	* Set the upstream remote so you can keep your copy of the app synced with the original. To do that go to your terminal and `cd` into your cloned curriculum directory. Then use one of the following commands:

	If you have ssh set up with Git
	```
	$ git remote add upstream git@github.com:TheOdinProject/curriculum.git
	```
	Otherwise
	```
	$ git remote add upstream https://github.com/TheOdinProject/curriculum.git
	```

3. Before you start working on your issue create a branch and name it like the following examples:

	If its a new feature
	```
	$ git checkout -b feature/feature-name`
	```
	If its a bug fix
	```
	$ git checkout -b fix/fixed-bug-name
	```

4. When you have finished and are ready to submit a Pull request:

**Before you submit your pull request ensure your markdown is correctly formated and rendering properly**

**Push your branch to your fork**
```
$ git push origin <your branch name here>
```
**Create a pull request**
* Go to your fork on Github after you have pushed up your branch. A new button should be visible near the top of the page. It will allow you to create a pull request to the original Odin Project Repo.

* Please Link to the issue your pull request resolves in the body of your pull request.

## Need Help with Anything Here?
Please let us know if you require any help doing any of the steps in this guide in our [Contributing room in Discord](https://discordapp.com/channels/505093832157691914/540903304046182425)
