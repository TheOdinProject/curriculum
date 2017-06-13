A major question all CSS-ers have again and again is "how can I get this stupid element where exactly on the page I want it to go!?!?!".  Usually, the answer lies in using floats and/or position attributes in combination with margins.  You'll need to develop a mental model for what's happening on the page when you float elements and when you use the different positioning types.  
Pay particular attention to which element acts as the parent of the element you're messing with -- there are some rules about that which get a bit confusing and can cause hair-pulling frustration.  If you absolutely position an element inside an absolutely positioned element, where does the first element go?

### Points to Ponder

* What is the DOM?
* How do elements get placed in the DOM by default?
* How can you override element positioning using the `position` attribute?
* When are you able to use the `top` `left` `right` and `bottom` attributes?
* What is the difference between `float` and `position`?
* Which element acts as the parent for a floated element?
* What is the difference between floating right and floating left?
* If you have a bunch of elements floated next to each other and you make the browser narrower, what happens?
* What's the practical difference between relative and absolute positioning?
* Which element acts as the parent for an absolutely or relatively positioned element?
* How would you set up a grid of 20x20 boxes on the page using floats?  Using lists?
* What are negative margins useful for?

### Your Assignment

1. Read [CSS Floats 101 from A List Apart](http://alistapart.com/article/css-floats-101)
2. Read [CSS Positioning 101 from A List Apart](http://alistapart.com/article/css-positioning-101)
3. Play around with the [Positioning Tutorial / Widget from BarelyFitz Designs](http://www.barelyfitz.com/screencast/html-training/css/positioning/) to see the differences between different positioning schemes.

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

* [Absolute Horizontal and Vertical Positioning in CSS from Smashing Magazine](http://coding.smashingmagazine.com/2013/08/09/absolute-horizontal-vertical-centering-css/) is a great resource for when you begin worrying about the finer details of positioning elements.
* [CSS Float docs](http://www.w3schools.com/css/css_float.asp)
* [CSS Position docs](http://www.w3schools.com/css/css_positioning.asp)
