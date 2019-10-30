### Introduction
At this point you've already had a fair amount of practice using the various techniques we've shown you. But we've been throwing a _lot_ of information your way, so before we move on we're going to take a minute to slow down and work on one more great portfolio project.

# The Todo List

Todo lists are a staple in beginning webdev tutorials because they can be very simple.  There is, however, a lot of room for improvement and many features that can be added.  

Before diving into the code, take a minute to think about how you are going to want to organize your project

### Assignment

<div class="lesson-content__panel" markdown="1">
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
</div>

### Student Solutions
To add your solution to the list below, edit this [file](https://github.com/TheOdinProject/curriculum/blob/master/javascript/organizing-js/project.md) (located on The Odin Project's "curriculum" github repository). See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for more instructions.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [bollinca's Solution](https://github.com/bollinca/to-do-list) - [View in Browser](https://bollinca.github.io/to-do-list/)
* [ejoflo's Solution](https://github.com/ejoflo/to_do_list) - [View in Browser](https://ejoflo.github.io/to_do_list/)
* [miang's solution](https://github.com/miang99/todolist) - [View in Browser](https://miang99.github.io/todolist/)
* [Igorashs's Solution](https://github.com/igorashs/todo-list) - [View in Browser](https://igorashs.github.io/todo-list/)
* [Jacavena's Solution](https://github.com/Jacavena/todo-list) - [View in Browser](https://jacavena.github.io/todo-list/)
* [Bojo's Solution](https://github.com/BojoZahariev/ToDo) - [View in Browser](https://bojozahariev.github.io/ToDo/)
* [Solodov Solution](https://github.com/solodov-dev/do) - [View in Browser](https://solodov-dev.github.io/do/)
* [Vedat's Solution](https://github.com/mvedataydin/todo-list) - [View in Browser](https://mvedataydin.github.io/todo-list/)
* [Joey Van Lierop's Solution](https://github.com/joeyvanlierop/todo-list) - [View in Browser](https://joeyvanlierop.github.io/todo-list/)
* [ELjoey's Solution](https://github.com/eljoey/Todo-List) - [View in Browser](https://eljoey.github.io/Todo-List/)
* [Djo1e's solution](https://github.com/Djo1e/Todo) - [View in browser](https://djo1e.github.io/Todo/)
* [Henry Kirya's Solution](https://github.com/harrika/todo-list) - [View in browser](https://harrika.github.io/todo-list/)
* [John Kripp's Solution](https://github.com/JohnKripp/Todo-App) - [View in browser](https://johnkripp.github.io/Todo-App/)
* [Simon Tharby's solution](https://github.com/jinjagit/todo) - [View in browser](https://to-do.simontharby.com/)
* [ARaut9's solution](https://github.com/ARaut9/to-do-list) - [View in Browser](https://araut9.github.io/to-do-list/)
* [Jason McKee's solution](https://github.com/jttmckee/odin-todo-list) - [View in Browser](https://jttmckee.github.io/odin-todo-list/)
* [Ricala's solution](https://github.com/Ricala/to-do-list) - [View in Browser](https://ricala.github.io/to-do-list/)
* [Hammad Ahmed's solution](https://github.com/shammadahmed/task-manager) - [Live preview](https://shammadahmed.github.io/task-manager)
* [Roman Alenskiy's solution](https://github.com/romalenskiy/todo) - [Live preview](https://romalenskiy.github.io/todo/)
* [Max Garber's solution](https://github.com/bubblebooy/Odin-Javascript/tree/master/todos) - [View in Browser](https://bubblebooy.github.io/Odin-Javascript/todos/dist/index.html)
* [VladL2c's solution](https://vladl2c.github.io/Project-Manager/) - [View in Browser](https://vladl2c.github.io/Project-Manager/)
* [Javier Machin's solution](https://github.com/Javier-Machin/js-to-do-list) - [View in Browser](https://javier-machin.github.io/js-to-do-list/)
* [Kyle and Paul's solution](https://github.com/jklemon17/todo-list) - [View in Browser](https://jklemon17.github.io/todo-list/)
* [nmac's solution](https://github.com/nmacawile/to-do-list) - [View](https://nmacawile.github.io/to-do-list/)
* [brxck's solution](https://github.com/brxck/odin-tasks) - [View in Browser](http://brockmcelroy.com/odin-tasks/)
* [theghall's solution](https://github.com/theghall/odin-todo) - [View in Browser](https://theghall.github.io/odin-todo/)
* [Andrew's Solution](https://github.com/andrewr224/to-dodo/) - [View in Browser](https://andrewr224.github.io/to-dodo/)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/honeydew) - [View in Browser](https://mindovermiles262.github.io/honeydew/)
* [Pedro's solution](https://github.com/dracollin/todoList-project) - [View in browser](https://codepen.io/dracollin/pen/eWrdyN)
* [Ezequiel Espinoza's Solution](https://github.com/ezeaspie/todo-app) - [View in browser](https://ezeaspie.github.io/todo-app/)
* [Jmooree30's solution](https://github.com/jmooree30/JS-Todo-List) - [View in browser](https://jmooree30.github.io/JS-Todo-List/)
* [Remy's solution](https://codepen.io/beumsk/pen/QvqyMM) - [View in browser](https://codepen.io/beumsk/full/QvqyMM)
* [Caner Sezgin's solution](https://github.com/CanerSezgin/TodoList/tree/master/Source%20Codes) - [View in browser](https://canersezgin.github.io/TodoList/)
* [aznafro's solution](https://github.com/aznafro/todo) - [View in browser](https://aznafro.github.io/todo/)
* [Areeba's solution](https://github.com/AREEBAISHTIAQ/Todolist) - [View in browser](https://areebaishtiaq.github.io/Todolist)
* [Taylor J's solution](https://github.com/taylorjohannsen/todolist) - [View in browser](https://taylorjohannsen.github.io/todolist/)
* [Halkim44's solution](https://github.com/halkim44/todoListApp) - [View App Online](https://halkim44.github.io/todoListApp/)
* [Valentino Valenti's solution](https://github.com/1ba1/todo-list) - [View in browser](https://1ba1.github.io/todo-list/)
* [Francisco Carlos's solution](https://github.com/fcarlosdev/fcarlosdev.github.io/tree/master/todo-app) - [View in browser](https://fcarlosdev.github.io/todo-app/)
* [Ubaid Manzoor Wani](https://github.com/Ubaid-Manzoor) - [View in Browser](https://ubaid-manzoor.github.io/ToDo-List/)
* [JamCry's solution](https://github.com/jamcry/got2do) - [View in Browser](https://jamcry.github.io/got2do/)
* [Martink-rsa's solution](https://github.com/martink-rsa/ToDoList) - [View in Browser](https://martink-rsa.github.io/ToDoList/)
* [dvbridges solution](https://github.com/dvbridges/masterplan) - [View in browser](https://dvbridges.github.io/masterplan/)

</details>
