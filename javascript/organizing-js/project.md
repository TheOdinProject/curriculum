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
* [fviccia's Solution](https://github.com/fviccia/to-do-list) - [View in Browser](https://fviccia-to-do-list.netlify.app/)
* [byter11's Solution](https://github.com/byter11/ToDo_List) - [View in Browser](https://byter11.github.io/ToDo_List/)
* [Muhymenul Haque's Solution](https://github.com/muhymenulhaque/theToDoList) - [View in Browser](https://muhymenulhaque.github.io/theToDoList/)
* [ray0h's Solution](https://github.com/ray0h/ToDoApp) - [View in Browser](https://ray0h.github.io/ToDoApp/)
* [Salvador Villalon's Solution](https://github.com/salvillalon45/theOdinProject-TodoList) - [View in Browser](https://salvillalon45.github.io/theOdinProject-TodoList/)
* [kaliberpoziomka's Solution](https://github.com/kaliberpoziomka/todolist-react) - [View in Browser](https://kaliberpoziomka.github.io/todolist-react/)
* [Rizwan's Solution](https://github.com/xRizwan/Todo-List) - [View in Browser](https://xrizwan.github.io/Todo-List/)
* [pklepa's Solution](https://github.com/pklepa/to-do)
* [RobisonWebDev Solution](https://github.com/robisonwebdev/Todo-List) - [View in Browser](http://davidrulonrobison.com/Todo-List/)
* [vonhoro's Solution](https://github.com/vonhoro/To-Do-List/) - [View in Browser](https://vonhoro.github.io/To-Do-List/)
* [Osechi3's Solution](https://github.com/osechi3/todo-list/) - [View in Browser](https://osechi3.github.io/todo-list/)
* [Ideopunk's Solution](https://github.com/Ideopunk/to-do-list/) - [View in Browser](https://ideopunk.github.io/to-do-list/)
* [Jason Thompson's Solution](https://github.com/jasont01/todo-list) - [View in Browser](https://jasont01.github.io/todo-list)
* [Alex Cole's Solution](https://github.com/AlexJ-Cole/TodoList) - [View in Browser](https://github.com/AlexJ-Cole/TodoList)
* [Juan Oxmar's Solution](https://github.com/juanoxmar/todo) - [View in Browser](https://juanoxmar.github.io/todo/)
* [Scott's Solution](https://github.com/ScotttP/todo-list) - [View in Browser](https://scotttp.github.io/todo-list/)
* [Andrija's Solution](https://github.com/Amdrija/todo-list-app) - [View in Browser](https://amdrija.github.io/todo-list-app/)
* [Zayeer's Solution](https://github.com/Zayeer/todo-list-app) - [View in Browser](https://zayeer.github.io/todo-list-app/)
* [Kevin's Solution](https://github.com/Kevin-Satti-Projects/Projects/tree/master/ToDo) - [View in Browser](https://kevin-satti-projects.github.io/Projects/ToDo/dist/)
* [lexolf's Solution](https://github.com/lexolf/todo-list) - [View in Browser](https://lexolf.github.io/todo-list/dist/)
* [Walmart-cashier's Solution](https://github.com/Walmart-cashier/DulcetTodo) - [View in Browser](https://walmart-cashier.github.io/DulcetTodo/)
* [LenaChestnut's Solution](https://github.com/LenaChestnut/to-do) - [View in Browser](https://lenachestnut.github.io/to-do/dist/index.html)
* [Andres Ruiz's Solution](https://github.com/Andrsrz/todo-list) - [View in Browser](https://andrsrz.github.io/todo-list/)
* [HeliumAce's Solution](https://github.com/HeliumAce/todo-list) - [View in Browser](https://heliumace.github.io/todo-list/)
* [Lucio's Solution](https://github.com/JCarlosLucio/todo-list) - [View in Browser](https://jcarloslucio.github.io/todo-list/)
* [Austin's Solution](https://github.com/cudworth/todo-list) - [View in Browser](https://cudworth.github.io/todo-list/dist/)
* [hieu-ng's Solution](https://github.com/hieu-ng/todo-list) - [View in Browser](https://hieu-ng.github.io/todo-list/)
* [Diane998's Solution](https://github.com/Diane998/todo-list) - [View in Browser](https://diane998.github.io/todo-list/)
* [Sher's solution](https://github.com/sher-s7/todo-list) - [View in Browser](https://sher-s7.github.io/todo-list/)
* [dhatGuy's and nearmint's Solution](https://github.com/nearmint/todolist) - [View in Browser](https://nearmint.github.io/todolist/)
* [Muhammad Ahmad's Solution](https://github.com/thisisMAhmad/todolist) - [View in Browser](https://thisismahmad.github.io/todolist/)
* [Carl D'Oleo-Lundgren's Solution](https://github.com/carldoleolundgren/todo-list) - [View in Browser](https://carldoleolundgren.github.io/todo-list/)
* [hu-ng's Solution](https://github.com/hu-ng/todo-list-js) - [View in Browser](https://hu-ng.github.io/todo-list-js/)
* [jc's Solution](https://github.com/avazkhan2808/project-todo) - [View in Browser](https://avazkhan2808.github.io/project-todo/)
* [AJMcDee's Solution](https://github.com/ajmcdee/ToDoApp) - [View in Browser](https://ajmcdee.github.io/ToDoApp)
* [simonevaglietti's Solution](https://github.com/simonevaglietti/Todo-App) - [View in Browser](https://simonevaglietti.github.io/Todo-App/dist/)
* [mjwills-inf's Solution](https://github.com/mjwills-inf/-TOP-todo) - [View in Browser](https://mjwills-inf.github.io/-TOP-todo/)
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
* [Joe Thompson's Solution](https://github.com/jlthompso/todo) - [View in Browser](https://jlthompso.github.io/todo/)
* [m-rejdych's Solution](https://github.com/m-rejdych/Todo-List) - [View in Browser](https://m-rejdych.github.io/Todo-List/)
* [FortyPercentTitanium's Solution](https://github.com/fortypercenttitanium/todolist) - [View in Browser](https://fortypercenttitanium.github.io/todolist/)
* [adilahmad321's Solution](https://github.com/adilahmad321/ToDo-List) - [View in Browser](https://adilahmad321.github.io/ToDo-List/)
* [MatyD's Solution](https://github.com/MatyD356/vanillaToDo/tree/master) - [View in Browser](https://matyd356.github.io/vanillaToDo/)
* [rhathcock's Solution](https://github.com/r-hathcock/todo_list)
* [jooji-san's Solution](https://github.com/jooji-san/todo) - [View in Browser](https://jooji-san.github.io/todo/)
* [Chandra's Solution](https://github.com/CodeSurfer3022/New-todo-list) - [View in Browser](https://codesurfer3022.github.io/New-todo-list/)
* [Adriel Bruno's Solution](https://github.com/AdrielTrigger/top-todolist) - [View in Browser](https://adrieltrigger.github.io/top-todolist/)
* [Nijepa's Solution](https://github.com/nijepa/todo-list) - [View in Browser](https://nijepa.github.io/todo-list/)
* [lonewolf045's Solution](https://github.com/lonewolf045/todo-list) - [View in Browser](https://nijepa.github.io/todo-list/)
* [themetar's Solution](https://github.com/themetar/TODO-App) - [View in Browser](https://themetar.github.io/TODO-App/)
* [alxmkh's Solution](https://github.com/alxmkh/to-do-list) - [View in Browser](https://alxmkh.github.io/to-do-list/)
* [Tristan Ross's Solution](https://github.com/TristanRoss/todo-list) - [View in Browser](https://tristanross.github.io/todo-list/)
* [liampc's Solution](https://github.com/liampc/to-do-list) - [View in Browser](https://liampc.github.io/to-do-list/)
</details>
