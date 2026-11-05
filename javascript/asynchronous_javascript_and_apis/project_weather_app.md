### Introduction

Use everything we've been discussing to create a weather forecast site. You should be able to search for a specific location and toggle displaying the data in Fahrenheit or Celsius.

You should change the look of the page based on the data, maybe by changing the color of the background or by adding images that describe the weather. Feel free to use promises or async/await in your code, though you should try to become comfortable with both.

### Assignment

<div class="lesson-content__panel" markdown="1">

Use the [Visual Crossing Weather API](https://www.visualcrossing.com/weather-api/) for this project. Fortunately, it does not require signing up nor does it require an API key; free users get up to 1000 queries per day. For specifics on usage, refer to their API documentation. Feel free to play around with their [query builder](https://www.visualcrossing.com/weather-query-builder/) tool as well (as of writing, the query builder provides URLs with an API key field, but this can be omitted). As with many free APIs, check their documentation for attribution requirements/instructions.

1. Set up a blank HTML document with the appropriate links to your JavaScript and CSS files.
1. Write the functions that hit the API. You're going to want functions that can take a location and return the weather data for that location. For now, just `console.log()` the information.
1. Write the functions that *process* the JSON data you're getting from the API and return an object with only the data you require for your app.
1. Set up a form that will let users input their location and will fetch the weather info (still just `console.log()` it).
1. Display the information on your webpage with a toggle to show the temperature data in Fahrenheit or Celsius.
   - While you don't have to, if you wish to display weather icons then there can be a lot of them to import, so have a look at [dynamic imports](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/import). Unlike plain template strings without an import, [Webpack can read dynamic imports](https://webpack.js.org/api/module-methods/#dynamic-expressions-in-import) and still bundle all the relevant assets.
1. Add any styling you like!
1. Optional: add a 'loading' component that displays from the time the form is submitted until the information comes back from the API. Use DevTools to simulate network speeds.
1. Push that baby to GitHub and share your solution below!

</div>
