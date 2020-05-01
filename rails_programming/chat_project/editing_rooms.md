We've added the ability to create new rooms, but what if you need to make a change once it's been created. Maybe you made a typo with the room name and need to amend it or maybe the name of your room no longer reflects what it is used for. You don't want to have to create a new room when the room you have is perfectly adequate. Instead you just want to make the change to the room itself. Enter the edit method.

Before we start the process of creating the edit action though we should first create a link where rooms can be edited. The main benefit of doing this first is that you'll be able to see the parameter(s) passed to the controller for use. If we first wrote the controller action it is more difficult to see the connection between the parameters passed in and how we use them.

There is no standard on where your edit link should go and will depend on the design of your application. For our application we can place it next to each room in the rooms list on your rooms index page.

For our own use we want the edit link to be one of the fontawesome icons. If you navigate to the (Font Awesome)[https://fontawesome.com/] website you are able to search for icons in the top left corner. We want a nice looking edit icon so why don't you have a search for `edit` in the box and see what comes up. On the left hand side you should be able to select to view free icons only. (The first result)[https://fontawesome.com/icons/edit?style=solid] looks promising so that is what I am going to use. Feel free to choose your own if you have another style you would prefer. If you click on the icon you like it will give you all the relevant information about the icon including the html you need to include, `<i class="fas fa-edit"></i>`.

We encountered link_to in the lesson on creating the rooms index page and looked through the example provided for the different ways you can generate links using this method. We can't write this link using the same format as we did before because we want custom html to insert the icon rather than just a name. Scrolling down through the examples you might have seen `You can use a block as well if your link target is hard to fit into the name parameter`. The example provided was

```html
<%= link_to(@profile) do %>
  <strong><%= @profile.name %></strong> -- <span>Check it out!</span>
<% end %>
```

This looks like exactly what we need.

Open up our rooms index page in a text editor and after the link we 

Editing a room is very similar to creating a new room, we want a similar form where we can update the details for the room with the main difference being we want the room details already loaded into the form ready to be changed. However before we do that let's follow the path our request would take. Rails would firstly try to match a request to edit a resource with a route. As we already created all of the routes with `resources :rooms` in the routes file that has already been taken care of. The route would send our request to the Rooms controller looking for the edit action.

Open up the rooms controller and add the edit action underneath the create action you created earlier.

```ruby
def edit
  @rooms = Room.find(params[:id])
end
```
