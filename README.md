# The Odin Project 
v0.0.6 http://www.theodinproject.com/scheduler

## Empowering Aspiring Developers to Learn Together


This site provides the main user experience for The Odin Project, including the home page and all user functions.  It is meant to be a shell around [The Odin Project Curriculum](https://github.com/theodinproject/curriculum) and to include the tools that help students to pair together and get to know others who are working on the curriculum.  

It has been open-sourced to provide both a learning resource for students who want to see how the tools they're using are built and to give students the opportunity to stretch their wings and contribute to a real open-sourced project... while building the tools they themselves will be using.

Thus far, the code has been more or less hacked together so don't use it as a star example of how things should be done!  We'll be rolling out some better documentation and contribution instructions as this develops a little further.

For minor fixes, either submit a github issue or a pull request.  Please coordinate with the project maintainers if you're interested in working on some of the larger features in order to avoid traffic jams.

Contact us directly at [project@theodinproject.com](mailto:project@theodinproject.com)

## Features

Much of the good stuff is yet to come, but the major accomplishment so far has been the scheduling tool, which allows users to sign up and show when they're available to pair up on projects.  

### Referral Link
You can set up a referral link so that someone can click on it and get taken directly to the scheduler with that project already added to their list.  To do so, just use the format:

`http://www.theodinproject.com/?cb=[id of project]`

...where `[id of project]` should be the ID of the project (called a "content_bucket" in the schema) you'd like them to work on directly.  If I wanted to have someone work with me on the edX SAAS homework assignment #4, I would use the link:

`http://www.theodinproject.com/?cb=6`

Using IDs is obviously not ideal but it's the best we've got right now.  If you're wondering which project goes with which ID, your best bet right now is to guess-and-check by following those links... there aren't too many projects so it shouldn't be too tough.

## Future Development

The file [dev_roadmap.md](dev_roadmap.md) will be more specific but there are some overall goals for the short term development of this project:
* Create a real home page... right now it's just a splash page to collect email addresses and, now that this whole thing is open and rearing to go, we need a nice welcoming home page that links out to everything nicely.  That's the first goal.
* Improve the documentation of the existing code base so people can more easily navigate through it.  This means in-line commenting and also creating a higher level github wiki page that explains how the project works and the best ways to navigate it.
* Improve user privacy... right now user emails are visible so students can reach out to each other directly.  Ideally, we'd be able to mask the emails so users can protect their privacy until they'd like to reveal themselves to each other.

<hr>
Created by [Erik Trautman](http://www.github.com/eriktrautman)