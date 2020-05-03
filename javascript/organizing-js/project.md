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
   3. expand a single todo to see/edit its details
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
* [AJMcDee's Solution](https://github.com/ajmcdee/ToDoApp) - [View in Browser](https://ajmcdee.github.io/ToDoApp)
* [simonevaglietti's Solution](https://github.com/simonevaglietti/Todo-App) - [View in Browser](https://simonevaglietti.github.io/Todo-App/dist/)
* [Justinkar's Solution](https://github.com/justinkar/todo-list) - [View in Browser](https://justinkar.github.io/todo-list/)
* [mjwills-inf's Solution](https://github.com/mjwills-inf/todo) - [View in Browser](https://mjwills-inf.github.io/todo/)
* [Edd Sansome's Solution](https://github.com/casualc0der/to-do-two) - [View in Browser](https://casualc0der.github.io/to-do-two/)
* [Lenny's Solution](https://github.com/Lenn-e/todo-list) - [View in Browser](https://lenn-e.github.io/todo-list/)
* [Katarzyna Kaswen-Wilk's Solution](https://github.com/kikupiku/to-do-list) - [View in Browser](https://kikupiku.github.io/to-do-list/)
* [Saad Tarhi's Solution](https://github.com/tarhi-saad/TodoMVC-Vanilla-ES6) - [View in Browser](https://tarhi-saad.github.io/TodoMVC-Vanilla-ES6/)
* [Simon's Solution](https://github.com/Sim-frpt/todo-list) - [View in Browser](https://sim-frpt.github.io/todo-list/)
* [yldrmali's Solution](https://github.com/yldrmali/todo_list/tree/master) - [View in Browser](https://yldrmali.github.io/todo_list/)
* [Jonathan's Solution](https://github.com/jonfranche/todo-list) - [View in Browser](https://jonfranche.github.io/todo-list/dist/index.html)
* [Luky's Solution](https://github.com/lcyne/todo-list/) - [View in Browser](https://lcyne.github.io/todo-list/)
* [Kevin Vuong's Solution](https://github.com/fffear/js-to-do-list) - [View in Browser](https://fffear.github.io/js-to-do-list/)
* [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/todo-list) - [View in Browser](https://braxtonlemmon.github.io/todo-list/)
* [Zakariye Yusuf's Solution](https://github.com/ZYusuf10/timely) - [View in Browser](https://zyusuf10.github.io/timely/dist/index.html)
* [Alex's Solution](https://github.com/AlexDorrington/Todo-List) - [View in Browser](https://alexdorrington.github.io/Todo-List/)
* [Andrew M's Solution](https://github.com/a6macleod/js_todo) - [View in Browser](https://a6macleod.github.io/js_todo/)
* [bollinca's Solution](https://github.com/bollinca/to-do-list) - [View in Browser](https://bollinca.github.io/to-do-list/)
* [ejoflo's Solution](https://github.com/ejoflo/to_do_list) - [View in Browser](https://ejoflo.github.io/to_do_list/)
* [miang's Solution](https://github.com/miang99/todolist) - [View in Browser](https://miang99.github.io/todolist/)
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
* [Simon Tharby's Solution](https://github.com/jinjagit/todo) - [View in browser](https://to-do.simontharby.com/)
* [ARaut9's Solution](https://github.com/ARaut9/to-do-list) - [View in Browser](https://araut9.github.io/to-do-list/)
* [Jason McKee's Solution](https://github.com/jttmckee/odin-todo-list) - [View in Browser](https://jttmckee.github.io/odin-todo-list/)
* [Ricala's Solution](https://github.com/Ricala/to-do-list) - [View in Browser](https://ricala.github.io/to-do-list/)
* [Hammad Ahmed's Solution](https://github.com/shammadahmed/task-manager) - [Live preview](https://shammadahmed.github.io/task-manager)
* [Roman Alenskiy's Solution](https://github.com/romalenskiy/todo) - [Live preview](https://romalenskiy.github.io/todo/)
* [Max Garber's Solution](https://github.com/bubblebooy/Odin-Javascript/tree/master/todos) - [View in Browser](https://bubblebooy.github.io/Odin-Javascript/todos/dist/index.html)
* [VladL2c's Solution](https://vladl2c.github.io/Project-Manager/) - [View in Browser](https://vladl2c.github.io/Project-Manager/)
* [Javier Machin's Solution](https://github.com/Javier-Machin/js-to-do-list) - [View in Browser](https://javier-machin.github.io/js-to-do-list/)
* [Kyle and Paul's Solution](https://github.com/jklemon17/todo-list) - [View in Browser](https://jklemon17.github.io/todo-list/)
* [nmac's Solution](https://github.com/nmacawile/to-do-list) - [View](https://nmacawile.github.io/to-do-list/)
* [brxck's Solution](https://github.com/brxck/odin-tasks) - [View in Browser](http://brockmcelroy.com/odin-tasks/)
* [theghall's Solution](https://github.com/theghall/odin-todo) - [View in Browser](https://theghall.github.io/odin-todo/)
* [Andrew's Solution](https://github.com/andrewr224/to-dodo/) - [View in Browser](https://andrewr224.github.io/to-dodo/)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/honeydew) - [View in Browser](https://mindovermiles262.github.io/honeydew/)
* [Pedro's Solution](https://github.com/dracollin/todoList-project) - [View in Browser](https://codepen.io/dracollin/pen/eWrdyN)
* [Ezequiel Espinoza's Solution](https://github.com/ezeaspie/todo-app) - [View in Browser](https://ezeaspie.github.io/todo-app/)
* [Jmooree30's Solution](https://github.com/jmooree30/JS-Todo-List) - [View in Browser](https://jmooree30.github.io/JS-Todo-List/)
* [Remy's Solution](https://codepen.io/beumsk/pen/QvqyMM) - [View in browser](https://codepen.io/beumsk/full/QvqyMM)
* [Caner Sezgin's Solution](https://github.com/CanerSezgin/TodoList/tree/master/Source%20Codes) - [View in Browser](https://canersezgin.github.io/TodoList/)
* [aznafro's Solution](https://github.com/aznafro/todo) - [View in Browser](https://aznafro.github.io/todo/)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/Todolist) - [View in browser](https://areebaishtiaq.github.io/Todolist)
* [Taylor J's Solution](https://github.com/taylorjohannsen/todolist) - [View in Browser](https://taylorjohannsen.github.io/todolist/)
* [Halkim44's Solution](https://github.com/halkim44/todoListApp) - [View App Online](https://halkim44.github.io/todoListApp/)
* [Valentino Valenti's Solution](https://github.com/1ba1/todo-list) - [View in browser](https://1ba1.github.io/todo-list/)
* [Francisco Carlos's Solution](https://github.com/fcarlosdev/fcarlosdev.github.io/tree/master/todo-app) - [View in browser](https://fcarlosdev.github.io/todo-app/)
* [Ubaid Manzoor Wani's Solution](https://github.com/Ubaid-Manzoor) - [View in Browser](https://ubaid-manzoor.github.io/ToDo-List/)
* [JamCry's Solution](https://github.com/jamcry/got2do) - [View in Browser](https://jamcry.github.io/got2do/)
* [Gene Mecija's Solution](https://github.com/genemecija/To-Do-List) - [View in Browser](https://genemecija.github.io/To-Do-List/)
* [Martink-rsa's Solution](https://github.com/martink-rsa/ToDoList) - [View in Browser](https://martink-rsa.github.io/ToDoList/)
* [dvbridges Solution](https://github.com/dvbridges/masterplan) - [View in Browser](https://dvbridges.github.io/masterplan/)
* [Aron's Solution](https://github.com/aronfischer/To-Do-List) - [View in Browser](https://aronfischer.github.io/To-Do-List/)
* [JoshAubrey's Solution](https://github.com/JoshAubrey/todo-list) - [View in Browser](https://joshaubrey.github.io/todo-list/)
* [Brendaneus' Solution](https://theodinprojects.live/courses/javascript/projects/todo-list)
* [Emil Dimitrov's Solution](https://github.com/edmtrv/todo-js) - [View in Browser](https://edmtrv.github.io/todo-js/)
* [Kelvin Liang's Solution](https://github.com/kelvin8773/odin-todo-list) - [view in Browser](https://kelvin8773.github.io/odin-todo-list/)
* [AWash227's Solution](https://github.com/AWash227/todo) - [View in Browser](https://awash227.github.io/todo/dist/)
* [Supasus's Solution](https://github.com/supasus/js-todo-list) - [View in Browser](https://supasus.github.io/js-todo-list/)
* [AlexGioffDev's Solution](https://github.com/AlexGioffDev/TODO_JS) - [View in Browser](https://alexgioffdev.github.io/TODO_JS/)
* [kylazath's Solution](https://github.com/kylazath/todos) - [View in Browser](https://kylazath.github.io/todos/index.html)
* [mmboyce's Solution](https://github.com/mmboyce/to-do) - [View in Browser](https://mmboyce.github.io/to-do)
* [Hamohuh's Solution](https://github.com/hamohuh/todo) - [View in Browser](https://hamohuh.github.io/todo/)
* [Vorelli's Solution](https://github.com/Vorelli/Goal_Tracker) - [View in Browser](https://vorelli.github.io/Goal_Tracker/)
* [Y0ss-Please's Solution](https://github.com/Y0ss-Please/doitup) - [View in Browser](https://y0ss-please.github.io/doitup/public/index.html)
* [0xtaf's Solution](https://github.com/0xtaf/todo) - [View in Browser](https://0xtaf.github.io/todo/)
* [ricardo's Solution](https://ricardo-gonzalez-villegas.github.io/to-do-list/)
* [barrysweeney's Solution](https://github.com/barrysweeney/todo-list) - [View in Browser](https://barrysweeney.github.io/todo-list/)
* [Rey van den Berg's Solution](https://github.com/Rey810/to-do-app) - [View in Browser](https://rey810.github.io/to-do-app/)
* [ranmaru22's Solution](https://github.com/ranmaru22/the_odin_project/tree/master/to-do) - [View in Browser](https://ranmaru22.github.io/the_odin_project/to-do/dist/)
* [Tim Kelly's Solution (Webpack, Moment.js and SortableJS)](https://github.com/timkellytk/project-to-do-list) - [View in Browser](https://timkellytk.github.io/project-to-do-list/)
* [thecodediver's Solution](https://github.com/thecodediver/tasks_app) - [View in Browser](https://thecodediver.github.io/tasks_app/)
* [m-rejdych's Solution](https://github.com/m-rejdych/Todo-List) - [View in Browser](https://m-rejdych.github.io/Todo-List/)
</details>
