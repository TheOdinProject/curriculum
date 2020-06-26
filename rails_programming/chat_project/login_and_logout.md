Now that users have been created we can now move onto providing a link to either log in or log out in the navbar. We don't want to show both at the same time but instead we want to only show the logout button if the current user is logged in, otherwise we want to take them to the login page.

Devise offers a lot of helpers out of the box that will make this easy. It isn't always easy to know where to start with working with such a large gem so in your own projects don't be afraid to look through the devise docs or use a search engine to see if there is a ready made solution to your problem. No need to reinvent the wheel.

Back to our problem. How do we show one link is a user is logged in and a different link if they are logged out. We don't need to complicate it here. Ruby gives us an easy way to control the flow of execution with an `if` statement and devise offers us in our controllers and views a helper called `current_user` that either returns the user object if a user is logged in or returns nil otherwise.

As for the links themselves that we will need we need to check the `rails routes` to see what devise expects for logging in and out. The path for logging in is provided as `new_user_session_path` and just needs a get request to route us there. Logging out goes to `destroy_user_session_path` but as a delete request. We encountered this when deleting rooms.

Let's open up the navbar view file and start writing some code. If you refer back to the Bulma [navbar](https://bulma.io/documentation/components/navbar/) docs you can see that by using the `navbar-end` class we can align our links to the right of the navbar which is a good place to put them.

Underneath the div with the `navbar-start` class let's start with the opening div

```html
<div class="navbar-end">
</div>
```

Inside that we can use erb to write the if statement. Because in Ruby the value supplied to an if statement will execute if it is non-falsey we can use the `current_user` helper mentioned above. If there is a user logged in already `current_user` will return that user object which is a truthy value in Ruby and we can supply a link to log out. If there is no user then we need an `else` clause to provide a link to log in.

Let's start with the login functionality. Let's write an if statement with an else clause. The else clause will supply the login link.

```html
<div class="navbar-end">
  <div class="navbar-item">
    <% if current_user %>
      // our logout code will go here
    <% else %>
      <%= link_to "Login", new_user_session_path, class: 'button is-link' %>
    <% end %>
  </div>
</div>
```

To log out we don't need to do much different except pass the `method: :delete` option to the link to ensure it gets send as a delete request to devise.

```html
<% if current_user %>
  <%= link_to "Logout", destroy_user_session_path, method: :delete, class: ' button is_link' %>
<% end %>
```

Now if you refresh the page you should see either a login or logout button depending on whether you are logged in or out. Give it a try and make sure you can log in and back out again.

