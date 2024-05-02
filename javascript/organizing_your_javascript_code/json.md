### Introduction

JSON (JavaScript Object Notation) is a standardized format for structuring data. It is heavily based on the syntax for JavaScript objects. You will often encounter JSON formatted data when working with external servers or APIs - it is essentially the universal format for transmitting data on the web.

Among the web, JSON is widely incorporated. The largest web applications deployed online make extensive use out of JSON. In fact, it is very likely that the data you read on your favorite website transmits data on the web page, by fetching data from an API call - which more than likely returns a JSON object.

There are numerous advantages to JSON, such as its compatibility with programming languages, web technologies, and with how easy it is to utilize.

JSON responses typically come from fetching the data from a RESTful API. This may sound easy and all, but without actually seeing it (and testing along the way), it may come off as hard to understand.

### Example

Say you'd like to fetch some data from the `dummyjson` RESTFul api, utilizing a particular endpoint. Within JavaScript, it is as easy as calling `fetch`, and then parsing the data as `.json()`. Additionally, if you'd like to see the content logged in your terminal, you may simply `console.log` the json data.

Example data sourced from `https://dummyjson.com`.

```
fetch('https://dummyjson.com/products/1')
.then(res => res.json())
.then(json => console.log(json)
```

Within your terminal, you would see contents similar to...:

```


    {
      "id": 1,
      "title": "iPhone 9",
      "description": "An apple mobile which is nothing like apple",
      "price": 549,
      "discountPercentage": 12.96,
      "rating": 4.69,
      "images": [
        "https://cdn.dummyjson.com/product-images/1/1.jpg",
        "https://cdn.dummyjson.com/product-images/1/2.jpg",
      ]
    }

```

Note: JSON response has been shortened.

It's as easy as that!

Additionally, if you'd like to access the title, a particular image from the array of images, or any particular data - you may simply utilize the "dot notation" (or bracketed notation) within JavaScript. An example:

```
const myTitle = json.title;
const myFirstImage = json.images[0]
const mySecondImage = json.images[1]
```

Note: If you wish to access particular data (including nested data), follow the proper dot notation (or bracket notation) with the associated key names of the object.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. This [JSON MDN tutorial](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/JSON) is likely all you need, however, there are some additional great resources.
2. Read about the 2 JavaScript methods that you'll most often be using when dealing with JSON - [JSON.parse()](https://www.w3schools.com/js/js_json_parse.asp) and [JSON.stringify()](https://www.w3schools.com/js/js_json_stringify.asp).
3. Mis-formatted JSON is a common cause of errors. This [JSON formatter website](https://jsonformatter.curiousconcept.com/) lets you paste in JSON code and will search it for formatting errors.
4. This [JSON Editor Online](https://jsoneditoronline.org/) is a simple online IDE, which provides a very clean and minimal visual aid for working with JSON data. It is similar to the above JSON formatter website, but provides as an alternative resource.
5. This [JSONPlaceHolder](https://jsonplaceholder.typicode.com/) is a free online RESTful API that provides dummy data that can be utilized for testing purposes. If you're feeling iffy with incorporating JSON data from RESTful API's, this provides as an excellent resource for starting out.

</div>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
