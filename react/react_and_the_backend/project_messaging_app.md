### Introduction

Think of your favorite messaging app - Discord, Telegram, WhatsApp, Facebook Messenger, AOL Instant Messenger, etc. - and imagine what it would be like if you could build your own. This project will give you a chance to do just that. You'll be building a web app that allows users to send messages to each other.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Keep in mind that the apps we mentioned earlier have entire teams of developers working on them, so you shouldn't feel the need to go overboard with features in your app. At a minimum, though, your app should include the following core functionality:
   1. Authorization
   1. Sending messages to another user
   1. Customizing a user profile
1. Spend some time planning out your app. What will the user interface look like? What will the data model look like? What libraries will you need to use?
1. Start building your app by implementing the core functionality in your backend and frontend.
   1. You may have realized that a REST API backend cannot handle real time updates. It is "request-response", so the server can only respond to a request. If a user sends a message to another user, a REST API cannot automatically notify the recipient as the recipient will not have requested that data. Methods for real time server-client updates (particularly when dealing with a split front/backend) have not been taught, so you are not expected to implement any in this app.
1. Deploy your app to the web and showcase it in the submissions below as well as on our Discord. We'd love to see what you've built!

#### Extra credit

- Allow sending images in chat
- Add a friends list that users can add other users to and see when someone is online (alternative: "Add a users list to show which users are currently online"; same thing except maybe a step or two less since it doesn't require adding a friend)
- Allow users to create and send messages in group chats

</div>
