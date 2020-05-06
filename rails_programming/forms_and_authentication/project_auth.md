### Introduction

In these projects, you'll be working to implement authentication systems so users can only access areas of a site they are authorized to.

### Project 1: Building a Twitter Clone

In this project you'll follow along to Andy Leverenz's brilliant Building a Twitter Clone screen casts. You'll be building a light weight version of Twitter and get lot of healthy experience with using Devise in the process.

### Your Task

<div class="lesson-content__panel" markdown="1">
  1. Complete [A Twitter Clone Lets Build with Ruby on Rails Part 1](https://www.youtube.com/watch?time_continue=1&v=5gUysPm64a4&feature=emb_logo)
  2. Complete [A Twitter Clone Lets Build with Ruby on Rails Part 2](https://www.youtube.com/watch?v=ZxkbFOe3lRY&t)
  3. Complete [A Twitter Clone Lets Build with Ruby on Rails Part 3](https://www.youtube.com/watch?v=V4h7-hR_WME)
</div>

### Project 2: Members Only!

In this project, you'll be building an exclusive clubhouse where your members can write embarrassing posts about non-members.  Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

If you want to add your own stylistic flourishes, consider it extra credit.

### Your Task

The projects will be less and less explicit about how to achieve their goals, since we expect you to build on your previous knowledge.  If you don't know how to do something, feel free to check back in previous lessons or projects or Google the correct way to implement it (though be careful, because that may take you deeper down the road than we intended).

If you'd like to challenge yourself, don't even follow the steps below, just go ahead and build the app!

<div class="lesson-content__panel" markdown="1">
#### Basic Setup

1. Think about and spec out how to set up your data models for this application.  You'll need users with the usual simple identification attributes like name and email and password but also some sort of indicator of their member status.  They'll need to create posts as well.
2. Create your new `members-only` Rails app and Github repo.  Update your README.
3. Add devise to your Gemfile and install it in your app using set up instructions on the devise [README](https://github.com/heartcombo/devise)

#### Authentication and Posts

Let's build those secrets!  We'll need to make sure only signed in users can see the author of each post.  We're not going to worry about editing or deleting posts.

1. Create a Post model and a Posts controller and a corresponding resource in your Routes file which allows the `[:new, :create, :index]` methods.
2. Atop your Posts Controller, use a `#before_action` to restrict access to the `#new` and `#create` methods to only users who are signed in. Create the necessary helper methods in your ApplicationController.
3. For your Posts Controller, prepare your `#new` action.
4. Write a very simple form in the `app/views/posts/new.html.erb` view which will create a new Post.
5. Make your corresponding `#create` action build a post where the foreign key for the author (e.g. `user_id`) is automatically populated based on whichever user is signed in.  Redirect to the Index view if successful.
6. Fill out the `#index` action of the PostsController and create the corresponding view.  The view should show a list of every post.
7. Now add logic in your Index view to display the author's name, but only if a user is signed in.
8. Sign in and create a few secret posts.
9. Test it out -- sign out and go to the index page.  You should see a list of the posts but no author names.  Sign in and the author names should appear.  Your secrets are safe!


</div>

### Student Solutions
Send us your solution by editing this [file](https://github.com/TheOdinProject/curriculum/blob/master/rails_programming/forms_and_authentication/project_auth.md) so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [CodingCop's Solution](https://github.com/cleve703/members-only)
* [Powei94's Solution](https://github.com/powei94/members-only) - [View in browser](https://enigmatic-headland-51358.herokuapp.com/)
* [Duarte's Solution](https://github.com/Duartemartins/auth)
* [Jose Salvador's Solution](https://github.com/Jsalvadorpp/members-only)
* [Joshua Aldridge's Solution](https://github.com/JFAldridge/members-only) - [Heroku](https://polar-mountain-42157.herokuapp.com/)
* [Leo Holanda's Solution](https://github.com/leo-holanda/members-only) - [Heroku](https://boiling-hamlet-71286.herokuapp.com/)
* [Nasser Abachi's Solution](https://github.com/abachi/clubhouse) - [Heroku](https://abachidev-clubhouse.herokuapp.com/)
* [Ian's Solution](https://github.com/IanMKesler/members-only)
* [Rudi Boshoff's Solution](https://github.com/RudiBoshoff/members-only)
* [Braxton Lemmon's solution](https://github.com/braxtonlemmon/members-only) - [Heroku](https://hidden-headland-49130.herokuapp.com/)
* [Kevin Vuong's solution](https://github.com/fffear/members_only)
* [Dennis Cope's solution](https://github.com/coped/members-only) - [View in browser](https://obscure-anchorage-03692.herokuapp.com)
* [Learnsometing's solution](https://github.com/learnsometing/Rails-members_only)
* [Simon Tharby's solution](https://github.com/jinjagit/members_only) - [View in browser](https://safe-falls-96496.herokuapp.com)
* [Jason McKee's solution](https://github.com/jttmckee/members-only)
* [prw001's solution](https://github.com/prw001/members_only)
* [Donald Coleman's solution](https://bitbucket.org/drc000/members-only/src/master/) - [View live version](https://aqueous-mesa-83253.herokuapp.com/)
* [Max Garber's solution](https://github.com/bubblebooy/members-only)
* [Btreim's solution](https://github.com/btreim/members-only)
* [0zra's solution](https://github.com/0zra/members-only)
* Roman Alenskiy's solution (Mobile-friendly) [Github](https://github.com/romalenskiy/secret_lodge) / [Heroku](https://secret-lodge.herokuapp.com/)
* [Javier Machin's solution](https://github.com/Javier-Machin/members-only)
* [theghall's solution](https://github.com/theghall/odin-members-only.git)
* [Jmooree30's solution](https://github.com/jmooree30/members_only.git) - [View in browser](https://sheltered-chamber-33561.herokuapp.com/)
* [Coconatsuki's solution](https://github.com/coconatsuki/members-only-clubhouse) - [View in browser](https://members-only-club.herokuapp.com/)
* [Clayton Sweeten's solution](https://github.com/cjsweeten101/members-only)
* [Jonathan Yiv's solution](https://github.com/JonathanYiv/members-only), [Heroku](https://hidden-bastion-41826.herokuapp.com/)
* [Nikolay Dyulgerov's solution](https://github.com/NicolayD/members-only)
* [nmac's solution](https://github.com/nmacawile/members-only) - [Heroku](https://fathomless-woodland-93412.herokuapp.com/)
* [ToTenMilan's solution](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/clubhouse) - [View in browser](https://milan-clubhouse.herokuapp.com)
* [holdercp's solution](https://github.com/holdercp/members-only) - [View in broswer](https://quiet-plateau-84678.herokuapp.com)
* [jfonz's solution](https://github.com/jfonz412/members-only) - [View in browser](https://glacial-basin-26789.herokuapp.com/posts)
* [yilmazgunalp's solution](https://github.com/yilmazgunalp/members-only)
* [Orlando's solution](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Members_only)|[View in browser](https://owmembersonly.herokuapp.com/)
* [Ayushka's solution](https://github.com/ayushkamadji/members-only)|[View in browser](https://salty-river-87868.herokuapp.com/)
* [leosoaivan's solution](https://github.com/leosoaivan/TOP_ror_members_only)
* [John Phelps's Solution](https://github.com/jphelps413/odin-rails-members-only) - [View in browser](https://jphelps413-rails-members-only.herokuapp.com/)
* [Jib's Solution](https://github.com/NuclearMachine/members-only) - [live website!](https://afternoon-brook-94094.herokuapp.com/)
* [Austin's Solution](https://github.com/CouchofTomato/members_only/tree/master/members-only)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/members_only)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/members-only) - [walkthrough](http://jberczel.github.io/members-only-walkthrough/)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Authentication)
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/members-only)
* [TomTom's solution](https://github.com/tim5046/projectOdin/tree/master/Rails/membersOnly/members-only)
* [Jonathan's solution](https://github.com/faulk49/members-only)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Gossip-Club)
* [Erithair's solution](https://github.com/N19270/members-only) - [View in browser](https://members-only.herokuapp.com/)
* [Vidul's Solution](https://github.com/viparthasarathy/members-only)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/members-only) - [View in browser](https://members-only-sample-blog.herokuapp.com)
* [Nikola Čvorović's solution](https://github.com/cvorak/members-only)
* [Jason Matthews' solution](https://github.com/fo0man/members-only)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/clubhouse)
* [Dominik Stodolny's solution](https://github.com/dstodolny/members-only)
* [Lara Finnegan's solution](https://github.com/lcf0285/members-only)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/members-only) - [View in browser](https://mysterious-tundra-4233.herokuapp.com/)
* [Frank Peelen's solution](https://github.com/FrankPeelen/members-only)
* [Jeremy Mauzy's solution](https://github.com/apositivejam/the_odin_project/tree/master/members_only)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_members_only) - [View in browser](https://serene-sands-9936.herokuapp.com/)
* [dchen71's solution](https://github.com/dchen71/members-only)
* [Matias Pan's solution](https://github.com/kriox26/members-only) - [View in browser](https://stark-dawn-4299.herokuapp.com/)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/members-only)
* [Dan Hoying's solution](https://github.com/danhoying/members_only)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/members-only)
* [Aviv Levinsky's solution](https://github.com/pugsiman/members-only) - [View in browser](https://guarded-brook-9440.herokuapp.com/)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/members-only) - [View in browser](https://sleepy-citadel-6281.herokuapp.com/)
* [Radi Totev's solution](https://github.com/raditotev/members-only)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/members-only)
* [srashidi's solution](https://github.com/srashidi/Authentication/tree/master/members-only)
* [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/members-only)
* [Scott Bobbitt's solution](https://github.com/sco-bo/members_only)
* [Max Gallant's solution](https://github.com/mcgalcode/members-only) - [View in browser](https://grapefruitonly.herokuapp.com/)
* [Miguel Herrera's solution](https://github.com/migueloherrera/members-only)
* [James Brooks's solution](https://github.com/jhbrooks/members-only) - [View in browser](https://powerful-bastion-24693.herokuapp.com/)
* [Matt Velez's solution](https://github.com/Timecrash/rails-projects/tree/master/members-only)
* [Sander Schepens's solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project8--members-only!/members-only)
* [Akshay Bharwani's solution](https://github.com/akshaybharwani/members-only)
* [Mateo Mejia's solution](https://github.com/mateomgj/rails_authentication_project) - [View in browser](https://enigmatic-reef-29029.herokuapp.com/)
* [Fabricio Carrara's solution](https://github.com/fcarrara/members-only) - [View in browser](https://members-only-rails.herokuapp.com)
* [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/members-only) - [View in browser](https://members-only-dest.herokuapp.com/)
* [Deepak's solution](https://github.com/Deepak5050/members-only.git) - [View in browser](https://dpoo-members-only.herokuapp.com/)
* [Earth35's solution](https://github.com/Earth35/members_only) - [View in browser](https://limitless-waters-94136.herokuapp.com/)
* [Shala Qweghen's solution](https://github.com/ShalaQweghen/members_only) - [View in browser](https://mysterious-reef-42520.herokuapp.com/)
* [chrisnorwood's solution](https://github.com/chrisnorwood/members-only) - [View in browser](https://members-only-top.herokuapp.com/)
* [Jiazhi Guo's solution](https://github.com/jerrykuo7727/members-only) - [View in browser](https://members-only-by-jiazhi.herokuapp.com/)
* [Amrr Bakry's solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/members_only) - [View in browser](https://dry-ravine-33949.herokuapp.com/)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/members-only) - [View in browser](https://polar-fjord-78673.herokuapp.com/)
* [Mateusz Staszczyk's solution](https://github.com/sleaz0id/members-only)
* [DV's solution](https://github.com/dvislearning/members-only) - [View in browser](https://fathomless-reef-68078.herokuapp.com/)
* [Dckwong's solution](https://github.com/dckwong/members-only) - [View in browser](https://membersonly.herokuapp.com/)
* [Sophia Wu's solution](https://github.com/SophiaLWu/members-only) - [View in browser](https://salty-mesa-44756.herokuapp.com/)
* [at0micr3d's solution](https://github.com/at0micr3d/members-only) - [View in browser](https://floating-atoll-55409.herokuapp.com/)
* [Samuel Langenfeld's solution](https://github.com/SamuelLangenfeld/members_only) - [View in browser](https://langenfeld-members-only.herokuapp.com/)
* [Tom Westerhout's solution](https://github.com/TomWesterhout/Members_only) - [View in browser](https://membersonly-170388.herokuapp.com/)
* [Luján's Fernaud solution](https://github.com/lujanfernaud/menbaa) - [View in browser](https://menbaa.herokuapp.com/)
* [Pat's solution](https://github.com/Pat878/members_only)
* [Francisco's solution](https://github.com/fcarlosdev/the_odin_project/tree/master/members-only)
* [Punnadittr's solution](https://github.com/punnadittr/members-only) - [View in browser](https://lovely-mesa-verde-62169.herokuapp.com/)
* [Uy Bình's solution](https://github.com/uybinh/member-only-odin) - [View in browser](https://member-only-summer.herokuapp.com)
* [Agon's solution](https://github.com/AgonIdrizi/members-only) - [View in browser](https://serene-hollows-13658.herokuapp.com/)
* [Areeba's solution](https://github.com/AREEBAISHTIAQ/members-only/tree/master/members-only)
* [Malaika's Solution](https://github.com/malaikaMI/Nobuddies) - [View in browser](https://powerful-savannah-46992.herokuapp.com/)
* [Jamesredux's Solution](https://github.com/Jamesredux/natter) - [View in browser](https://afternoon-coast-37994.herokuapp.com/)
* [ParamagicDev's Solution](https://github.com/ParamagicDev/clubhouse.git)
* [bchalman's Solution](https://github.com/bchalman/members-only)
* [Alex's solution](https://github.com/alexcorremans/members-only)
* [Brendaneus' solution](https://theodinprojects.live/courses/ruby-on-rails/projects/members-only)
* [Leila Alderman's solution](https://github.com/leila-alderman/members-only) - [View in Browser](https://fierce-bayou-19850.herokuapp.com/)
* [JamCry's solution](https://github.com/jamcry/members-only-app) - [View on Heroku](https://quiet-hamlet-54958.herokuapp.com/)
* [vanny96's solution](https://github.com/vanny96/clubhouse) - [View on Heroku](https://shrouded-brushlands-95445.herokuapp.com/)
* [themetar's solution (Github)](https://github.com/themetar/members-only-top) - [Live on Heroku](https://mysterious-coast-30783.herokuapp.com/)
* [Nyaga Roy's Solution](https://github.com/RoyNyaga/new_members_blog_odin)
* [Miguel Prada's Solution](https://github.com/mapra99/m-only)
* [Rey van den Berg's Solution](https://github.com/Rey810/members-only-app.git)
* [Sanyogita's Solution](https://github.com/SanyogitaPandit/ruby_on_rails/tree/master/Authentication/members-only)
</details>

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Railscasts #250 Authentication from Scratch](http://railscasts.com/episodes/250-authentication-from-scratch-revised)
* [Railscasts #274 Remember Me & Reset Password](http://railscasts.com/episodes/274-remember-me-reset-password)
