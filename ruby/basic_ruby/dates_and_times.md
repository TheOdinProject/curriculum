## Dates and Times
### Intro and Goals
When you're building a website, you'll inevitably come into contact with dates and times.  When was that submitted?  Show only posts created after this time.  How long has that user been registered?

All languages have conventions for how they keep track of dates and times and, of course, Ruby is no different... just a bit easier than the rest.  In general, computers keep track of time in terms of seconds since a specified point in time.  Someone decided a long time ago that Time shall begin at midnight on January 1st, 1970, and so that's typically the "0th" second.

Ruby uses the `Time` class to let you work with dates and times, giving you some handy methods to find out about specific parts (like what day of the week it is) and to allow you to display them in a user-friendly fashion.  You probably won't need to dive too deeply into this stuff until you start working with Rails but you do need to understand the basics (as laid out below).

### Thought Questions
* How do you get the current date and time?
* How do you find just the Year?  Month? Hour? Second? Weekday?
* How do you create a `Time` specifically for 12/25/2013?  
* How do you find how many days have passed between two `Time`'s?
* What's the difference between UTC and GMT and Local times?
* How would you find out the time that was 100 seconds ago? 10 days ago?
* TODO: Datetime

### Check These Out First
* The [Ruby Date and Time explanation from TutorialsPoint](http://www.tutorialspoint.com/ruby/ruby_date_time.htm).  No need to memorize all the Time Formatting Directives, just know what they are and where to find them.

### A Brief Summary
To **Get Current Time** you just create a new `Time` object with no parameters or use `Time.now`, which is the same thing:

    > Time.new
    => 2013-07-10 17:04:10 -0700
    > Time.now
    =>2013-07-10 17:04:11 -0700

`Time` gives you some handy methods to ask it questions.  Almost all of them are very intuitive, so the general rule is "if you think the method should exist, it probably does":

    > my_time = Time.now
    => 2013-07-10 17:04:10 -0700
    > my_time.year
    => 2013
    > my_time.month
    => 7
    > my_time.day
    => 10
    > my_time.wday
    => 0                # the day of the week, starting Sunday
    > my_time.hour
    => 17
    > my_time.min
    => 4
    > my_time.sec
    => 10

`Time` also takes inputs if you want to create a specific time, from year to time zone:

`Time.new(year, month, day, hour, min, sec, time_zone_offset_from_utc)`

    > Time.new(2012,2,14)
    => 2012-02-14 00:00:00 -0800

You can add and subtract times just like they were numbers (because, remember, they basically are... just the number of seconds since 1970):

    > vday = Time.new(2012,2,14)    # Valentine's Day!
    => 2012-02-14 00:00:00 -0800
    > vday+3600                     # 1 hour's worth of seconds
    => 2012-02-14 01:00:00 -0800
    > xmas = Time.new(2013,12,25)
    => 2013-12-25 00:00:00 -0700    # Xmas!
    > ( xmas - Time.now )/60/60/24.to_i
    => 167                          # That's too long...

What if you want to display a date in a pretty way, like on your website or for your user's benefit?  There are a couple of baked in methods and then a "build-your-own-adventure" way to specify:

    > nownow = Time.now
    => 2013-07-10 17:37:27 -0700
    > nownow.ctime                  # a standard display type
    => "Wed Jul 10 17:38:10 2013"
    > nownow.UTC                    # Remove the time zone
    => 2013-07-11 00:38:10 UTC
    > nownow.strftime("%Y-%m-%d %H:%M:%S")
    => "2013-07-11 00:38:10" 

Wait, what were all those `%Y` characters?  They just tell the `strftime` method what components of the `Time` to output and how you'd like them formatted.  There's a long list of them back at [the TutorialsPoint site](http://www.tutorialspoint.com/ruby/ruby_date_time.htm).  You don't need to remember them since you can just google for them when you decide to output a string, but know that they give you the flexibility to output a date or time in pretty much any way you could imagine.

**Extra Stuff: Time Zones and Local Time**
What's that trailing `-0800` in `2012-02-14 00:00:00 -0800`?  It's because that time was created on my local system, which is many hours "earlier" in the day from the Coordinated Universal Time (called UTC... no, it doesn't match up but [here's why](http://geography.about.com/od/timeandtimezones/a/gmtutc.htm)) which is used by computers around the world as the standard benchmark time (so two computers communicating about times will always be talking about the same exact one and not have to worry about time zones).  

I prefer to think of UTC as "Universal Time Code" because reasons.  UTC is the new GMT... Greenwich Mean Time.  You'll start thinking of things in terms of "how many hours away am I from England?" when you run into time zone bugs somewhere down the road.  

Back to the point, the `-0800` above says that we created a new time for midnight on Valentine's Day but only from the perspective of someone on the West Coast of the USA... it was really 8am in Greenwich, England and according to every other computer in the world.  You'll forget this stuff until you need it and that's fine.

Use `localtime` to display the `Time` object in whatever your local system time is (if it was created in UTC it will be different).

### Exercises (in IRB)
*Have you found any useful exercises that helped you get this stuff?  Add them here!  See our section on [How to Contribute](/contributing.md).*
1. How many days until your birthday?
2. How many days, hours, minutes, and seconds until Christmas?
3. Display `"January 10, 2001 10:00AM"` in IRB
4. TODO

### Additional Resources
*Have you run across anything that's really helpful for learning this?  Add it here!  See our section on [How to Contribute](/contributing.md).*

* Add Here!
