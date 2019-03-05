### Introduction
Let's extend the 'Book' example from the previous lesson and turn it into a small Library app.


### Assignment

<div class="lesson-content__panel" markdown="1">

1. If you haven't already, set up your project with skeleton HTML/CSS and JS files.
2. All of your book objects are going to be stored in a simple array, so add a function to the script (not the constructor) that can take user's input and store the new book objects into an array. Your code should look something like this:

   ~~~javascript
   let myLibrary = []

   function Book() {
     // the constructor...
   }

   function addBookToLibrary() {
     // do stuff here
   }
   ~~~

3. Hook the array up to your HTML with a `render()` function that loops through the array and displays each book on the page. You can display them in some sort of table, or each on their own "card". It might help for now to manually add a few books to your array so you can see the display.
4. Add a "NEW BOOK" button that brings up a form allowing users to input the details for the new book: author, title, number of pages, whether it's been read and anything else you might want.
5. Add a button on each book's display to remove the book from the library.
   1. You will need to associate your DOM elements with the actual book objects in some way. One easy solution is giving them a data-attribute that corresponds to the index of the library array.
6. Add a button on each book's display to change it's `read` status.
   1. To facilitate this you will want to create the function that toggles a book's `read` status on your `Book` prototype.
7. Optional -we haven't learned any techniques for actually storing our data anywhere, so when the user refreshes the page all of their books will disappear! If you want, you are capable of adding some persistence to this library app using one of the following techniques:
   1. localStorage ([docs here](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)) allows you to save data on the user's computer. The downside here is that the data is ONLY accessible on the computer that it was created on. Even so, it's pretty handy! Set up a function that saves the whole library array to localStorage every time a new book is created, and another function that looks for that array in localStorage when your app is first loaded. (make sure your app doesn't crash if the array isn't there!)
   2. Firebase ([check it out!](https://firebase.google.com/docs/?authuser=0)) is an online database that can be set up relatively easily, allowing you to save your data to a server in the cloud! Teaching you how to use it is beyond the scope of this tutorial, but it is almost definitely within your skill set. If you're interested, check out [this video](https://www.youtube.com/watch?v=noB98K6A0TY) to see what it's all about.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/javascript/organizing-js/library-project.md) in the Javascript Curriculum Github repo with your files in it by using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md). See the [Google Homepage project](/courses/web-development-101/lessons/html-css) for examples.

- Add your solution below this line!
- [balowulf's Solution](https://github.com/balowulf/library) - [View in Browswer](https://balowulf.github.io/library/)
- [Max Garber's Solution](https://github.com/bubblebooy/Odin-Javascript/blob/master/library.html) - [View in Browswer](https://bubblebooy.github.io/Odin-Javascript/library.html)
- [Shruti Jain's Solution](https://github.com/Sjain020188/Library) - [View in Browser](https://sjain020188.github.io/Library/library.html)
- [Suulola Oluwaseyi's Solution](https://github.com/mySuulola/odin-library) - [View in Browser](https://mysuulola.github.io/odin-library/)
- [Malditagaseosa's Solution](https://github.com/malditagaseosa/library) - [View in Browser](https://malditagaseosa.github.io/library/)<br/>
- [Diana's Solution](https://github.com/dianastanciu/odin-library) - [View in Browser](https://dianastanciu.github.io/odin-library/)
- [Hammad Ahmed's Solution](https://github.com/shammadahmed/library) - [View in Browser](https://shammadahmed.github.io/library/)
- [Chris MacSwan's Solution](https://github.com/cmacswan07/my_library) - [View in Browser](https://cmacswan07.github.io/my_library)
- [Alaa's Solution](https://github.com/alaajerbi/book-library) - [View in Browser](https://alaajerbi.github.io/book-library)
- [Omid's solution](https://github.com/omid997/library-odin) - [View In Browser](https://omid997.github.io/library-odin/)
- [Luján Fernaud's solution](https://github.com/lujanfernaud/js-reading-list) - [View In Browser](http://lujanfernaud.com/js-reading-list/)
- [Javier Machin's solution](https://github.com/Javier-Machin/js-simple-library) - [View In Browser](https://javier-machin.github.io/js-simple-library/)
- [Alien's Solution](https://github.com/aliensjit/libraryOfTheCentury) - [View in Browser](https://aliensjit.github.io/libraryOfTheCentury/)
- [nmac's solution](https://github.com/nmacawile/my-library) - [Link](https://htmlpreview.github.io/?https://github.com/nmacawile/my-library/blob/master/index.html)
- [SarfrazAnjum's Solution](https://github.com/SarfrazAnjum/TOP_JS_Library) - [View in Browser]( https://sarfrazanjum.github.io/TOP_JS_Library/)
- [Nate Dimock's Solution](https://github.com/Flakari/js-library) - [View in Browser](https://flakari.github.io/js-library/)
- [leosoaivan's Solution](https://github.com/leosoaivan/js-book-library) - [View in Browser](http://leosoaivan.com/js-book-library/)
- [Qin's Solution](https://github.com/hyathynth/book_library) - [View in Browser](https://hyathynth.github.io/book_library/)
- [Johan Morin's Solution](https://github.com/MorrisMalone/myLibrary) - [View in Browser](https://morrismalone.github.io/myLibrary/)
- [brxck's Solution](https://github.com/brxck/odin-library) - [View in Browser](http://brockmcelroy.com/odin-library/)
- [autumnchris's Solution](https://github.com/autumnchris/reading-list) - [View in Browser](https://autumnchris.github.io/reading-list)
- [theghall's solution](https://github.com/theghall/odin-library) - [View in Browser](https://theghall.github.io/odin-library/)
- [mindovermiles262's solution](https://github.com/mindovermiles262/odin-library) - [View in Browser](https://mindovermiles262.github.io/odin-library/)
- [Rade's Solution](https://github.com/fukifuki/library) - [View in Browser](https://fukifuki.github.io/library)
- [Andrew's Solution](https://github.com/andrewr224/library) - [View in Browser](https://andrewr224.github.io/library/)
- [Rob Hitt's Solution](https://github.com/robhitt/oo-book-list) - [View in Browser](https://robhitt.github.io/oo-book-list/)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/library) - [View in Browser](https://jonathanyiv.github.io/library/)
- [Jmooree30's solution](https://github.com/jmooree30/Library) - [View in browser](https://jmooree30.github.io/Library/)
- [codyloyd's solution](https://github.com/codyloyd/odin-library) - [View in browser](http://codyloyd.com/odin-library/)
- [shadowlighter's solution](https://codepen.io/shadowlighter/full/ppNpbm/) - [View in browser](https://codepen.io/shadowlighter/full/ppNpbm/)
- [ezeaspie's solution](https://github.com/ezeaspie/library-project) - [View in browser](https://ezeaspie.github.io/library-project/index.html)
- [Joseph's solution](https://github.com/pjosephraj/theodinproject-library) - [View in browser](https://pjosephraj.github.io/theodinproject-library/)
- [Moiz's solution](https://github.com/MoizHasan/JS-Library) - [View in browser](https://cdn.rawgit.com/MoizHasan/JS-Library/e0874ddd/library.html)
- [asasmith's solution](https://github.com/asasmith/libraryApp) - [View in browser](https://asasmith.github.io/libraryApp/)
- [Sumit's Solution](https://codepen.io/DCWorld/pen/NyNvRw) - [View in browser](https://codepen.io/DCWorld/full/NyNvRw/)
- [Caner Sezgin's Solution](https://github.com/casedo/myLibrary) - [View in browser](http://bit.ly/myLibr)
- [Alan's Solution](https://github.com/18alantom/top_library) - [View in browser](https://18alantom.github.io/top_library/)
- [Katineto's Solution](https://github.com/Katineto/reading-list) - [View in browser](https://reading-list-da983.firebaseapp.com/)
- [Mike Smith's Solution](https://github.com/MikeSS281986/Library) - [View in browser](https://mikess281986.github.io/Library/)
- [sampsonmao's Solution](https://github.com/sampsonmao/library) - [View in browser](https://sampsonmao.github.io/library/)
- [Uy Bình's Solution](https://github.com/uybinh/odin-js-library) - [View in browser](https://uybinh.github.io/odin-js-library/)
- [Punnadittr's Solution](https://github.com/punnadittr/library) - [View in browser](https://punnadittr.github.io/library/index.html/)
- [Sava's Solution](https://github.com/SavaVuckovic/Library-App)
- [Francisco Carlos's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/library) - [View in browser](https://htmlpreview.github.io/?https://github.com/fcarlosdev/the_odin_project/blob/master/library/index.html)
- [Kyouyatamax Solution](https://github.com/kyouyatamax/jsLibraryOdinProject) - [View in browser](https://kyouyatamax.github.io/jsLibraryOdinProject/)
- [MPalhidai's Solution](https://github.com/MPalhidai/Library) - [View in browser](https://www.michaelpalhidai.com/Library/)
- [aznafro's Solution](https://github.com/aznafro/library) - [View in browser](https://aznafro.github.io/library/)
- [Areeba's Solution](https://github.com/AREEBAISHTIAQ/project-library) - [View in browser](https://areebaishtiaq.github.io/project-library/)
- [Khalal's Solution](https://github.com/khalalw/Odin/tree/master/javascript/library) - [View in browser](https://khalalw.github.io/Odin/javascript/library/index.html)
- [Taylor J's Solution](https://github.com/taylorjohannsen/library) - [View in browser](https://taylorjohannsen.github.io/library/)
- [Halkim44's Solution](https://github.com/halkim44/myLibrary) - [online ver](https://halkim44.github.io/myLibrary/)
- [Enravel's Solution](https://github.com/Enravel/Library-Project)
- [Valentino Valenti's Solution](https://github.com/1ba1/library-app) - [View in browser](https://1ba1.github.io/library-app/)
- [tnharvey's Solution](https://github.com/tnharvey/library) - [View in browser](https://tnharvey.github.io/library/)
- [Ubaid Manzoor Wani](https://github.com/Ubaid-Manzoor/Book-Manager) - [View in Browser](https://ubaid-manzoor.github.io/Book-Manager/)
- [Brendaneus' Solution](https://github.com/Brendaneus/the_odin_project/tree/master/javascript/library)
