 - We can (and should) cover and use `fetch()`.. and now would be a good time to discuss polyfills.
 - These don't show up in the current curriculum until _way_ later.. but I propose that most modern WebDev relies quite heavily on the concept of APIs, and for some reason, they're considered to be a somewhat scary topic.
- We should also talk a bit about async here because AJAX methods are by definition going to be asyncronous.
- there are lots of good APIs we could tap into to use for this assignment, but we should probably pick a relatively simple one.. examples:
  - curated list of open APIs : [HERE](https://github.com/abhishekbanthia/Public-APIs?utm_source=SitePoint&utm_medium=email&utm_campaign=Versioning)
E)
  - Open Movie DB
  - Weather api: Darkskynet has a great api and their plans are free for small scale applications.
  - StockPicker: Quandl is great for beginners who want to use financial information.

One of the most powerful things a web developer can do is fetch some data from a server somewhere and then display it creatively on their site.  In many cases the server is one that exists only for that specific site, it could contain blog posts, user data, high scores for a game or anything else.  In other cases, the server is an open service that serves data to anyone that wants to use it, for example weather data or stock prices.  In either case, the methods of accessing and then using that data are essentially the same.

## APIs

Servers that are created for serving data for external use (in websites or apps or whatever) are often referred to as `API`s or ['Application Programming Interfaces'](https://www.youtube.com/watch?v=s7wmiS2mSXY).

There are multiple ways of requesting data from an API, but all of them do basically the same thing. For the most part, APIs are accessed through URLs, and the specifics of how to query these URLs changes based on the specific service you are using.  For example, the OpenWeatherMap API has several different types of data that you can request.  To get the current weather in a specific location you need to request data from this url:
```
api.openweathermap.org/data/2.5/weather?q=London,uk
```
obviously switching out the city for the location you're requesting.  The specifics for using any API are usually documented on the service's website. [Check here for the documentation for the current weather API](https://openweathermap.org/current).

If you haven't already, go ahead and paste the weather URL above into your browser... (We'll wait).

Unless the implementation of that specific API has changed, you probably got an error like this:
```
{"cod":401, "message": "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."}
```
which brings us to another point about APIs.  In most cases you have to sign up and get an API key to use them. Obtaining the API key is as simple as signing up on their website and using it is usually as easy as pasting it into the url:
```
http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=1111111111
```
(exactly how to include the key changes from service to service)

Services like the openweathermap use API keys to track who is requesting the data they serve, and how much data they are requesting.  The reason they do this is so that people can't take advantage of their service. Running servers, especially large ones costs money, and while each current weather request (or whatever) is relatively cheap, if the amount of requests gets too high the cost could be significant.  Imagine using that API to create an amazing weather app that gets used all over the world... you could easily have thousands of people accessing that data every minute!

By signing up for a service and getting an API key you are letting the service track just how much you are actually using it.  In many cases services are limited as to how much data they can request for free.  With the weather app example, their free plan only allows you to make 60 requests per minute and also limits what types of data you can access ([details here if you're interested](https://openweathermap.org/price)) so you would almost definitely need to pay for a better account if your app became successful.

Luckily for us, for the most part our apps are only going to be used by us and people that view our portfolios, so we'll get by _just fine_ with free services.

Once you get a key (try this now if you like!) you can paste the url into the browser again (including your key of course) and hopefully, you'll see a proper response:

```JSON
{"coord":{"lon":-77.73,"lat":38.77},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":75.74,"pressure":1017,"humidity":57,"temp_min":71.6,"temp_max":78.8},"visibility":16093,"wind":{"speed":3.87,"deg":291},"clouds":{"all":1},"dt":1504188900,"sys":{"type":1,"id":2886,"message":0.0053,"country":"US","sunrise":1504175992,"sunset":1504222878},"id":4775660,"name":"New Baltimore","cod":200}
```

## Fetching Data

So how do we actually get the data from an API into our code?