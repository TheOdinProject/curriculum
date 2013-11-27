# Advanced Topics

## Advanced Routing


### Singular Resources

Up until now, we've been talking about resources (like "posts" and "users") where there are a whole lot of them.  It seems fairly intuitive.  Sometimes there are also resources where it actually only makes sense for there to be one.  

An example would be a User dashboard which displays interesting facts based on whichever user is logged in.  There is only one dashboard template, it just happens to be smart enough to display things that are relevant for the user who is currently logged in.

In this case, it doesn't make a whole lot of sense to display an "index" of dashboards, since there is only one (it just changes based on who is logged in).  We can also say that, for any of the other actions which would normally require an ID to differentiate which resource we're operating on (like `#show`), since there's only one, we no longer need the id.  

The routes file line for a singular resource would look like:

    # in config/routes.rb
    resource :dashboard

Just note that the word "resource" is singular and so is `dashboard`.  That trips up a lot of people who make the typo of writing "resource" instead of "resources" when they really want plural resources (which are more common).

The `$ rake routes` for a singular resource would only contain 6 routes (since we don't use `#index` anymore), and you would no longer see any of the `:id` portions of the routes, e.g.

    new_dashboard  GET /dashboard/new(.:format)  dashboards#new

...compared with the plural version of the same route:

    new_post  GET /posts/:id/    

#### Additional Resources about Singular Resources

* [Stack Overflow question on the topic](http://stackoverflow.com/questions/6629142/having-problem-understanding-singular-resource-in-rails)