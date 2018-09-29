This is the overview of our re-vamp of the existing Javascript(JS) course. At the moment it is in it's infancy so please feel free to leave suggestions in the comments such as:
- Quality resources for a given topic.
- Lessons or topics you think should be included in the course.
- Ideas pertaining to the sequence of lessons
- Projects for each lesson/topic
- Any general feedback (the more the better!)

## Why this course is _important_.
Ruby and Rails are _not_ dead or dying by any means, but the current trends in WebDev are increasingly focused on JS, and it looks like that trend is going to continue.  Our curriculum _does_, of course have an entire JS unit, but being at the end of the whole curriculum it was put together rather hurriedly and some of it feels incomplete.  In addition, many of the sections have become rather outdated since they were written almost 5 years ago.  JS is changing, so our curriculum needs to as well.

It is conceivable that at some point in the future this JS course could actually shift to being the main focus of the curriculum rather than being secondary to the Ruby/Rails courses, so getting a good, solid foundation in this revamp is crucial.

## Topics of Study (Units/Lessons for the course)
This is a rough outline of the course.  Note that it _does_ include the lessons that will eventually be included in WebDev101, so this course will be starting at ground-zero.  We aren't quite to the point of planning individual lessons, so each of the points below could have one or more lessons and a project or two within them.

### JS101:
- JS Basics
- DevTools (if it's not covered elsewhere)
- DOM Manipulation (plainJS)

### Advanced JS
- AJAX/APIs
- Testing
- ES6
- Scope/Closures/Objects/`this`
- Call, Apply and Bind
- Functional Programming Concepts

### Other Stuff
- JS + Rails
- Frameworks:
  - Node
  - Express
  - React

I suspect that at some point we will want an entire course based on JS frameworks (backend stuff like Node/Express and front-end stuff like React) so for now, the "frameworks" lesson will basically be a teaser with general info and links to the basic "hello world" tutorials for each framework.

The following is a compilation of links, ideas and potential projects to complete for each section.  I'll try to keep it updated as you all comment and share ideas.

#### JS Basics
- For the most part, I think the existing WD101 JS section is adequate. It might need a little updating, but it's OK overall.
- Should include lesson on running JS code (https://www.youtube.com/watch?v=t7t_5QT4mxg&)
- Resources:
  - Primarily codecademy.  
  - Eloquent JS is a highly recommended resource.. should at least mention it.
  - You Don't Know JS, "Up and Running" (the first book in the series) would be a good fit here as well.
- Projects:
  - Algorithm Scripting
    - We'll roll our own test suite as a git repo for students to clone and then complete, should mirror at least some of the ruby exercises.
#### DOM Manipulation
- Focusing on plainJS at first...
  - https://github.com/oneuijs/You-Dont-Need-jQuery
- Resources:
  - http://domenlightenment.com/
  - JS30?
- Projects:
   - Need ideas ;)
#### ajax/APIs
 - We can cover and use `fetch` or some other 3rd party module (axios is popular) 
 - These don't show up in the current curriculum until _way_ later, but I propose that most modern WebDev relies quite heavily on the concept of APIs, and for some reason, they're considered to be a somewhat scary topic.
- We should also talk a bit about async here because AJAX methods are by definition going to be asyncronous.
- There are lots of good APIs we could tap into to use for this assignment, but we should probably pick a relatively simple one. examples:
  - Curated list of open APIs : [HERE](https://github.com/abhishekbanthia/Public-APIs?utm_source=SitePoint&utm_medium=email&utm_campaign=Versioning)

  - Open Movie DB
  - Weather api: Darkskynet has a great api and their plans are free for small scale applications.
  - StockPicker: Quandl is great for beginners who want to use financial information.
#### TDD in JS
- We should not assume that students will have had any exposure to TDD at all because they could be doing the JS only track.
- There are many Testing libraries out there, but I'm partial to `tape`, so unless someone gives me a good reason to use something else (I'm open to it!!) that's what we'll go with.  I prefer `tape` for it's simplicity.
- Projects can be anything really... just focus on TDD.
- I presume these lessons will need to be written by us.
#### ES6
I am hoping that we will not have to cover too much here. Presumably many of the syntax things and features will be covered in earlier lessons, however there are a few little details that need covered, including a section on transpilers.
things to cover include:
- Babel! (maybe we should write our own, but this tutorial is pretty hip https://github.com/verekia/js-stack-from-scratch)
- Destructuring
- Promises
- Arrow Functions
- ??? probably something else I'm forgetting
- Probably don't need projects here.. students can just start working this stuff into their current work.
### Deeper JS topics
Once the basic syntax is down, Rails-track people can bow out, but for those wanting to stay the course, or to do the JS-only track, this is where it gets _deeper_.  Topics to be covered include:
- Hoisting
- Scope & this
- Closures
- Callbacks
- Objects (in greater depth.. gearing up for OOP)
- https://www.youtube.com/watch?v=Bv_5Zv5c-Ts << this video covers a lot of that material
#### OOP in JS
_JS DOES NOT HAVE CLASSES_.  This section is important.. crucial even.
- Prototypal Inheritance:
  - What/How
  - WHY.
  - Prototypes vs. Classes
- Projects may include anything. We will have to brainstorm on that.
#### Functional JS
- FCC introduction to functional methods is good, if we haven't already covered it by this point.
- http://reactivex.io/learnrx/ <- awesome resource.
- Kyle Simpson book.
- F.Risby's book
- ??

#### Other stuff..
- This is a great article for express: https://zellwk.com/blog/crud-express-mongodb/

###  ...remainder is in progress 

