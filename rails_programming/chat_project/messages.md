```bash
rails generate model room_message room:references user:references message:text
```

```bash
rails db:migrate
```

By referencing both room and user in the migration with `references`, Rails will automatically add the `belongs_to` associations for both user and room in the RoomMessage model. However we still need to write the other side of the association. At this stage we don't have a use for finding messages through the user so let's just add the association to the Room model

Open up the Room model and add the following code

```ruby
class Room < ApplicationRecord
  has_many: room_messages
end
```

We also need a route. Inside config/routes.rb change the line with `resources :rooms` to 

```ruby
resources :rooms do
  resources :room_messages
end
```

#TODO explain nested routes


