
## Using AJAX to Talk to Your Server

Callbacks are very useful for things like browser events but they're essential when using AJAX (Asynchronous JSON and XML), which sends data (or a request for data) to your server backend without blocking the browser from doing other activities while you wait for a response.  You pass the AJAX function a callback and, when the server response is received, you will activate the callback with whatever has been returned and continue on your way.  

The best part of AJAX is that it doesn't actually require a full page refresh like clicking a hyperlink or a normal form submission would.  The response you get back from the server is simply a JSON data package and not a full HTML document, so you will be able to process it inside your existing page.  That gives you all kinds of power to build apps that only require a single page (which changes content based on where you "navigate" and what data gets returned) and to hide slow network operations from your user by loading the page in pieces.

### Points to Ponder

* What is AJAX?
* What is JSON?
* What does a JSON response actually look like?
* How do you use the basic Javascript AJAX method?
* How do you use jQuery's AJAX method(s)?
* What are the AJAX "convenience" methods good for (e.g. `$.post`)?
* How do you format data to be sent to the server?
* What is the `#serialize` method?
* How do you process data that is sent back from the server?
* How do you handle errors generated during the process?
* How can you use events to "listen" for AJAX operations, for instance if you wanted to create a "loading..." notification that disappears when you're done loading?

### Links

* [AJAX from learn.jquery.com](http://learn.jquery.com/ajax)
* [jQuery's AJAX methods](http://learn.jquery.com/ajax/jquery-ajax-methods/)
* [Submitting a Form as an AJAX Request using jQuery by Matt Lunn](http://www.mattlunn.me.uk/blog/2012/10/submitting-a-form-as-an-ajax-request-using-jquery/)
* [Some Things You Should Know About AJAX (2010) from Smashing Magazine](http://coding.smashingmagazine.com/2010/02/10/some-things-you-should-know-about-ajax/) goes into both the code and the principles of using AJAX.
* [jQuery's Global AJAX Event Handlers docs](http://api.jquery.com/category/ajax/global-ajax-event-handlers/)

### Additional Resources

* [AJAX Loading Icons](http://www.ajaxload.info/) (for fun)
* [HTML5's FormData Object by Matt Lunn](http://www.mattlunn.me.uk/blog/2012/05/sending-formdata-with-jquery-ajax/)
* [Easier AJAX With the HTML5 FormData Interface by Craig Buckler](http://www.sitepoint.com/easier-ajax-html5-formdata-interface/)
