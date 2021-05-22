# Contributing Guide

Thank you for expressing interest in contributing to our curriculum!

If you would like to contribute, but are not sure how, find an [issue tagged with "help wanted"](https://github.com/TheOdinProject/theodinproject/labels/Help%20Wanted) to work on.
* Please comment on the issue stating what you'd like to work on and wait to be assigned before working on it. 
* After being assigned, address each item listed in the acceptance criteria. 

If you would like to propose a small change (fixing a typo, updating a link, etc.) that is not part of an existing issue, you are welcome to make the change and submit a PR.

If you would like to propose a change that is not covered in an open issue, please start by creating a new issue or discussing this in our [Discord's contribution-suggestions channel](https://discordapp.com/channels/505093832157691914/540903304046182425)

## How to Contribute

1. Fork this repo on your local machine.

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

2. Before you start working on your issue create a branch and name it like the following examples:

	If its a new feature
	```
	$ git checkout -b feature/feature-name`
	```
	If its a bug fix
	```
	$ git checkout -b fix/fixed-bug-name
	```

3. When you have finished, ensure your markdown is correctly formatted and rendering properly using our [markdown preview](https://www.theodinproject.com/lessons/preview) tool.

4. If the markdown if correctly formatted, you are ready to submit a pull request:
**Push your branch to your fork**
```
$ git push origin <your branch name here>
```
**Create a pull request**
* Go to your fork on Github after you have pushed up your branch. A new button should be visible near the top of the page. It will allow you to create a pull request to the original Odin Project Repo.

* If the PR is related to an existing issue, link it in the body of your pull request, such as "resolves #1234".

## Need Help with Anything Here?
Please let us know if you require any help doing any of the steps in this guide in our [Discord's contribution-suggestions channel](https://discordapp.com/channels/505093832157691914/540903304046182425)
