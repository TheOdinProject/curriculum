# Project: Infinite Scroll and Submitting a Form with AJAX
  
Because we haven't yet linked your front end projects to your back end Rails APIs, in this project you'll get a chance to set up a front end form but submit to an existing API on the internet called the [Open Movie Database (OMDB)](http://www.omdbapi.com/))(modeled after [IMDB](http://www.imdb.com)). Read through the OMDB documentation before getting started so you have an idea of how you might submit a new movie entry.


## Your Task -- NOTE: The OMDB submission functionality is unavailable, we're figuring out a solution to that.  Until then, go to Part II, which involves pulling from the existing data instead.

Create a form which will submit a new movie to the database.  You should validate that the title and other required attributes are not blank.

1. Set up a Github Repo for this project.  Follow the instructions atop the [Google Homepage project](/web-development-101/html-css) if you need help.
1. Set up a blank HTML document
1. Think about how you will need to set up the form and then how that form will submit to the OMDB API.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
2. Write the simple form elements.  Don't worry about styling them.
3. Build the validation logic.
4. Make the form actually submit a movie to the database.
4. Create a "loading..." status while AJAX is processing and which disappears after the AJAX call has finished.
5. Play around with this form

## Part II: Infinite Scroll

5. Once you have successfully submitted a new movie to the database, let's grab a whole bunch of movies and display them.  Remove the form from the page with jQuery and then make another AJAX call to the database to retrieve and display 10 movies on your page. 
6. Create an infinite scroll that loads another 10 movies and adds them to the bottom every time you scroll down to the bottom of the page.  Your "loading..." icon should come into play here too while waiting for the next batch of movies to be added.
7. Play around with this new scroll.  What breaks it?
8. Push your solution to Github and include it below.


## Student Solutions

*Submit a link below to the github repo with your files in it by using a pull request.  See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.  Please include your partner's github handle somewhere in the description if you had one and they would like attribution.*

* [Donald's solution](https://github.com/donaldali/odin-js-jquery/tree/master/ajax_infinite_scroll) | [View in browser (*most images not shown*)](http://htmlpreview.github.io/?https://github.com/donaldali/odin-js-jquery/blob/master/ajax_infinite_scroll/index.html)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* *Add some!*
