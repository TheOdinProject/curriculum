# Starter
* Pre-requisites:
  * Web Browser
  * 'Front End' interface: the integration of HTML, CSS and JS
    * Webpages from the ground up:
      * Webpages can look very plain with just hypertext markup language because it's doing its job of providing content and a means of communicating words
      * The next layer is cascading stylesheets which add colour / vibrance / excitement to the web page, in short - style
      * The last layer is javascript, it's about adding motion and a sense of activity on your web page - covered later in the coruse
  * Dispel illusions about only knowing Front End - you will need to know how to plug information in for backend material
    * Data is retrieved from the back end and then 'injected' into the webpage.
    * This is an end-goal concept but is something to keep in mind: building context is important.

# HTML
* HTML history: focus on backward compatability. This answers most of the queries people have for 'why things are named so funny'.
  * [Dive Into HTML 5]()
* Boilerplate setup for HTML to 'work' effectively:
  * `<!DOCTYPE>`
  * `<html>`
  * `<head>`
    * title
    * stylesheets
    * javascript
  * `<body>`
* Anatomy of the html elements: open and close tags, attributes
* Distinguish differences between an inline element and a block element eg you would treat a `<header>` element as a block element and a `<h1>` as an inline one - you never put block elements within inline elements unless under very special circumstances
* Embedded media
* Semantics of html - avoid divitis, show them content management systems and how html elements are usually laid out
* Nesting your tags appropriately!!

# CSS
* CSS Anatomy:
  * target, property, property value
  * specificity - must focus on classes only, NO ids.
  * introduce BEM syntax: verbose and bloated but is good for isolating css classes so there is no overlapping styling and you are certain about what you're learning
* CSS can be frustrating to learn, styling seems to break for no apparent reason:
  * Key: basic setup - always set display to block or inline block for containers, dimensions(width and height) and background color (note USE your favourite desaturated colours so your eyes don't bleed)
  * Keep classes separate and distinct - use BEM syntax for this
  * Be open for paradigm shifts: when styles don't behave as expected then your ruleset may need to accommodate new information
  * Then play around with all the other properties available
* Default values:
  * Understand that all html elements have very basic CSS applied to them: inherently and browser applied.
  * Use reset.css to disable browser-applied stylesheets
* Box Model: dimensions(width, height), margins, padding
  * Note differences about text-align and margin. This is very confusing for beginners. The former refers to elements with display: inline (including inline-block) while the latter only refers to display: block
* Positioning: clarify that this property is not about co-ordinates but about FLOW.
* Flexbox:
  * Mobile-friendly
  * Understanding how children of flexbox containers have different property options from their parents
* Frameworks:
  * Installation steps (literally just downloading the css library and plugging in the html and css as the documentation says)
  * Cumbersome in some cases - specificity is very annoying.
  * Frameworks are not a substitute for knowing how it works under the hood (ie, you should be comfortable with vanilla html and non-framework css) otherwise it will become impossible to diagnose.

# Projects
* Google Homepage
* Maintain a Jekyll blog - get used to using views, layouts, injecting code, maintaining the stylesheets and file structure to suit your purposes
