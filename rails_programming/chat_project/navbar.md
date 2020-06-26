Now that we have all of the room functionality created it would be nice if we could navigate from the home page to the rooms index page without having to manually type the address each time. We need a navigation menu! This will also give us a good place to add links for logging in and out once we have created the user model.

As we want the navbar to be visible on all pages it needs to be put in a place that is loaded with every page request. The one view guaranteed to load on every page request is application.html.erb which is found in the views/layouts directory. If you take a look at that file you will see `<%= yield %>` inside the `<body>` tags.

# TODO explain the use of yield inside 

We can add any code inside of our application which will be called in the order it is provided. Therefore if we want a navbar we can place it before the yield statement and if we want a footer we coud place it afterwards.

Bulma provides us with a nice [navbar](https://bulma.io/documentation/components/navbar/) we can use to do the heavy lifting of a nice display without having to write much css ourselves.

Open up application.html.erb in app/views/layouts and above the yield keyword let's add the following code

```html
<div class="navbar" role="navigation", aria-label="main navigation">
  <div class="navbar-menu">
    <div class="navbar-start">
      <%= link_to "Rooms", rooms_path, class: 'navbar-item' %>
    </div>
  </div>
</div>
```

None of the syntax should be unfamiliar to you. The classes come from Bulma stylings and the link_to is something we've covered already.

Now if you refresh the page you should see a handy link at the top of the page to take us to the rooms index page whenever we need to get there.

Not only that but we also have a place to put the login and logout links once we have created our user model.

We could leave it here but to clean this up a little bit we can move the navbar code into a partial and just render it from the application.html.erb file. This will keep it clean and easy to navigate should we need to add more to it.

First in app/views create a new folder called `shared` which we can use to hold any partials that are going to be used across several different views and then inside shared create a file called `_navbar.html.erb` and then cut and paste the code you wrote above into it.

Now all we need to do is where we had our navbar code before, just above yield add

```html
<%= render 'shared/navbar' %>
```

Refresh your browser and you should see nothing has changed, but our application html file looks neater and will be easier to work with should we need to edit it again.

# TODO decide if a footer is required
