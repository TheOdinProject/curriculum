### Introduction

Imagine you’ve got your database up and running and want to make sure that people are sending it good data in their requests. For instance, to create an account on your site, a user needs to enter both a username and an email address. How do you require that both values are entered, or that they each have the proper characters? Such restrictions are achieved with *validations*.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What validations are.
- How to specify validations.
- The three levels of validations.

### What are validations?

Validations are restrictions applied at three levels to ensure that data meets certain criteria before it can be saved to the database. The three levels are the client side, the server side -- that is, the Rails level, and the database. Each level's validation is more strict and secure than the previous.

### How to specify validations

Let's suppose someone tries to make a new user. They click a submit button on a form somewhere, the HTTP request gets sent, and the validation processes occur. At the Rails level, a basic validation in the User model file can be written as follows.

In `app/models/user.rb`:

```ruby
class User < ApplicationRecord
  validates :name, presence: true
end
```

Note that the above is a simplified example for illustrative purposes, showing one single validation. Real-world validation logic in a class is often more complex, and can consist of multiple validation checks.

### Client-side validation

At the topmost level, you can write code using JavaScript in your browser that detects if someone has filled out the form properly and will prompt them to finish it before moving on. We will learn more about that in the JavaScript course. The advantage here is that it is almost immediate so it creates a great user experience. The problem with this is that JavaScript is easy to circumvent and the user could easily submit a malicious or faulty request.

Additionally, as of HTML5, validations may also be performed in HTML forms using vanilla HTML. As is the case with JavaScript-based form validation, HTML form validation is easily circumvented.

### Server-side validation

The second layer of enforcement for your validations of user data (which you should never trust) is at the server level. This means writing code in your Rails application (specifically in the model that you are trying to save an instance of, e.g. User) that examines user inputs, checks them versus the constraints you set up, and returns errors if there are any.

This is more secure than client-side validation but has the disadvantage of taking a full round-trip HTTP request to your application in order to check it. Model validations are generally pretty effective and that's what we'll focus on here.

Another problem occurs when your application has scaled up to the point where you are running multiple instances of it on multiple servers that all talk to the same central database. Let's say you want to make sure a username is unique... what happens if two users almost simultaneously submit the same username and it is received by two separate concurrent instances of your application? When each instance of your application checks with the database to see if the username is unique, both times it looks okay so they both go ahead and save the model... oops! That may not sound plausible, but how about in rapidly occurring automated transactions? These "race conditions" are very real.

### Database-level validation

So the only way to truly enforce constraints is on the database level, since your single database is the sole arbiter of what is unique and valid in this world. You can use extra parameters passed to some of the now-familiar migration methods like `add_index` to say `add_index :users, :username, unique: true`, which enforces in the most secure way that the column is unique. Again, though, most of your validations can be implemented in your Rails application's models.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the [Rails Guides Validations chapter](http://guides.rubyonrails.org/active_record_validations.html)
   - Section 2 on helpers can be skimmed -- these help you get more specific with your validations and you'll run into them later
   - You can skim section 6 about custom validators
   - Section 8 will likely only be interesting if you've seen ERB in Rails views before... we'll get there.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What does the validation helper `presence: true` enforce?](https://guides.rubyonrails.org/active_record_validations.html#presence)
- [How can you see why an instance of a model class has failed validation?](https://guides.rubyonrails.org/active_record_validations.html#validations-overview-errors)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
