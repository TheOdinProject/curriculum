# Getting Involved with The Odin Project

## Intro

It's awesome that you're interested in getting involved with the project! The project needs the help of contributors and it should be good experience for you to build software as part of a team.  In December 2013 we created the structure necessary to bring in collaborators who are new to both the project and perhaps software development in general.

This document is the official "on-boarding" for new contributors and it will lay our how we're managing the contributions going forward, the tools we're using, and how to get started.

## Our Approach

### Overview and Philosophy 

Just like the project itself is open source, we're keeping this process as open as possible to help manage a dispersed group of contributors and provide a set of learning tools for people who stumble upon this later.  That means our meetings will be held publically (via Google Hangouts On Air, available on YouTube), our project status will be tracked publically (via [our Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092)), and our self-organization will be managed publically (via [our Google Community](https://plus.google.com/u/0/communities/100013596437379837846)) as well.

Many of the contributors and participants are still early in their learning so we're working to build a collaborative process that encourages and enables newbies to observe until they're ready to help out.  It's definitely a learning process for everyone, so we'll probably be changing things in our workflow as necessary.

### Agile

To reflect some of the software development best practices from the industry today and provide the most flexible way to run the project, we'll be using a customized Agile workflow.

#### Learning About Agile

Before diving in, it's important to have an idea of what Agile is.  There are certainly better links out there, so please suggest them!

1. Watch this [video intro to SCRUM].  We won't be using all these practices in this exact same way, but it's a great intro.  We'll use Pivotal's "Points" system.
2. Read through this [explanation of SCRUM and XP](http://www.serena.com/docs/repository/solutions/intro-to-agile-devel.pdf).  Don't get too caught up in the flow charts and details, we'll be doing our own thing.

#### Our Version of Agile

We're challenged because the team isn't a 9-5 software development team with reliable workflows and productivity -- contributors are a distributed group of part-time warriors learning at the same time.  Instead of building a certain number of features-per-week, we're more likely to build at a rate of weeks-per-feature.

To account for this, we'll focus on a single feature / user story at a time until it's complete, and it will be handed off from one person/pair/group to the next depending on availability.  We'll use weekly SCRUM-style meetings and code reviews to manage workflow.

### Product Management

Erik will take care of managing and prioritizing the feature backlog.  If you've got user feedback or feature requests, [contact him directly](mailto:erik@theodinproject.com).  We'll likely bring more collaboration to the feature list as the team settles in a bit.

### Project Management (SCRUM Mastering)

To keep everyone moving in the same direction and working on the right stuff, the role normally filled by a SCRUM master or project manager will be done by Erik until someone else finds themselves as a natural fit for it.

### Developing Features (and Pairing!) with TDD

You'll be developing features!  We have a few important guidelines:

#### Test Driven Development (TDD)

For many of you, writing tests may be the biggest challenge off the bat.  For a project this big and distributed, it's absolutely essential that every new feature achieves as close to 100% test coverage as possible and the way to do that is with TDD.  You may remember the [Test First lessons](http://testfirst.org/learn_ruby) from back in [Web Development 101](http://www.theodinproject.com/courses/web-development-101/lessons).  The difference is that this time *you'll* be writing the tests.  

If you're not sure where to start, check out the [Lesson on RSpec](http://www.theodinproject.com/courses/ruby-programming/lessons/introduction-to-rspec) in the Ruby Course.  The basic principle is to start with a failing test, make it pass with the least code possible, then refactor as necessary and repeat the process until the feature is built.  Since you've only written the least amount of code necessary to make the tests pass, you should have full coverage.

#### Pairing / Group / Mob Programming

This is a learning experience for everyone and it's really important to work collaboratively.  Whether it's you working remotely with a single partner or mob programming with several, the goal is to do nothing alone.

#### Keep it Open

Record your pairing / coding sessions and all meetings (which is why Hangouts on Air is ideal, since it automatically generates and posts a YouTube video of the session).  Everyone's learning and we'll all be Googling for answers so don't feel self conscious about that.  Part of this is about showing new students how imperfect the real process is.

Post the videos of your sessions to the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).  We'll have to set up a coherant archiving system when there are too many of them.

## The Tools We're Using

### Project Management

We have a [Pivotal Tracker account](https://www.pivotaltracker.com/s/projects/979092) set up, which is publically available.  If you want to contribute, you'll need to ask to be added to the account (to be able to make changes) by visiting [the project overview page](https://www.pivotaltracker.com/projects/979092/overview) and clicking "Join This Project" under the "Actions" section.  Or you can email [contact@theodinproject.com](mailto:contact@theodinproject.com) to be added (use subject line "Please add me to the Pivotal Tracker").

To become familiar with the tracker, check out [their "Getting Started" page](https://www.pivotaltracker.com/help/gettingstarted).  

### Community

We want to keep the discussions lively and ongoing and easy to contribute to. We're still looking for the right blend of tools but we'll be basing everything around our [Google Plus Community](https://plus.google.com/u/0/communities/100013596437379837846) for now.  It lets people post and share what's relevant, which will include status updates and helpful links.

We may also be setting up an email list, though still trying to figure out how relevant or repetitive that would be in addition to the community.

### Pairing

We've experimented with several different pairing workflows and haven't settled on the definitive winner yet.  See ["How to Pair"](https://github.com/TheOdinProject/curriculum/blob/master/pairing/how_to_pair.md) for a more exhaustive description, but basically the idea is to switch off who is writing the code (the driver) and who is directing what to write (navigator) after a fixed amount of time (30 minutes) or a fixed set of tests.  You can also switch off every other test.

The main workflows we've tried are listed below.  The ideal workflow allows ulimited people to participate, easy switching between driver/navigator, and easy recording.  None have come out the clear winner, though the first is currently favored:

1. **[Google Hangouts on Air](https://plus.google.com/hangouts) + [Nitrous.io](http://nitrous.io)**:  Nitrous is a free cloud-hosted Rails development environment that lets you run your own terminal window, local filesystem etc... it's like tunneling into a new Macbook.  It also has collaboration features baked in, so multiple people can work on the same code base simultaneously.  The Hangout on Air is necessary to give the navigator(s) the opportunity to talk to the driver and so we can record the session easily.
    * **Pros:** Easy recording, unlimited watchers, easy driver switching (one code base used), standardizes environments for collaborators
    * **Cons:** Have to use an IDE (which no one is 100% familiar with), totally web-based, Google can be frustrating to figure out
2. **[Screenhero](http://screenhero.com/) + your text editor**:  This allows both people to control the action with their own mouse, so you can alternate who is coding and who is navigating.  Best if only 2 people are driving/navigating.
    * **Pros:** Intuitive, only need to use one person's code base.
    * **Cons:** Recording needs to be done with another program, only 2 people can participate (unless external screen sharing like a Hangout-On-Air is also used).
2. **[Google Hangouts on Air](https://plus.google.com/hangouts) + your text editor**:  In this flow, you would share your screen on the hangout while working in your own text editor.  When it's time for someone else to start coding, you'd need to use Git to give that person the latest copy of the files.
    * **Pros:** Easy recording, unlimited watchers,
    * **Cons:** Switching between drivers is a pain, Google can be frustrating to figure out

We will update this page as a clear winner emerges.  For now, it appears to be Nitrous and Google HoA.

### Recording

Google Hangouts on Air take care of the recording, and if they're run via the community we've set up then it should be easy to locate the recordings.  I'm not too familiar with where the videos get posted and how to link to them all, so we'll have to treat that as a work in progress.  Ideally, whenever a new pairing session recording is completed, you will post its link to the community.  We will need to come up with a place to put them all when we get enough.  Google Pages maybe?

As for individual recordings (e.g. of sessions recorded on your own computer), still working on that too.  The ideal program will record your screen as well as the computer's audio (so including anything coming from your partner(s) on the other end of a voice call).  Hangouts on Air is still the gold standard since it seamlessly uploads it all to YouTube for you.

#### The Good List

We're still looking for the best program to record 

* Google Hangouts on Air is still the easiest... Maybe you can host a hangout even if no one is watching?
* ???

#### The Bad List

We've had some bad experiences... It doesn't mean bad tools, but once bitten twice shy:

* Quicktime Player -- no sound?? Huge files (>5gb/hour).

## Schedule Going Forward

We'll manage the project in 1-week increments.  That means we'll have weekly check-in meetings to see how it's gone for everyone and what's on the agenda for the next week.  It will be a chance to ask group questions about features or code, find partners, and schedule the coming week's pairing sessions.  We may also make code review a part of this meeting as well.  Think of this as sort of like a daily SCRUM meeting might normally be but with a bit more meat.

The weekly meetings will be posted to the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846) and the [Meetup Group](http://www.meetup.com/Learn-Web-Development-Paired-Programming-in-SF/).

Otherwise, post a new Event (as a Hangout on Air) when you'd like to pair on the Community.

## How to Get Started

Ready to get invovled?  Here's how.

### As an Observer

You're welcome to observe for as long as you'd like.  That's part of why everything we do is public / recorded.

1. Join the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).
2. Check out the [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092)
3. Say hi! You can do that at the weekly meeting and/or on the google group.  We'd love to hear 30 seconds about what brought you here and where you'd like to go.
4.  Feel free to observe any of the published pairing sessions or weekly meetings via the community events or check out the historical ones we post on YouTube (still trying to figure out exactly how that will work, stay tuned).
5. Start collaborating!  You're ready...

### As a Collaborator

Ready to start collaborating or at least taking the next step? 

1. Join the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).
2. Sign up for the [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092).  It'll say "60 day free trial" but don't worry, you won't have to pay.  It's like Github... as long as you're working on open-source stuff and not private repos, it's free.
3. Say hi at the weekly meeting and on the Community page.  You'll want to familiarize yourself with what feature(s) we're working on and how the development backlog looks.
4. Fork the [Odin Project repository](https://github.com/TheOdinProject/theodinproject) and get it working on your local machine.  We've got evolving instructions for how to do that on the [README page](https://github.com/TheOdinProject/theodinproject/blob/master/README.md).  It can take a few tries.
5. Set up or join a pairing session via the Community.
6. Have fun! Code! 

### Working on a Feature / User Story

#### This section is under development as we figure out the best workflow

We'll flesh this section out as we get a bit more experience working on features, but basically we'll all be sharing feature development until the feature is complete.  This *should* work because we'll be doing TDD.  If it doesn't, we'll adapt.

1. Post or join a new pairing session via the Community.  If possible, also include the feature or part of the feature you'll be working on.
1. Consult the [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092) for the current feature and take a look at which step(s) have been completed already.  Familiarize yourself with the work that was most recently completed by the last pairing session (which should be available in their video / event).
3. Don't forget to start recording if you're not using a Hangout on Air.
4. Get the most recent copy of the repository and start building TDD-style.  See below for Git workflow notes.
3. When you're done with the session (which should be after making your last test pass... don't leave failing tests), make sure all tests still pass and then push to Github.
4. When a feature is completed (and fully tested), merge with the (latest) master branch then submit a pull request to the main Odin repo.

#### Git Workflow Notes

We're still trying to figure out the best workflow to use.  It doesn't make sense (and can be dangerous) to give everyone push access to the main repo so we'll have to use a workflow where everyone forks.  The downside of that is that if people are sharing development of a single feature, there's no centralized place to always get the "latest" version of the repo and you'll have to get it from the last person who worked on it (by grabbing it from their fork).  That's not very straightforward so there's got to be a better way.

* Use merges (`$ git merge origin/my_feature_branch`) instead of rebases (`$ git rebase my_feature_branch`).  If you don't know what a rebase is, don't worry about it.  When a rebase goes wrong, you can get yourself in all kinds of strange places.
*  Make sure you're working on a [feature branch](http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging) (see the [article on a feature-branch workflow](https://www.atlassian.com/git/workflows#!workflow-feature-branch) from Atlassian as well).
* 

## Additional Resources

* [Extreme Programming Rules](http://www.extremeprogramming.org/rules.html)