### Introduction

In Computer Science one of the most basic and fundamental data structures is the
linked list, which functions similarly to an array. The principal benefit of a linked
list over a conventional array is that the list elements can easily be inserted or
removed without reallocation of any other elements.

In some programming languages the size of an array is a concern and one of the ways
to overcome that problem and allow dynamically allocated data is using linked lists.

Luckily in **Ruby** arrays aren't limited to a certain size, so you don't have to think
about overcoming that limitation.

So if array size is not a limitation in Ruby, are linked lists really necessary?
The short answer to that is _no_; however, it's the simplest of the dynamic data
structures and it will give you a solid foundation, so you can understand more
complex data structures like graphs and binary trees with more ease.

### Structure of a Linked List

A _linked list_ is a linear collection of data elements called nodes that "point"
to the next node by means of a pointer.

Each node holds a single element of data and a link or pointer to the next node in the list.

A head node is the first node in the list, a tail node is the last node in the list. Below is a basic representation of a linked list:

`[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil`

For a more thorough explanation, use these resources:

1.  [Linked Lists in Plain English](https://www.youtube.com/watch?v=oiW79L8VYXk)
2.  [Linked Lists, Ruby's Missing Data Structure](https://www.sitepoint.com/rubys-missing-data-structure/)
3.  [A more verbose explanation with plenty of diagrams](http://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html)

### Assignment

<div class="lesson-content__panel" markdown="1">
  You will need two classes:

1. `LinkedList` class, which will represent the full list.
2. `Node` class, containing a `#value` method and a link to the `#next_node`, set both as `nil` by default.

Build the following methods in your linked list class:

1. `#append(value)` adds a new node containing `value` to the end of the list
2. `#prepend(value)` adds a new node containing `value` to the start of the list
3. `#size` returns the total number of nodes in the list
4. `#head` returns the first node in the list
5. `#tail` returns the last node in the list
6. `#at(index)` returns the node at the given `index`
7. `#pop` removes the last element from the list
8. `#contains?(value)` returns true if the passed in value is in the list and otherwise returns false.
9. `#find(value)` returns the index of the node containing value, or nil if not found.
10. `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    The format should be: `( value ) -> ( value ) -> ( value ) -> nil`

### Extra Credit

1. `#insert_at(value, index)` that inserts the node with the provided `value` at the given `index`
2. `#remove_at(index)` that removes the node at the given `index`. (You will need to update the links of your nodes in the list when you remove a node.)
</div>

### Student Solutions

Submit a link below to this [file](https://github.com/TheOdinProject/curriculum/blob/master/ruby_programming/computer_science/project_linked_lists.md) on the ruby course github repo with your files in it by using a pull request. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

<details markdown="block">
  <summary> Show Student Solutions </summary>

- Add your solution below this line!
- [gogvale's Solution (with extra credit)](https://github.com/gogvale/linked_list.rb/blob/master/linked_list.rb) - [View Demo](https://repl.it/@gogvale/linkedlistrb#linked_list.rb)
- [risanto's Solution (with extra credit)](https://github.com/risanto/ruby-programming/blob/master/13_linked-lists.rb)
- [Spark's Solution (with extra credit)](https://github.com/Sparking2/Ruby-Linked-Lists/blob/master/lib/main.rb)
- [Vinz'z Solution (with extra credit)](https://github.com/LrdVnz/linked_lists)
- [Evelyn's Solution](https://github.com/evive82/Odin-Project-Linked-Lists)
- [Aaron's Solution](https://github.com/Aaron-McD/linked-list)
- [Eduardo's Solution (with extra credit)](https://github.com/helloeduardo/linked_lists)
- [Chau Nguyen's Solution](https://github.com/VanQuishi/ruby_practice/blob/master/linked_list.rb)
- [ChargrilledChook's Solution](https://github.com/ChargrilledChook/linked-lists)
- [Aaron Contreras's Solution](https://github.com/aaron-contreras/linked_lists)
- [Coding Shawn's Solution](https://github.com/CodingShawn/TOP-Ruby-Linked-List)
- [Gael's Solution](https://github.com/lungla-gael/Linked-Lists)
- [BLuu's Solution](https://github.com/bryanluu/TOP_ruby/blob/master/linked_list/linked_list.rb)
- [Tilda Udufo's Solution (with extra credit)](https://github.com/TildaDares/linkedLists)
- [Darren's Solution](https://github.com/DarrenLo0530/ruby-tests/blob/master/linked_list.rb)
- [Sam Eff's Solution](https://github.com/SamEff/linked_list)
- [irlgabriel's Solution](https://github.com/irlgabriel/the-odin-project/blob/master/linked-list/linked_list.rb)
- [Kfollen93's Solution](https://github.com/Kfollen93/Linked_Lists/blob/master/linked.rb)
- [tenacious-qi's Solution](https://github.com/Tenacious-Qi/linked_list/blob/master/linked_list.rb)
- [Ichenn's Solution (with extra credit)](https://github.com/Ichenn92/ruby-function/tree/master/linked-lists)
- [andrewjh271's Solution (with extra credit)](https://github.com/andrewjh271/linked_list)
- [threeaces' Solution](https://github.com/threeaces/linked_lists_ruby_TOP/tree/master/lib)  
- [Edd Sansome's Solution (with extra credit](https://github.com/casualc0der/odin-ruby/blob/master/odin_cs/linkedlist.rb)
- [fillingthemoon's Solution (with extra credit)](https://github.com/fillingthemoon/linked-lists)
- [Loumarven's Solution (with extra credit)](https://github.com/loumarven/top_ruby_linked_lists)
- [qazaqpyn's Solution (with extra credit)](https://github.com/qazaqpyn/linkedlistruby)
- [Nick DiPreta's Solution (with extra credit)](https://github.com/NickDiPreta/-linkedlist)
- [Andrew Huntington's Solution (with extra credit)](https://github.com/AndrewHuntington/ruby_projects/tree/master/linked_lists)
- [Andrew Baldwin's Solution](https://github.com/andrewbaldwin44/Ruby_Linked_List/blob/master/bin/linked_list_demo.rb) - [View Demo](https://repl.it/@andrewbaldwin44/RubyLinkedList)
- [Christian's Solution](https://github.com/rueeazy/ruby-exercises/blob/master/linked_list.rb)
- [rryand's Solution (with extra credit)](https://github.com/rryand/ruby_linked_list/tree/master/classes)
- [Saul-Good-Homie's Solution (with XC)](https://github.com/Saul-Good-Homie/ruby-building-blocks/blob/master/linked_list.rb)
- [rlmoser's Solution](https://github.com/rlmoser99/ruby_exercises/tree/master/linked_list)
- [pudu87's Solution](https://github.com/pudu87/linked-lists)
- [Philipp's Solution (with extra credit)](https://github.com/philipp-mcvity/odin-ruby.linked_lists)
- [YesSeri's Solution](https://github.com/YesSeri/linked-list/blob/master/linked-list.rb)
- [Austin Fisher's Solution](https://github.com/Austin2016/linked_list)
- [Lucas Bide's Solution (with extra credit)](https://github.com/Lucas-Bide/linked_list)
- [DalandanJuice's Solution (with extra credit)](https://github.com/DalandanJuice/odin_cs_projects/blob/master/linked_lists/linked_lists.rb)
- [jodokusquack's Solution (with extra credit)](https://github.com/jodokusquack/ruby_linked_list)
- [Olugbade Olalekan's Solution (with extra credit)](https://github.com/gbadesimple/data_structure_linked_list)
- [Bradley's Solution (with extra credit)](https://github.com/spaceincase/odin-project-exercises/tree/master/linked_lists)
- [Billy's Solution (with extra credit)](https://github.com/bcoffin9/project_linked_list)
- [Sher's Solution (with extra credit)](https://github.com/sher-s7/linkedlist)
- [Nasser Abachi's Solution](https://github.com/abachi/theodinproject/tree/master/building-projects/linked-list)
- [Run After's Solution](https://github.com/run-after/curriculum/blob/master/ruby_programming/computer_science/project_linked_lists.md)
- [Robin's Solution](https://github.com/CoolGlasses/linked_list/blob/master/linked_list.rb)
- [Uzay-G's Solution](https://github.com/Uzay-G/ruby_exercises/blob/master/linked_list.rb)
- [Rafe Draper's Solution](https://github.com/rafeDraper/ruby_exercises/tree/master/linked_lists)
- [Nikolas Broman's Solution](https://github.com/nikolasbroman/linked_list)
- [Ian's Solution (with extra credit)](https://github.com/IanMKesler/linked_list)
- [Andrija Jelenkovic's Solution (with extra credit)](https://github.com/Amdrija/ruby-practice)
- [Chris' Solution (with extra credit)](https://github.com/CSalois114/project_linked_list/blob/master/linked_list.rb)
- [Jose Salvador's Solution (with extra credit)](https://github.com/Jsalvadorpp/Ruby-Data-Structures/blob/master/linkedLists.rb)
- [Alain Suarez's Solution (with extra credit)](https://gitlab.com/asuar/ruby-linkedlist)
- [Jay Burbyga's Solution (with extra credit)](https://github.com/Jaybur1/ruby_exercises/blob/master/linked_list/linked_list.rb)
- [JFAldridge's Solution (with extra credit)](https://github.com/JFAldridge/ruby_linked_list)
- [Leonardo Vega's Solution (with extra credit)](https://github.com/leonardovega/ruby_programming/blob/master/computer_science/project_linked_lists.rb)
- [BShowen's Solution (with extra credit)](https://github.com/BShowen/Linked_list_in_Ruby)
- [Arilson Souza Solution](https://github.com/arilsonsouza/the_odin_project/blob/master/ruby/project_linked_lists/linked_list.rb)
- [Vollantre's Solution](https://github.com/vollantre/linked_list/blob/master/linked_list.rb)
- [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/linked_lists)
- [Kevin Vuong's Solution](https://github.com/fffear/linked_lists)
- [Nicolas Espinoza's Solution](https://github.com/nicospz/linked_lists)
- [Rudi Boshoff's Solution](https://github.com/RudiBoshoff/linked-list)
- [Learnsometing's Solution w/extras](https://github.com/learnsometing/TOP-ruby-projects/tree/master/ruby/computer-science/linked-list)
- [Simon Tharby's Solution](https://github.com/jinjagit/linked_list/blob/master/linked.rb)
- [Chris Wegscheid's Solution](https://github.com/cwegscheid08/linked_list)
- [Smetanca52's Solution](https://github.com/Smetanca52/ruby_exercices/blob/master/linked_lists.rb)
- [Stefano Merazzi's Solution (w/ extra)](https://github.com/ste001/ruby-exercises/blob/master/computer_science/linked_lists.rb)
- [Dreniak's Solution](https://github.com/Dreniak/linked_list/blob/master/linkedlist.rb)
- [Mohamed Elattar's Solution](https://github.com/mohamed-elattar/linked-list)
- [brendan tang's Solution](https://github.com/brndntng/linked_list)
- [prw001's Solution](https://github.com/prw001/linked_list)
- [Max Garber's Solution](https://github.com/bubblebooy/miscellaneous-exercises/blob/master/Linked%20List.rb)
- [Malaika (Mic) Solution](https://github.com/malaikaMI/Link_list)
- [Sherman Bowling's Solution](https://github.com/janus0/top_course_work/tree/master/ruby/project_linked_list)
- [Nathan Sherburne's Solution](https://github.com/nathansherburne/ruby_practice/blob/master/data_structures/linked_list.rb)
- [Javier Machin's Solution](https://github.com/Javier-Machin/Linked_list/blob/master/linked_list.rb)
- [Btreim's Solution](https://github.com/btreim/ruby/blob/master/linked_list.rb)
- [0zra's Solution](https://github.com/0zra/linkedlist/blob/master/linkedlist.rb)
- [Demo318's Solution (with extra credit)](https://github.com/Demo318/ruby_linked_lists)
- [mtizim's Solution (with extra credit)](https://github.com/mtizim/odin_projects/blob/master/ruby/linkedlists.rb)
- [Isil Donmez's Solution](https://github.com/isildonmez/linked_lists/blob/master/linked_lists.rb)
- [Bruno Parga's Solution](https://github.com/brunoparga/odinproject/blob/master/Ruby/linkedlist.rb)
- [Jmooree30's Solution](https://github.com/jmooree30/Linked-list.git)
- [Andrew's Solution](https://github.com/andrewr224/Linked-Lists)
- [Jason McKee's Solution](https://github.com/jttmckee/odin-project-ruby/tree/master/LinkedList)
- [Jonathan Yiv's Solution](https://github.com/JonathanYiv/linked_list)
- [Roland Studer's Solution](https://github.com/RolandStuder/odin_project_Solutions/tree/master/linked_lists)
- [justinckim3's Solution](https://github.com/justinckim3/linked_list/blob/master/linked_list.rb)
- [Kasey Z's Solution (with extra credit)](https://github.com/kasey-z/TOP-Solutions/blob/master/linked_lists/linked_lists.rb)
- [thisisned's Solution](https://github.com/thisisned/linked_list/blob/master/linked_list.rb)
- [SadieD's Solution](https://github.com/SadieD/linked_lists)
- [Clayton Sweeten's Solution](https://github.com/cjsweeten101/OdinProjects/tree/master/linked_list)
- [holdercp's Solution](https://github.com/holdercp/linked_lists)
- [Webdev-burd's Solution](https://github.com/webdev-burd/linked_list)
- [Jfonz412's Solution](https://github.com/jfonz412/computer_science/blob/master/linked_lists.rb)
- [xavier Solution (+ extra)](https://github.com/nxdf2015/odin-linked-lists/blob/master/linked_list.rb)
- [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/linked_lists)
- [Oleh Sliusar's Solution](https://github.com/OlehSliusar/linked_lists)
- [Nikolay Dyulgerov's Solution](https://github.com/NicolayD/ruby-data-structures/blob/master/linked_list.rb)
- [mindovermiles262's Solution](https://github.com/mindovermiles262/linked-list)
- [theghall's Solution](https://github.com/theghall/linked-list.git)
- [yilmazgunalp's Solution with extra](https://github.com/yilmazgunalp/linked_list)
- [Ayushka's Solution](https://github.com/ayushkamadji/ruby_linked_list/blob/master/lib/LinkedList.rb)
- [ToTenMilan's Solution with extra](https://github.com/ToTenMilan/the_odin_project/tree/master/ruby/linked_list)
- [Raiko's Solution (with extra credit)](https://github.com/Cypher0/linked_lists/blob/master/linked_list.rb)
- [Nicolas Amaya's Solution (with extra)](https://github.com/nicoasp/TOP---Ruby-Linked-Lists)
- [nmac's Solution](https://github.com/nmacawile/LinkedList)
- [John Phelps's Solution (+extra)](https://github.com/jphelps413/odin-ruby/blob/master/linked-lists/linked_list.rb)
- [Jib's Solution (with extra credit)](https://github.com/NuclearMachine/OdinTasks/tree/master/LinkedLists)
- [Stefan (Cyprium)'s Solution](https://github.com/dev-cyprium/linked-lists-ruby/)
- [Cody Loyd's Solution (with tests and extra credit)](https://github.com/codyloyd/linked_list)
- [Miguel Herrera's Solution](https://github.com/migueloherrera/linked-lists)
- [KrakenHH's Solution](https://github.com/KrakenHH/ruby/tree/master/algorithms/linked_list)
- [Shala Qweghen's Solution](https://github.com/ShalaQweghen/linked_list)
- [John Connor's Solution](https://github.com/jacgitcz/linked_list)
- [Earth35's Solution](https://github.com/Earth35/linked-list/blob/master/linked_list.rb)
- [Oscar Y.'s Solution](https://github.com/mysteryihs/ruby_projects/blob/master/linked_list.rb)
- [Amrr Bakry's Solution - with extra credit](https://github.com/Amrrbakry/learning_ruby/blob/master/LinkedList/linked_list.rb)
- [Jean Merlet's Solution](https://github.com/jeanmerlet/ruby_misc/blob/master/data_structures/linked_list.rb)
- [Manu Phatak's HIGH ENERGY Solution](https://github.com/bionikspoon/ruby_linked_list)
- [fugumagu's Solution with extra credit](https://github.com/fugumagu/the_odin_project/tree/master/linked_list)
- [Sasho's Solution /w extra credit](https://github.com/sashoa/the-odin-project/tree/master/project-linked-lists)
- [Austin's Solution with extra credit](https://github.com/CouchofTomato/algorithm/blob/master/linked_list.rb)
- [Jiazhi Guo's Solution (with extra credit)](https://github.com/jerrykuo7727/linked_lists)
- [Dan Hoying's Solution (with extra credit)](https://github.com/danhoying/linked_lists)
- [Chris Chambers' Solution (with extra credit)](https://github.com/chrisgchambers/ruby_exercies/blob/master/linked_list/linked_list.rb)
- [Jorrit Luimers' (Voodoo Woodoo) Solution](https://github.com/voodoowoodoo/ruby_linked_lists)
- [Francisco Carlos's Solution (with extra credit)](https://github.com/fcarlosdev/the_odin_project/tree/master/linked_lists)
- [Loris Aranda's Solution (with extra credit)](https://github.com/LorisProg/ruby-linked_lists)
- [at0micr3d's Solution (with extra credit)](https://github.com/at0micr3d/linked_list)
- [Eric M's Solution (with extra credit)](https://github.com/em77/linked_list)
- [Clint's Solution (extra cred)](https://github.com/tholymap/OdinLinkedList)
- [Dylan's Solution (with extra credit)](https://github.com/resputin/the_odin_project/blob/master/Ruby/linklist/linklist.rb)
- [David Chapman's Solution (with extra credit)](https://github.com/davidchappy/odin_training_projects/tree/master/linked_lists)
- [Leonard Soai-Van Solution](https://github.com/leosoaivan/TOP_compsci)
- [Anthony Vumbaca's Solution (with extra credit)](https://github.com/tvumbaca/linked_lists/blob/master/linked_list.rb)
- [Jerry Gao's tryhard Solution](https://github.com/blackwright/odin/tree/master/ruby_linked_list)
- [Marcus' Solution (with extra credit)](https://github.com/nestcx/odin_comp_sci/blob/master/linked_list.rb)
- [Mateusz Staszczyk's](https://github.com/sleaz0id/LinkedList)
- [Sophia Wu's Solution (with extra credit)](https://github.com/SophiaLWu/project-linked-lists)
- [Samuel Langenfeld's Solution](https://github.com/SamuelLangenfeld/linked_list)
- [Braydon Pacheco's Solution](https://github.com/pacheeko/linked_lists/blob/master/linked_lists.rb)
- [Robert Szabo's Solution](https://github.com/Siker001/the_odin_project_exercises/blob/master/ruby/linked_lists/linked_list.rb)
- [jeff1st's Solution](https://github.com/jeff1st/linked_list)
- [Noah Prescott's Solution](https://github.com/npresco/top/tree/master/linked_list)
- [Cody Buffaloe's Solution](https://github.com/CodyLBuffaloe/Linked_Lists)
- [Daniel Varcas aka d-zer0's Solution](https://github.com/d-zer0/linked_list/blob/master/linked_list.rb)
- [Zach Beaird's Solution (with extra credit)](https://github.com/zbbeaird89/Linked-List)
- [EMuchynski's Solution](https://github.com/EMuchynski/linked_lists)
- [Luján Fernaud's Solution](https://github.com/lujanfernaud/ruby-linked-list)
- [Jason Dancocks' Solution](https://github.com/JasonDancocks/Ruby/tree/master/linkedlists)
- [Anistor86's Solution](https://github.com/anistor86/linked_list)
- [James Redux's Solution](https://github.com/Jamesredux/linked_list)
- [Oliver Curting's Solution (with extra credit)](https://github.com/Curting/linked_lists)
- [Alex's Solution](https://github.com/alexcorremans/linked_list)
- [HSaad's Solution](https://github.com/HSaad/linked-lists)
- [Scott McKell's Solution](https://github.com/zottwickel/linked_list.git)
- [Punnadittr's Solution](https://github.com/punnadittr/linked_list/blob/master/linked_lists.rb)
- [Agon Idrizi's Solution](https://github.com/AgonIdrizi/Recursion/blob/master/linked_list.rb)
- [Areeba's Solution](https://github.com/AREEBAISHTIAQ/LinkedLists/blob/master/linkedlist.rb)
- [dmarkiewicz's Solution](https://github.com/dmarkiewicz/the-odin-project/tree/master/Ruby/Linked-list)
- [Felipe Parreira's Solution](https://github.com/FelipeParreira/TheOdinProject/blob/master/ruby-programming/a-bit-of-CS/linked_lists/linked-list.rb)
- [mojotron's Solution](https://github.com/mojotron/linked-lists/blob/master/linked_list_class.rb)
- [Tommy's Solution](https://github.com/hoangtommy/linkedLists/blob/master/LinkedList.rb)
- [Emil Dimitrov's Solution](https://github.com/imemdm/linked_list)
- [EdwardHeath's Solution (with extra credit)](https://github.com/EdwardHeath/linked_list/tree/master)
- [Leila Alderman's Solution](https://github.com/leila-alderman/TOP_ruby_exercises/tree/master/08_linked_list)
- [Vitaly Osipov's Solution](https://github.com/vi7ali/ruby-practice/tree/master/linked-list)
- [vanny96's Solution](https://github.com/vanny96/linked_lists)
- [JamCry's Solution](https://github.com/jamcry/ruby-advanced-exercises/blob/master/linked_lists.rb)
- [Wesley Wang's Solution (with extra credit)](https://github.com/wesleymellon/linked-list-structure)
- [Alex Krewson's Solution (with extra credit)](https://github.com/alexkrewson/linked_lists)
- [Rey van den Berg's Solution (with extra credit)](https://github.com/Rey810/Linked-List-Data-Structure-)
- [Sergej Jurchenko's Solution (with extra credit)](https://github.com/Sergyurch/linked_list/blob/master/linked_list.rb)
- [Han Josmer's Solution (with extra credit)](https://github.com/HanJosmer/ruby_programming/blob/master/linked_lists/linked_lists.rb)
- [Robert Dunbar's Solution (with extra credit)](https://github.com/RobertDunbar/ruby-linked-list)
- [Ben Fowler's Solution (with extra credit)](https://github.com/benfowler04/ruby-cs/blob/master/linked_list.rb)
- [Bendee48's Solution (with extra credit)](https://github.com/bendee48/Data-Structures/blob/master/linked_lists.rb)
- [Ray Alvarez's Solution (with extra credit)](https://github.com/ray-alvarez/linkedlists)
- [Brett Bonnet's Solution (with extra credit)](https://github.com/Brett-Bonnet/linked_lists)
- [Adriel Bruno's Solution (with extra credit)](https://github.com/AdrielTrigger/Ruby-Linked-List/blob/master/linked_list.rb)
- [Toberoni's Solution (with extra credit)](https://github.com/toberoni/the_odin_project/tree/master/ruby_programming/linked_lists)
- [guacamobley's Solution](https://github.com/guacamobley/linked-list)
- [Robert Suazo's Solution](https://github.com/rsuazo/linked_lists/blob/master/linked_lists.rb)
- [Ranon Martin's Solution (with extra credit)](https://github.com/ranonm/TheOdinProjectExercises/tree/master/linked_list)
- [unheavenlycreature's Solution (with extra credit)](https://github.com/unheavenlycreature/linkedlist)
- [hyperturing's Solution (with extra credit)](https://github.com/hyperturing/linked-list)
- [Rob Dulabon's Solution](https://github.com/RDulabon/linked_list)
- [Timework's Solution (with extra credit)](https://github.com/Timework/linkedList/blob/master/list.rb)
- [Cinthia's Solution (with extra credit)](https://github.com/cinthiagodoi/linked-lists)
- [Matt M's Solution (with extra credit)](https://github.com/MattMiller1989/Linked-List)
- [Michael K's Solution](https://github.com/a0x77ry/odin/tree/master/ruby-exercises/linked_list)
- [Cameron St. Amant's Solution](https://github.com/CameronStAmant/The_Odin_Project/blob/master/Ruby_projects/Linked_lists/LinkedList.rb)
- [Kenneth Holston's Solution](https://github.com/kholston/linked_list)
- [AnsellMaximilian's Solution (with extra credit)](https://github.com/AnsellMaximilian/OOP-Ruby/blob/master/linked_list.rb)
- [fussykyloren's Solution (with extra credit)](https://github.com/fussykyloren/ruby-linked-list)
- [ttzv's Solution (with extra credit)](https://github.com/ttzv-training-repos/ruby_cs_projects)
- [Rémi Borfigat’s Solution](https://github.com/remiborfigat/linked_lists)
- [Sandy's Solution (with extra credit)](https://github.com/kuosandys/top-ruby-assignments/blob/master/linked_lists.rb)
- [mpiriya's Solution (with extra credit)](https://github.com/mpiriya/ruby/blob/master/linked_list.rb)
- [Chow Jia Ying's solution](https://github.com/C-likethis123/ruby_odin_project/tree/master/linked_list)
- [Adam's Solution (with extra credit)](https://github.com/abohannon/ruby-sandbox/blob/master/exercises/linked_list.rb)
- [msespos's Solution (with extra credit)](https://github.com/msespos/linked-list/blob/master/main.rb)
- [Chonf's Solution (with extra credit)](https://github.com/NotAProgrammerdork/Ruby/blob/master/linked_list.rb)
- [sforber's Solution (with extra credit)](https://github.com/sforber/ruby-linkedlists/blob/master/linkedlists.rb)
- [jding's Solution](https://github.com/Jding9/ruby_linked_list/blob/master/linked_list.rb)
- [bhenning83's Solution (with extra credit)](https://github.com/bhenning83/linked_list/blob/master/linked_list.rb)
  </details>
