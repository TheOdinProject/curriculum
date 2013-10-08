# Contributing

This project is very much a work-in-progress and benefits heavily from the contributions of everyone from students to teachers to developers.  

## What to Contribute

### 1. Content

Almost all the content is sourced from free pre-existing videos, blogs and tutorials.  If we're trying to teach something and you know there's a better resource out there, put it in the "Additional Resources" section.  Same goes for alternate but useful explanations of the material.  If you've got high quality material on your own blog or website, feel free to do the same.  Content with an obvious commercial angle (like marketing videos) should only be used if there is no reasonable substitute.

### 2. Exercises and Projects

This is a project-driven curriculum so having useful and interesting projects that break down to address specific content modules is crucial.  We rely heavily on others to give us project ideas and to begin breaking them down into a checklist of deliverables.  Ultimately, we'd also like to have specs and a canonical solution created for each project as well.  If you can help on any of those levels, please contribute!

We will also be instituting quizzes at the beginning and end of various sections.  If you know of or have created any interesting problems that address a particular area of content (especially if they come with specs), please send them or the links to them our way!

### 3. Curriculum

This curriculum is built to pave the way between new students and industry.  If you're a developer and have a strong opinion about something you believe jr devs are lacking these days and should be included in the curriculum, [let us know!](mailto:feeback@theodinproject.com)  If you're a student and have gone through a unit and still don't feel like you understand something well enough, tell us so we can beef up that section!

### Also...

[The Odin Project's main website](http://theodinproject.com) is fully open-sourced as well and we'd love to hear from you if you'd be interested in helping out with building the tools there.


## How to Contribute

There are three main ways to contribute, in order of preference:

1. **Pull Request:**  To contribute, [fork the curriculum repository](https://help.github.com/articles/fork-a-repo), make your changes or additions, then [submit a pull request](https://help.github.com/articles/using-pull-requests).

2. **Github Issue:** You can also [open up a Github issue](https://github.com/TheOdinProject/curriculum/issues) instead and we'll take care of it.

3. **Email:** [Email us](mailto:curriculum@theodinproject.com) your suggestions directly.  If you have questions about The Odin Project itself, [contact us here](mailto:curriculum@theodinproject.com).

If you're adding a solution to one of the projects, first save it in your own repository and then just make a link to it in the appropriate project's section.  Be sure to give your partner appropriate acknowledgement if you have one and they want it.

If you're unfamiliar with the Markdown (.md) syntax that's used in these files, it's really straightforward and there's a great guide for it from [Daring Fireball here](http://daringfireball.net/projects/markdown/syntax).

### Attribution

As you can tell, we highly value and rely on the help of the developer and student communities.  We'd like to do as much as we can to identify our top contributers and the providers of high quality content.  While the curriculum resides on Github, we'll maintain a top contributers list in addition to the commit histories.  Should it migrate to an independent platform, we'll still do our best to attribute both the content and submission source for their contributions to the project.  Contributers taking a more active role in the project may be invited to join the core team as well.

## How this Curriculum Actually Gets Deployed and Served

### Github Pages 

The curriculum is served by [Github Pages](http://pages.github.com/), which basically means that Github takes all the markdown and template files that it's made up of and then renders them as HTML which is viewable on theodinproject.github.com/curriculum (which is probably where you're looking at them right now).

Github lets you serve these "Github Pages" for any project or organization account so they have you put the files you want rendered in a branch that must be named `gh-pages` and they use [Jekyll](http://jekyllrb.com/) to render them.  For many projects, the `gh-pages` branch will be completely different than the main project and the maintainers treat it as sort of a project-within-a-project (since the actual code for the project likely lives at the `master` branch and will be very different from the webpage served by the `gh-pages` branch to promote or provide a guide to that project).  
### Contributing Workflow

In the case of this curriculum, the `master` and `gh-pages` branches don't need to be treated separately because the curriculum IS what should get served by Github Pages... you'll find the two branches to be usually identical to within a few commits of each other (with `master` ahead).  The `master` branch tends to record work while I'm building and then those changes get pushed/merged to the `gh-pages` branch when it's time to deploy them (I'll often just do a `$ git push origin master:gh-pages` to push directly from my local master to the remote `gh-pages` branch).  

If you want to contribute with a pull request, fork the `master` branch, make your changes (you'll find the curriculum files inside of the `dir` folder), and submit the pull request.  

If you want to see them deployed in a test environment first (probably a good idea), you'll need to:

1. Do a `$ bundle install` from within the project folder to get the jekyll gem on your machine
2. There's a manual hack to get the links to show up properly, so you'll need to go into the `_config.yml` file and switch the `url` from `http://theodinproject.com/curriculum` to `http://localhost:4000` (usually this just means uncommenting one line and recommenting the other).  Yeah, it's ugly.
2. Run `$ jekyll build` to build the project, which basically renders everything in your top level directory and puts it as HTML files into the `_site` directory (don't manually edit any files in the `_site` directory, they get blown away each time you run `$ jekyll build` anyway).  
3. Run `$ jekyll serve` to fire up a localhost server (usually port 4000, e.g. `http://localhost:4000`) and view the rendered page.
4. You should be good to go.  Please only include the top level file that was changed in the pull request... the extra `_site` and `_config.yml` changes are just clutter.

## Thank you for your help and support!








