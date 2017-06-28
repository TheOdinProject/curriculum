We'll take a break from games to build something that you'll probably create in the real world at some point -- a simple image carousel / slider which cycles through some preloaded images.  See the one on [eriktrautman.com](http://www.eriktrautman.com) for the general idea. [jssor.com](http://www.jssor.com/) also has one, though yours will not contain any of those fancy transitions.  

Though it may seem a bit simple initially, this project will probably make you scratch your head a bit and that's good -- it's a very relevant real-world example of a feature you might be asked to build and you'll have to think your way through to the solution.

### Your Task

Create a simple image carousel site.  It should contain arrows on each side to advance the image forward or backwards.  It should automatically move forward every 5 seconds.  It should contain the little navigation circles at the bottom that indicate which slide you are on (and they should be click-able to advance to that particular slide).  

Don't spend too much time worrying about getting your images to display at the correct size -- it's more important to get the slider sliding.

1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) if you need help.
1. Set up a blank HTML document
1. Think about how you would set up the different elements within the site.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
2. Build the static HTML for the carousel.
3. Set up a very wide div which will contain the individual "slides" of each image.  By appropriately positioning that div inside a container div (which acts like a picture frame), you can choose which slide is visible at any given time.
4. Once you have the slider positioned properly, build functions for "next" and "previous" which will advance to the next or previous slide accordingly.  Make the transitions smooth using simple effects.
5. Set up arrow buttons which activate those functions and play with cycling through the images.
6. Add in some navigation dots at the bottom of the slides.  Make a horizontal series of empty circles with CSS immediately below the slideshow.  Each circle represents a slide, so whenever a new slide is activated, its corresponding circle gets filled in so you can tell where in the show you are.  Make each circle link to that particular slide, so you can click on the circle and it will jump to that slide.
7. Add a timeout which advances the slides every 5 seconds.
7. Play around with your slideshow!
8. Push the project to Github and add the link to your solution below.

#### Advanced Additions (Optional)

1. When you hover on the "next" or "previous" arrows, it should actually pop up a little tiny picture preview of the next slide's picture.  
6. Make the slides continuous. Right now, when you click "previous" at the first slide, it probably jumps right to the last slide in a very jerky fashion.  Make it so that if you click "previous" when you're at the first slide, it will go left to the last slide in your collection as if it was positioned immediately to the left of the first slide.  You should be able to continue cycling to the left by clicking the "previous" button as many times as you like and the transition will always look the same.

*This is a nifty functionality to have on your personal website!*


### Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* Add your solution below this line!
* [Thomas Gazikas's solution](https://github.com/tommyg13/odin-projects/tree/master/js_jquery/carousel) | [View in browser](https://tommyg13.github.io/odin-projects/js_jquery/carousel/)
* [jamie's solution](https://github.com/Jberczel/odin-javascript/tree/master/slider) | [View in browser](http://jsfiddle.net/Jberczel/6kS3t/)
* [Tom M's solution](https://github.com/tim5046/projectOdin/tree/master/Javascript/Slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/tim5046/projectOdin/blob/master/Javascript/Slider/index.html)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project5_4_Carousel) | [View in browser](http://htmlpreview.github.io/?https://github.com/imousterian/OdinProject/blob/master/Project5_4_Carousel/index.html)
* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/image_carousel) | [View in browser](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/image_carousel/index.html "Image Carousel/Slider")
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_06-JavaScript_and_jQuery/slider) | [View in browser](https://rawgit.com/craftykate/odin-project/master/Chapter_06-JavaScript_and_jQuery/slider/index.html)
* [Jason Matthews' solution](https://jsfiddle.net/31wtcf4a/4/)
* [Ryan Jordan's solution](https://github.com/krjordan/odin-project/tree/master/slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/krjordan/odin-project/tree/master/slider/index.html)
* [Aleksandar Rodić's solution](https://github.com/rodic/TOP---js-assignments/tree/master/Project%20-%20Creating%20an%20Image%20Carousel%20in%20Javascript)
* [Artur Janik's solution](https://github.com/ArturJanik/TOPJS/tree/master/Project4) | [View in browser](https://htmlpreview.github.io/?https://github.com/ArturJanik/TOPJS/blob/master/Project4/index.html)
* [AtActionPark's solution](https://github.com/AtActionPark/odin_carousel_slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/AtActionPark/odin_carousel_slider/blob/master/index.html)
* [dchen71's solution](https://github.com/dchen71/odin-carousel) | [View in browser](https://rawgit.com/dchen71/odin-carousel/master/Index.html)
* [eternal's solution](https://github.com/3ternal/slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/3ternal/slider/blob/master/index.html)
* [danmakenoise's solution](https://github.com/danmakenoise/odin-js-slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/danmakenoise/odin-js-slider/blob/master/index.html)
* [Dan's solution](https://github.com/vickerdj/imageslider) | [View in browser] (http://vickerdj.github.io/imageslider/)
* [Trajanson's solution](https://github.com/Trajanson/image-carousel-js) | [View in broswer] (http://projects.trajanson.com/js-image-carousel/)
* [Cameron Kelley's solution](https://github.com/cameronjkelley/the_odin_project/tree/master/javascript/carousel) | [View in browser](https://htmlpreview.github.io/?https://github.com/cameronjkelley/the_odin_project/blob/master/javascript/carousel/carousel.html)
*  [Yoshua Elmaryono's solution](https://github.com/dotm/image_slider) | [View in browser](http://dotm.github.io/image_slider/)
*  [Luke Walker's solution](https://github.com/ubershibs/odin-js-course/tree/master/slider) | [View in browser](https://htmlpreview.github.io/?https://github.com/ubershibs/odin-js-course/blob/master/slider/index.html)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/javascript/image-carousel) | [View in browser](https://rawgit.com/cdouglass/odin-project-exercises/master/javascript/image-carousel/carousel.html)
* [Miguel Herrera's solution](https://github.com/migueloherrera/js-slider) | [View in browser](http://htmlpreview.github.io/?https://github.com/migueloherrera/js-slider/blob/master/index.html)
* [Stefan (Cyprium)'s solution](https://github.com/dev-cyprium/jquery-slider) | [View in browser](https://htmlpreview.github.io/?https://github.com/dev-cyprium/jquery-slider/blob/master/index.html)
* [David Chapman's solution](https://github.com/davidchappy/odin_training_projects/tree/master/js-carousel) | [View in browser](https://davidchappy.github.io/image-carousel/index.html)
* [Sophia Wu's solution](https://github.com/SophiaLWu/image-carousel) | [View in browser](https://sophialwu.github.io/image-carousel/)
* [Axel’s solution](https://github.com/afuh/slider) | [View in browser](https://afuh.github.io/slider/)
* [Daunenok’s solution](https://github.com/daunenok/image-carousel) | [View in browser](https://daunenok.github.io/image-carousel/)
* [Pat’s solution](https://github.com/Pat878/Image-Carousel) | [View in browser](https://pat878.github.io/Image-Carousel/)

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* ["jQuery Simple Image Slideshow Tutorial" question on SO](http://stackoverflow.com/questions/12068734/jquery-simple-image-slideshow-tutorial)
* *Add some!*
