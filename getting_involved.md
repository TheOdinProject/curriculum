# Getting Involved with The Odin Project

1. Intro
2. Our Approach
3. The Tools We're Using
4. Schedule Going Forward
5. How to Get Started
6. Workflows for Features and Stories
7. Git Workflow Notes
6. Additional Resources

## Intro

It's awesome that you're interested in getting involved with the project! The project needs the help of contributors and it should be good experience for you to build software as part of a team.  In December 2013 we created the structure necessary to bring in collaborators who are new to both the project and perhaps software development in general.

This document is the official "on-boarding" for new contributors and it will lay our how we're managing the contributions going forward, the tools we're using, and how to get started.

### Prerequisites

You're more than welcome to observe at any level and contribute if/when you feel ready.  Actually, contribute just before you feel ready... you'll never feel ready.  But you probably should have completed the [Rails course](http://www.theodinproject.com/courses/ruby-on-rails/lessons) or, at the very least, the [Ruby on Rails Tutorial](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book) by Michael Hartl.

## Our Approach

### Overview and Philosophy 

Just like the project itself is open source, we're keeping this process as open as possible to help manage a dispersed group of contributors and provide a set of learning tools for people who stumble upon this later.  That means our meetings will be held publicly (via Google Hangouts On Air, available on YouTube), our project status will be tracked publicly (via [our Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092)), and our self-organization will be managed publicly (via [our Google Community](https://plus.google.com/u/0/communities/100013596437379837846)) as well.

Many of the contributors and participants are still early in their learning so we're working to build a collaborative process that encourages and enables newbies to observe until they're ready to help out.  It's definitely a learning process for everyone, so we'll probably be changing things in our workflow as necessary.

### Agile

To reflect some of the software development best practices from the industry today and provide the most flexible way to run the project, we'll be using a customized Agile workflow.

#### Learning About Agile

Before diving in, it's important to have an idea of what Agile is.  There are certainly better links out there, so please suggest them!

1. Watch this [video on Engineering Software as a Service](http://youtu.be/d0uKY2kLKmk?t=6m8s) from Armando Fox and David Patterson of Berkeley.  It covers the whole process of building SAAS from beginning to end.
1. Watch this [video intro to SCRUM].  We won't be using all these practices in this exact same way, but it's a great intro.  We'll use Pivotal's "Points" system.
2. Read through this [explanation of SCRUM and XP](http://www.serena.com/docs/repository/solutions/intro-to-agile-devel.pdf).  Don't get too caught up in the flow charts and details, we'll be doing our own thing.

#### Our Version of Agile

We're challenged because the team isn't a 9-5 software development team with reliable workflows and productivity -- contributors are a distributed group of part-time warriors learning at the same time.  Instead of building a certain number of stories-per-week, we're more likely to build at a rate of weeks-per-story.

To account for this, we'll focus on a single feature / user story at a time until it's complete, and it will be handed off from one person/pair/group to the next depending on availability.  We'll use weekly SCRUM-style meetings and code reviews to manage workflow.  These meetings are managed through our [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).

### Product Management

Erik will take care of managing and prioritizing the feature/story backlog.  If you've got user feedback or feature requests, [contact him directly](mailto:erik@theodinproject.com).  We'll likely bring more collaboration to the feature list as the team settles in a bit.  Erik will write the stories, mockups and feature specifications for the team to work off of.  The team will be invaluable for providing feedback on all these items.

#### Specs and Mockups

Each feature (and possibly each individual story) will have a corresponding set of mockups (whether low fidelity [Balsamiq mockups](http://balsamiq.com) or higher fidelity images).  These will be attached to the user story, so you can click into them and check them out directly from the Tracker.

We'll also start building more formal user specs using [Google Docs](https://drive.google.com/), which allow everyone to view the file and also contribute.  This specification document will also be linked to from the story in the Pivotal Tracker.  We've found that just working off of the Pivotal user stories and their component tasks isn't quite enough, so each story will get its own specification document that contains detailed instructions about the deliverables, mockups, and interactions.

The important part of the spec is that the development team will be able to make notes of what they find along the way, their pseudocode and development strategy, and any bugs or status updates they need to make note of.  Thus the Google doc spec represents the ongoing timeline and log of the story's development.

### Project Management (SCRUM Mastering)

To keep everyone moving in the same direction and working on the right stuff, the role normally filled by a SCRUM master or project manager will be done by Erik until someone else finds themselves as a natural fit for it.

### Developing Stories (and Pairing!) with TDD

You'll be developing features by working on their component stories!  We have a few important guidelines:

#### Test Driven Development (TDD)

For many of you, writing tests may be the biggest challenge off the bat.  For a project this big and distributed, it's absolutely essential that every new feature achieves as close to 100% test coverage as possible and the way to do that is with TDD.  You may remember the [Test First lessons](http://testfirst.org/learn_ruby) from back in [Web Development 101](http://www.theodinproject.com/courses/web-development-101/lessons).  The difference is that this time *you'll* be writing the tests.  

If you're not sure where to start, check out the [Lesson on RSpec](http://www.theodinproject.com/courses/ruby-programming/lessons/introduction-to-rspec) in the Ruby Course.  The basic principle is to start with a failing test, make it pass with the least code possible, then refactor as necessary and repeat the process until the story is finished.  Since you've only written the least amount of code necessary to make the tests pass, you should have full coverage.

Once you've finished that, we're putting together a more Rails-focused testing document at [https://github.com/TheOdinProject/curriculum/blob/master/rails/testing.md](https://github.com/TheOdinProject/curriculum/blob/master/rails/testing.md) which should help you take the next step.

#### Pairing / Group / Mob Programming

This is a learning experience for everyone and it's really important to work collaboratively.  Whether it's you working remotely with a single partner or mob programming with several, the goal is to do nothing alone.

#### Keep it Open

Record your pairing / coding sessions and all meetings (which is why Hangouts on Air is ideal, since it automatically generates and posts a YouTube video of the session).  Everyone's learning and we'll all be Googling for answers so don't feel self conscious about that.  Part of this is about showing new students how imperfect the real process is.

Post the videos of your sessions to the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).  We'll have to set up a coherant archiving system when there are too many of them.

#### Blog

In the spirit of openness for those who follow, we'll try to write about the development of each story or feature after it's completed.  All the information necessary to create a rich and helpful blog post on the [Odin Blog (called 1000 Hours)](http://1000hours.io) will be contained in the Google Doc Spec for the story, so the team member who writes about the story will have plenty of material to work from.

Potential things to write about for a given story completion:

1. Briefly describe the overall context of the feature the story is helping to create (or the feature itself if the post is about a whole feature)
2. Describe the story itself
3. Show a screenshot of the feature in production (if possible) and any corresponding mockups used for development
4. Describe briefly the development process
5. Describe the challenges it presented
6. Describe the major lessons learned
7. Link to the final commit so they can view the code base at the right moment in time if desired.

Try to make it helpful for a student months from now who is curious about how something was built.

## The Tools We're Using

### Project Management

We have a [Pivotal Tracker account](https://www.pivotaltracker.com/s/projects/979092) set up, which is publicly available.  If you want to contribute, you'll need to ask to be added to the account (to be able to make changes) by visiting [the project overview page](https://www.pivotaltracker.com/projects/979092/overview) and clicking "Join This Project" under the "Actions" section.  Or you can email [contact@theodinproject.com](mailto:contact@theodinproject.com) to be added (use subject line "Please add me to the Pivotal Tracker").

To become familiar with the tracker, check out [their "Getting Started" page](https://www.pivotaltracker.com/help/gettingstarted).  The two videos on that page are particularly helpful.

You can see the story (or stories) we're currently working on in the "CURRENT" section.  In each story there will be a simple description followed by a series of checkboxes representing the steps the story needs to fulfill to be accepted.  

Specifications for each story will be created in Google Docs and attached in the Tracker.  As stated above, mockups will be created using either [Balsamiq](http://balsamiq.com) and/or a more high-fidelity tool like Keynote or Photoshop.

### Community

We want to keep the discussions lively and ongoing and easy to contribute to. We're still looking for the right blend of tools but we'll be basing everything around our [Google Plus Community](https://plus.google.com/u/0/communities/100013596437379837846) for now.  It lets people post and share what's relevant, which will include status updates and helpful links.

We may also be setting up an email list, though still trying to figure out how relevant or repetitive that would be in addition to the community.

### Pairing

We've experimented with several different pairing workflows and haven't settled on the definitive winner yet.  See ["How to Pair"](https://github.com/TheOdinProject/curriculum/blob/master/extra_stuff/pairing/how_to_pair.md) for a more exhaustive description, but basically the idea is to switch off who is writing the code (the driver) and who is directing what to write (navigator) after a fixed amount of time (30 minutes) or a fixed set of tests.  You can also switch off every other test.

The main workflows we've tried are listed below.  The ideal workflow allows ulimited people to participate, easy switching between driver/navigator, and easy recording.  None have come out the clear winner, though the first is currently favored:

1. **[Google Hangouts on Air](https://plus.google.com/hangouts) + [Nitrous.io](https://www.nitrous.io/join/GRrt3VYaHE8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral)**:  Nitrous is a free cloud-hosted Rails development environment that lets you run your own terminal window, local filesystem etc... it's like tunneling into a new Macbook.  It also has collaboration features baked in, so multiple people can work on the same code base simultaneously.  The Hangout on Air is necessary to give the navigator(s) the opportunity to talk to the driver and so we can record the session easily.
    * **Pros:** Easy recording, unlimited watchers, easy driver switching (one code base used), standardizes environments for collaborators
    * **Cons:** Have to use an IDE (which no one is 100% familiar with), totally web-based, Google can be frustrating to figure out
    * To set up a Hangout on Air, you actually need to schedule the HoA *in advance*, which will automatically create a Google Event which links to the HoA.  The other way to do it is to schedule the Google Event and then, just ahead of time, create a HoA and link it to the Google Event by digging in to the Event's options and looking for the "YouTube Link" field. See [this post](https://plus.google.com/+NatalieVillalobos/posts/a1sgtv91skA) for details of that method.
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

* Google Hangouts on Air is still the easiest
* ???

#### The Bad List

We've had some bad experiences... It doesn't mean bad tools, but once bitten twice shy:

* Quicktime Player -- no sound?? Huge files (>5gb/hour).

## Schedule Going Forward

We manage the project in 1-week increments, typically holding weekly check-in "SCRUM" meetings on *Wednesdays from 6:00-7:30pm PST* to see how it's gone for everyone and what's on the agenda for the next week.  It will be a chance to ask group questions about stories or code, find partners, and schedule the coming week's pairing sessions.  We may also make code review a part of this meeting as well.  Think of this as sort of like a daily SCRUM meeting might normally be at an agile shop but with a bit more meat.

The weekly meetings will be posted to the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846) and the [Meetup Group](http://www.meetup.com/Learn-Web-Development-Paired-Programming-in-SF/).

## How to Get Started

Ready to get involved?  Here's how.

If you'll be participating, you can set up the project by following the setup instructions [in the README of the main repository](https://github.com/TheOdinProject/theodinproject).

### As an Observer

You're welcome to observe for as long as you'd like.  That's part of why everything we do is public / recorded.

1. Join the [Google Community](https://plus.google.com/u/0/communities/100013596437379837846).
2. Check out the [Pivotal Tracker](https://www.pivotaltracker.com/s/projects/979092)
3. Say hi! You can do that at the weekly meeting and/or on the google group.  We'd love to hear 30 seconds about what brought you here and where you'd like to go.
4.  Feel free to observe any of the published pairing sessions or weekly meetings via the community events or check out [the historical ones we post on YouTube](http://www.youtube.com/channel/UCk0b0VTnJxXbxupXJ4D2yjQ).
5. Start collaborating!  You're ready...

### As a Collaborator

Ready to start collaborating or at least taking the next step? 

1. [Join the Google Community](https://plus.google.com/u/0/communities/100013596437379837846).
2. [Sign up for the Pivotal Tracker](https://www.pivotaltracker.com/projects/979092/memberships).  It'll say "60 day free trial" but don't worry, you won't have to pay.  It's like Github... as long as you're working on open-source stuff and not private repos, it's free.
3. Say hi at the weekly SCRUM meeting and on the Community page.  You'll want to familiarize yourself with what story(s) we're working on and how the development backlog looks.  If any of the stories that we're working on in the Tracker interest you, click the link in that story to "Follow this Story" to receive updates when new specs or comments are posted.
5. Set up or join a pairing session via the Community.  To start your own, ["Schedule a Hangout on Air"](https://plus.google.com/hangouts) and invite our Team Odin community to it.  That creates a new Event on our Community page so people can join you.  You'll need to post the link to the actual hangout window in the comments for the Event (otherwise people can only observe).
4. If you're hosting a pairing session, make sure you have the [Odin Project repository](https://github.com/TheOdinProject/theodinproject) set up on your computer (or Nitrous box if that's the workflow you're using).  We've got evolving instructions for how to do that on the [README page](https://github.com/TheOdinProject/theodinproject/blob/master/README.md).  It can take a few tries to get the server running and the lessons populated properly so bear with it!
5. Follow the Git workflow listed below but, basically, get the latest copy of the feature branch you're working on, write some sweet tests and code, and then have the story owner push it back up (you'll need to be in touch with a story owner who has push access).
6. Have fun! Tell your friends how much of an open source badass you now are.  In a humble brag sort of way.

## Workflows for Features and Stories

There are two main types of stories listed on our tracker -- one-offs (like bug reports, chores, and simple-to-implement features) and stories that are part of a larger feature and linked together using an "Epic".  All stories use tags to categorize them (e.g. "admin-tools" and "progress-tracking").  Tags in green are just used for categorization.  Tags in purple are linked to epics (click to see).  

### For One-Off Stories

*Note: If you want to "cowboy" a story on your own, make sure it's in the current sprint or backlog (NOT the icebox), it's got 1 or 0 points (save the bigger ones for everyone to work on), and you let us know you'll be working on it (to avoid conflicts) via the Community.*

If you'd like to tackle a story on your own, feel free to dive on any of the one-off "cowboy" stories that aren't linked to an epic.  Please set yourself as the owner (by clicking "Start") so no one else conflicts with you on it.  Make a note to the group on the Community or check in at the weekly SCRUM to see if anyone wants to help.  

Each story in the Tracker will be made up of Tasks, which are its Acceptance Criteria.  You'll know you're finished if you can check off all the tasks and the story looks like it does in the mockup (if there is one).  Many stories have no mockups because they are self-explanatory or non-visual.

Your workflow will look like the following:

1. [Tracker] Identify a story not attached to an epic
2. [Tracker] Click "Start" to take ownership of it
3. [Tracker / Google Docs] Create a Google Doc and share it.  Add a link to it in the comments at the bottom of the story. Use this document to track your approach, to-do's, and log progress from one session to the next, especially if you're working with others.
3. [Github] [Grab the latest version of the repository from Github.](https://github.com/TheOdinProject/theodinproject) Follow the instructions in the README.
4. [Github] Make a feature branch with a title similar to the story you are working on (e.g. "close-admin-flash")
5. [Community] Post hangouts for when you're working on it to get help.  If you end up working with others, they should work out of the story owner's code base (e.g. using Nitrous).  *You own the story, you own the code.*
6. [Code] Write tests first, then make them pass with code.  Stories without tests will not be accepted.
7. [Git] Commit frequently and with descriptive commit messages!  Don't commit unnecessary files or make changes to files you aren't using, that just clutters the commits.
8. [Git / Google Doc] When you stop for the day, be sure to commit your changes.  Record in the Google Doc where you are in your workflow so everyone who does the story the following day (especially if you can't make it) has a clear plan of action.
8. [Git] When you're done and all specs pass, pull down the latest version of the main repo, since it's probably changed since you started.
9. [Git] Merge your feature branch into your local version of the `master` branch.  You may need to resolve some merge conflicts due to changes in the main repo since you started.
10. [Tracker] Mark the story "Finished".
9. [Git] Submit a pull request for your work.  Someone will do a code review for you, possibly at the weekly SCRUM meeting.  You'll receive comments on your work in the pull request (and probably will need to fix or clean up stuff)
11. [Tracker] When the story has passed code review, it will be marked "Delivered".
12. [SCRUM] Definitely make the next SCRUM meeting, where the story will be covered and marked "Accepted" in the Tracker (unless there are last minute issues) and the Pull request will be merged. You're officially contributing.
13. [Blog -- Encouraged but Optional] Write a brief blog post summarizing what you did and what you've learned.  We'll post it on [1000hours.io](http://1000hours.io).
12. [Beer] Have a beer.
13. [Beer] Have another beer, you've worked hard.


### For Stories As Part of Epics

Stories that are part of epics are subject to a modified workflow because they have to fit in with other stories in the epic.  The tracker has another column called "Epics" where you can see the major Epics.  The comments section of the epic will contain links to the large-scale feature spec (which covers the whole epic, not just one story) and any mockups that are associated with it. 

Because they are larger scale, stories that are part of epics need to be coordinated with the group.  We'll do that at our weekly SCRUM meeting

#### Before You Even Start

Before you start coding, a few things have to happen:

1. The Product Manager creates the Epic and attaches the specification and mockups to it.
2. Everyone attends a special "Inception" meeting where we strategize how to tackle the epic on a high level and in what order the stories need to be done.  We'll try to find any snags we can at this point in the process, before anyone has started coding.
3. The Epic Owner (probably the Product Manager) will create a new feature branch in the main repository for everyone to work off of for this epic.
3. We'll divvy up the stories and get cracking!

#### Working on an Individual Story in an Epic

Just like in the One-off story workflow, the story owner is also the owner of the code for that story.  Everyone else will work off that person's code base (probably on Nitrous).

Specifications and mockups are stored attached to the Epic, though each individual story might have clarifying comments.

Each story in the Tracker will be made up of Tasks, which are its Acceptance Criteria.  You'll know you're finished if you can check off all the tasks and the story looks like the relevant mockup in the Epic.

2. [Tracker] Click "Start" to take ownership of your story.
3. [Tracker / Google Docs] Create a Google Doc and share it.  Add a link to it in the comments at the bottom of the story. Use this document to track your approach, to-do's, and log progress from one session to the next.  When you get started on the story, the first coding session is usually a mini-"Inception" meeting where you determine your strategy.
1. [Git] Start by loading the latest copy of the main repo.  Switch to the epic's feature branch.
2. [Git] Make another feature branch (off of the epic's feature branch) for this individual story, with a title similar to the story you are working on (e.g. "close-admin-flash").

The following steps are almost identical to the One-off story workflow:

5. [Community] Post hangouts for when you're working on your story to get help.  If you end up working with others, they should work out of the story owner's code base (e.g. using Nitrous).  *You own the story, you own the code.*
6. [Code] Write tests first, then make them pass with code.  Stories without tests will not be accepted.
7. [Git] Commit frequently and with descriptive commit messages!  Don't commit unnecessary files or make changes to files you aren't using, that just clutters the commits.
8. [Git / Google Doc] When you stop for the day, be sure to commit your changes.  Record in the Google Doc where you are in your workflow so everyone who does the story the following day (especially if you can't make it) has a clear plan of action.
8. [Git] When you're done and all specs pass, pull down the latest version of the main repo, since it's probably changed since you started.
9. [Git] Merge your feature branch into your local version **of the main epic branch** (e.g. NOT master).  You may need to resolve some merge conflicts due to changes from people working on other stories in the epic since you started.
10. [Tracker] Mark the story "Finished".
9. [Git] Submit a pull request for your work.  Someone will do a code review for you, possibly at the weekly SCRUM meeting.  You'll receive comments on your work in the pull request (and probably will need to fix or clean up stuff)
11. [Tracker] When the story has passed code review, it will be marked "Delivered".
12. [SCRUM] Definitely make the next SCRUM meeting, where the story will be covered and marked "Accepted" in the Tracker (unless there are last minute issues) and the Pull request will be merged. You're officially contributing.
12. [Beer] Have a beer.
13. [Beer] Have another beer, you've worked hard.

Story owners should be present at the SCRUM meetings to talk about their progress and ask questions.

Once the full epic is completed, we will do a full debriefing at the next SCRUM meeting.  We'll also have someone (or a couple people) write a blog post about it, which will utilize the existing specs and mockups, covering what was done and what was learned.

13. [Blog] Write a brief blog post summarizing what you did to complete the epic and what you've learned.  We'll post it on [1000hours.io](http://1000hours.io).


## Git Workflow Notes

* Everyone will be working in feature branches.  **No one touches `master`**, and any changes to be included in `master` will be made via pull request.
* Epics will have their own feature branches.  Stories within epics will be done on feature branches off of the main epic branch.
* **The story owner is the code owner.**  That person's Nitrous box will contain the latest version of the code (so they will need to fire it up themselves whenever someone is working on it).  If you want to hand off code between boxes, you'll need to do so with a separate Git flow.
* Use merges (`$ git merge origin/my_feature_branch`) instead of rebases (`$ git rebase my_feature_branch`).  If you don't know what a rebase is, don't worry about it.  When a rebase goes wrong, you can get yourself in all kinds of strange places.
*  Again, **make sure you're working on a [feature branch]**(http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging) (see the [article on a feature-branch workflow](https://www.atlassian.com/git/workflows#!workflow-feature-branch) from Atlassian as well) and NOT the `master` branch.

## Additional Resources

* [Extreme Programming Rules](http://www.extremeprogramming.org/rules.html)
