At this point you've already had a fair amount of practice using the various techniques we've shown you. But we've been throwing a _lot_ of information your way, so before we move on we're going to take a minute to slow down and work on one more great portfolio project.

# The Todo List

Todo lists are a staple in beginning webdev tutorials because they can be very simple.  There is, however, a lot of room for improvement and many features that can be added.  

Before diving into the code, take a minute to think about how you are going to want to organize your project

1. Your 'todos' are going to be objects that you'll want to dynamically create, which means either using factories or constructors/classes to generate them.
2. Brainstorm what kind of properties your todo-items are going to have. At a minimum they should have a `title`, `description`, `dueDate` and `priority`.  You might also want to include `notes`  or even a `checklist`.
3. Your todo list should have `projects` or separate lists of `todos`.  When a user first opens the app, there should be some sort of 'default' project to which all of their todos are put.  Users should be able to create new projects and choose which project their todos go into.
4. You should separate your application logic (i.e. creating new todos, setting todos as complete, changing todo priority etc.) from the DOM-related stuff, so keep all of those things in separate modules.
5. The look of the User Interface is up to you, but it should be able to do the following:
   1. view all projects
   2. view all todos in each project (probably just the title and duedate.. perhaps changing color for different priorities)
   3. expand a single todo to see/edit it's details
   4. delete a todo
6. For inspiration, check out the following great todo apps. (look at screenshots, watch their introduction videos etc.)
   1. [Todoist](https://en.todoist.com/)
   2. [Things](https://culturedcode.com/things/)
   3. [any.do](https://www.any.do/)
7. Use localStorage to save user's projects and todos between sessions.
8. Since you are probably already using webpack, adding external libraries from npm is a cinch!  You might want to consider using the following useful library in your code:
   1. [date-fns](https://github.com/date-fns/date-fns) gives you a bunch of handy functions for formatting and manipulating dates and times.

### Student Solutions
Send us your solution so we can show others! Submit a link to the Github repo with your files in it by using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  See the [Google Homepage project](/courses/web-development-101/lessons/html-css) for examples.

* Add your solution below this line!