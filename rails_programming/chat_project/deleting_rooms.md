The last part of our journey into CRUD is the delete operation. Luckily it also happens to be the simplest as it doesn't require a view and only has one controller method needed yet still has a few complexities to consider.

As with the edit method we are going to use an icon to represent the delete action and we can place it alongside our edit icon in the rooms list.

Our first task will be finding a sweet icon to use. Let's navigate over to (Font Awesome)[https://fontawesome.com/] and have a search. I searched for "delete" but again I encourage you to explore on your own to find an icon you'd like to use. I've settled on the (trash-alt)[https://fontawesome.com/icons/trash-alt?style=solid] icon which I think clearly represents our intention when clicked to delete the intended room. The html for this icon is `<i class="fas fa-trash-alt"></i>` but if you have found your own icon then yours will be a little different.

We don't need to dive deeply into link_to as we've already discussed this at length but there are a couple of points worthy of consideration. Let's again review the routes that Rails provides for us for each room.

```
               Prefix     Verb    URI Pattern
rooms#index    rooms      GET     /rooms(.:format)
rooms#create              POST    /rooms(.:format)
rooms#new      new_room   GET     /rooms/new(.:format)
rooms#edit     edit_room  GET     /rooms/:id/edit(.:format)
rooms#show     room       GET     /rooms/:id(.:format)
rooms#update              PATCH   /rooms/:id(.:format)
rooms#update              PUT     /rooms/:id(.:format)
rooms#destroy             DELETE  /rooms/:id(.:format)
```

As with the update action the URI pattern for showing, updating and destroying a room is the same and Rails differentiates based on the method you pass in, so for our delete link we need to specify the delete method in our link. The second consideration we will discuss after we have implemented our link.

Writing most of the link_to should be familiar now but to get an understanding of how we write the delete method let's again refer to the (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to] documentation. If you scroll down through the examples you'll eventually get to one that states "The only option specific to link_to (:method) is used as follows:" with the following example.

```html
link_to("Destroy", "http://www.example.com", method: :delete)
# => <a href='http://www.example.com' rel="nofollow" data-method="delete">Destroy</a>
```

This looks like what we are trying to do except we want our link to be an icon. This is a good chance to practice writing your own link_to method. You want to use the same style as we did for the link_to method but we need to ensure the delete method is added. It should go directly below the edit link we created in the room_list partial. Give it a go and then refer to the code below. Because in the last lesson we extracted our rooms list into a partial we only need to update this is one place. Amazing!

```html
<%= link_to room_path(room), method: :delete do %>
  <span class="icon">
    <i class="fas fa-trash-alt"></i>
  </span>
<% end %>
```

If you refresh the page you should now see a delete icon next to the edit action for each room you have created. Try clicking on it and you'll get an error with a nice description identifying the problem "The action 'destroy' could not be found for RoomsController" and if you again refer back to the (Rails Guide)[https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions] section on CRUD, verbs and actions we can see that a delete request routes to the destroy method in our controller.

Open up the Rooms controller and let's write the last method

```ruby
def destroy
end
```

As for what goes inside we first need to load up the room we want to delete. We've already done this before.

```ruby
def destroy
  @room = Room.find(params[:id])
end
```

And we can once again refer back to the (Rails Guide)[https://guides.rubyonrails.org/active_record_basics.html#delete] action for deleting an object to see we need to call the destroy method on it. The destory method will return false if the record can't be destroyed so we can use this much like we have done in other controller methods in an if;else statement.

```ruby
def destroy
  @room = Room.find(params[:id])
  if @room.destroy
    flash[:success] = "Room successfully deleted"
    redirect_to rooms_path
  else
    flash.now[:error] = "The Room could not be deleted"
    redirect_to rooms_path
  end
end
```

Try clicking on the delete icon now in your browser and you should hopefully see the room disappear with a helpful message. This brings us back to that second consideration I mentioned earlier. What happens if you accidentally click on the delete icon? Right now it would delete the room and you'd lose all the messages. What we need is a way for the user to have to confirm that they actually want to do that. As we are working on the browser it is handled by Javascript using a confirmation modal that returns true if the user clicks ok and flase otherwise. You can read more about it (here)[https://developer.mozilla.org/en-US/docs/Web/API/Window/confirm]. Luckily Rails providues a handy way to handle this for us.

Have another look at the link_to examples in the Rail API and see if you can spot something useful.

Hopefully you spotted you can add data-attributes using the data option and the example provided looks perfect.

```html
link_to "Visit Other Site", "http://www.rubyonrails.org/", data: { confirm: "Are you sure?"  }
# => <a href="http://www.rubyonrails.org/" data-confirm="Are you sure?">Visit Other Site</a>
```

Let's modify our delete link to incorporate this change.

```html
<%= link_to room_path(room), method: :delete, data: { confirm: "Are you sure you want to delete the room?" } do %>
  <span class="icon">
    <i class="fas fa-trash-alt"></i>
  </span>
<% end %>
```

Test deleting a room now and you should see a nice confirmation modal providing us with that safety net that we can't accidentally delete a room.

Now that our delete method seems to be working as expected we can turn our gaze towards writing a couple of system tests. There is a big difference when testing the delete method from our previous tests but to see what the problem is let us first write the test as we would expect it to work.

In our terminal we need to first create our system test

```bash
bundle exec rails generate rspec:system delete_room
```

Once again delete everything in the opening decribe block. We already know from our edit room system tests that to target our delete link we will need to add our test_id data attribute. We should create a new helper method `delete_test_attribute` and write the appropriate tests. They will be identical to our edit tests so if you want to save time you could just copy and paste the tests and replace anywhere that references `edit` with `delete`. Be careful if you use search and replace not to change any of our actual `#edit_test_attribute` tests.

The final tests should look like this

```ruby
RSpec.describe RoomsHelper, type: :helper do
  describe('#edit_test_attribute') do
    # ...
  end

  describe('#delete_test_attribute') do
    context('when a single word is provided') do
      it 'returns a downcased version of the word preceeded with delete-' do
        expect(helper.delete_test_attribute('Dude')).to eq 'delete-dude'
      end
    end

    context ('when a phrase is provided') do
      it('returns a downcased version of the word preceeded with delete-')
        expect(helper.delete_test_attribute('Where is My Cat')).to eq 'delete-where-is-my-cat'
      end
    end

    context('when there are special characters') do
      it('removes the special characters from the phrase') do
        expect(helper.delete_test_attribute('hi @ mom')). to eq 'delete-hi-mom'
      end
    end
  end
end
```

To get the test passing we can write very similar code to before. In our RoomHelper file below our edit_test_attribute method we can add out delete_test_attribute method

```ruby
def delete_test_attribute(name)
  "delete-#{name.parameterize}"
end
```

All the tests in the file should now pass. You may be tempted looking at this to consider abstracting out the edit and delete test_attribute methods in our helper file to just one method. It would be possible. We could have a method like

```ruby
def test_attribute(prefix, name)
  "#{prefix}-#{name.parameterize}"
end
```

We could then call it with in our links using `test_attribute("edit", room.name)` and `test_attribute("delete", room.name)`. This would certainly make our code more dry, but our app is still relatively young. Unlike with the partials we extracted where we can concrete examples of duplicating code in two views for every change we made we don't have that same level of information here. As our app grows we might find ourselves needing to differ our approach. So far we just have one file where we need to use this code. Extracting it could be an example or premature abstraction. However if you did decide to abstract it now it could be said to be cleaner, and easier to change. If we needed to change the naming convention for out test_id we would only need to change it in one place. If we ever do decide we need to change it then that would be a great time to refactor these helpers. As it is we'll leave the code as it is.

We can finish up by updating our room_list partial to call the test_id generator helper method for our delete link. Note that we are already using `data` when we set the confirmation dialog so here we only need to add to the supplied hash.

```html
<%= link_to room_path(room), method: :delete, data: { confirm: "Are you sure you want to delete the room?", test_id: delete_test_attribute(room.name) } do %>
```

With everything in place let's get back to writing our system tests for this.

```ruby
RSpec.describe "DeleteRoom", type: :system do
  before(:example) do
    Room.create(name: 'test room')
  end

  context 'when a valid delete is made' do
    it 'informs the user that the room was successfully deleted' do
      visit root_path
      click_on "Rooms"

      click_on 'delete-test-room'

      expect(page).to have_selector '.is-success'
      expect(page).to have_content 'Room successfully deleted'
    end
  end
end
```

We would expect this test to work. Try running it and see what happens.

Your test should have failed with a notifcation that is couldn't find the selector `.is-success`. It might not be obvious why.

#TODO: discuss save_and_open_page

What we should see from this is that when we clicked our delete link the confirmation dialog popped up. As we didn't confirm we wanted to delete the room no action was taken. Capybara provides an [accept_confirm](https://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FSession:accept_confirm) method that we can wrap around our link click which will accept the confirmation modal. Let's update our test to include this.

```ruby
context 'when a valid delete is made' do
  it 'informs the user that the room was successfully deleted' do
    visit root_path
    click_on "Rooms"

    accept_confirm do
      click_on 'delete-test-room'
    end

    expect(page).to have_selector '.is-success'
    expect(page).to have_content 'Room successfully deleted'
  end
end
```

Run the test now and you'll get another error.

```bash
Failure/Error:
  accept_confirm do
    click_on "delete-test-room"
  end

Capybara::NotSupportedByDriverError:
  Capybara::Driver::Base#accept_modal`
```

The error here informs us our current driver (which is rack_test) doesn't support what we are trying to do. This is the big difference between our system test to edit a room and this one to delete a room. The data confirm modal requires javascript support and rack_test doesn't provide this in its browser emulation. That is part of what makes rack_test fast, it doesn't need to provide full browser features.

The need for javascript doesn't just extend to the confirm modal either. If we didn't have a confirmation modal it would still have failed, except this time the error would have been less obvious. The reason for this can be found in what Rails does when you add `method: :delete` to your links. By default a link can only issue a GET request, but we need to submit a delete http request. What Rails does under the hood is use Javascript to stop all requests generated from links. It then converts the link to a form and sets the form to submit the correct request type.

This is handled in the Rails UJS (UJS means unobstrucive javascript) library. You can read the method [here](https://github.com/rails/rails/blob/master/actionview/app/assets/javascripts/rails-ujs/features/method.coffee). Even if you don't understand everything happening you can see a form is being created and submitted.

If you don't have Javascript enabled then you might think links would never work, but that isn't the case. Any method that can respond to a GET request would still work because without Javascript to intercept the request it would submit as normal. If you ever get errors in yours Rails apps where your links are only submitting get requests even when specifying `method: :delete` then checking whether Javascript is being enabled is a good place to start.

With that in mind we now we can no longer use rack_test for this system test. We can still use it for our other tests because it will run fast but we need to look at other options. The chrome browser now ships with headless chrome which provides a browser api without the overhead of launching the gui. Make sure you have google chrome installed and your version is at least Chrome 59. If earlier you will either need to update or install headless chrome seperately. If you have an aversion to Chrome you don't need to make it your default browser but it will make these tests much easier to work with. To interact with chrome we can use [Selenium](https://www.selenium.dev/) which bridges the gap between capybara and chrome.

To install the drivers required to work with Chrome. Open up your Gemfile and in the test group add the webdrivers gem. The webdrivers gem includes the selenium drivers we need and some others we don't. If you ever find yourself looking at other options besides Selenium you still may need to reach for the webdrivers gem.

```ruby
group :test do
  # ...
  gem 'webdrivers', '~>4.0'
end
```

In the terminal install the gem with `bundle install`.

Now what we can do is for tests that require Javascript is to use [RSpec metadata](https://relishapp.com/rspec/rspec-core/docs/metadata/user-defined-metadata) to identify those tests and then run them using Selenium. Open up our system test support file located in /spec/support/ and let's add a config line with metadata to identify that we need to have Javascript available in our tests.

```ruby
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
```

You can use any metadata in your tests by including a hash in the opening describe block. It's not something you'd concern yourself with much while learning but keep in mind such a thing exists.

Now we all we need to do is go back to our delete room system test and in the opening describe block add our js hash option.

```ruby
RSpec.describe "DeleteRoom", type: :system, js: true do
```

That's all there is to it. Run the test suite now. The test may pass.... or like me, you get a failing test that there was no Rooms link that could be clicked. I could tell you how to solve it but instead this is a good opportunity to dive into a little debugging that might just help you one day. Even if your test is passing read on because you'll still need to apply this fix.

I won't go into detail of all the things I tried, and I'll certainly leave out all of the expletives as the day dragged on and I still didn't have a passing test. I even had to set a new environment up in a VM to see if the problem was solved there. That was really fun!

So, I know my test should have a Room link. Indeed it works just fine using rack_test. If your test does fail it will generate a screenshot for you in the tmp/screenshots/ directory. Have a look at the screenshot and you'll notice the there is no Rooms link, in fact there is no Navbar at all. My first thought was that selenium must not be correctly loading the navbar partial, that was the mistake that cost me so much time. I immediately assumed the worst and dove head first into finding a solution but no matter what I tried I still ended up with the same error.

What I should have done first, is what I eventually did end up doing. Capybara ships with a method that you can drop into your tests at any point called `save_and_open_page`. It does what you probably assume it does. It opens a web browser at the point it finds that line in the test and shows what you would see if you were using the same browser to perform the test yourself.

To use this method we do need to install one additional gem. [Launchy](https://github.com/copiousfreetime/launchy). It helps launch applications (including browsers) in a consistent way across platforms. Therefore no matter what OS you are using, launchy should be able to open the requested application. Open up your Gemfile again and in the test group add the gem.

```ruby
group :test do
  # ...
  gem 'launchy'
end
```

Save the file and in the terminal run `bundle install`.

Now in our failing system test we know the test is failing when it hits the line where we click on the Rooms link. Therefore we should drop our helper method to open the page in a browser just above that.

```ruby
context 'when a valid delete is made' do
  it 'informs the user that the room was successfully deleted' do
    visit root_path
    save_and_open_page
    click_on "Rooms"

    # ...
  end
end
```

Save the file and run the test again in the terminal `bundle exec rspec spec/system/delete_rooms_spec.rb`

Now when the test runs it should pause execution at that point to open a browser. When mine opened I was greeted by the sight of the Rooms link in the navbar, so I knew the issue actually wasn't with the test driver. It is working as expecting. I'd like to say it was a huge relief to know, but actually I was pretty annoyed I'd wasted all that time chasing it down.

Looking again at the screenshot the only thing I could notice was that different was the size of the page. So I shrank the browser, and sure enough when it dropped below a certain size the navbar just vanished. It wasn't visible any longer and so my test could not click on it as it mimics what the user can see themselves.

But why was this happening? Bulma is why... and my inability to actually read through the docs correctly. The [Bulma navigation](https://bulma.io/documentation/components/navbar/) docs say "The navbar component is a responsive and versatile horizontal navigation bar with the following structure". Responsive my *&*&. However on scrolling down it does say `The navbar-menu is hidden on touch devices < 1024px. You need to add the modifier class is-active to display it.`. Oh joy. On a smaller device you'd of course not want a long menu overflowing and taking up half the screen. If you  are interested in making this app more mobile friendly then read through the docs and try changing up the navigation menu used. It does have solutions. However for this we'll just apply the fix they provide. We won't have a long menu so it shouldn't be a huge problem.

Open up our navbar partial and on the second line where we have the div with the class `navbar-menu` add the class `is-active`.

```html
<div class="navbar-menu is-active">
# ...
```

Make sure all files have been saved and now try running your test. It should now be green and you should have a good idea for how you can debug a system test without wasting a day.
