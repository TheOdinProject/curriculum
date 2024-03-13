<div class="lesson-note lesson-note--tip" markdown="1">

#### NOTICE

This is one of the new, more focused lessons created as part of the ongoing restructuring of the Active Record basics course. It's designed to provide more targeted and digestible content. If you've already started with the original comprehensive lesson and find some overlap, feel free to skip this lesson.
</div>

### Introduction

In the databases sections, you learned about how a relational database like SQLite3 or PostgreSQL lets you link two tables together using their primary keys -- a table's key that references another table is called a foreign key. It's the real power of relational databases that they let you leverage these, well, relationships. Active Record takes that feature and lets you use it in all kinds of useful ways. Do you want to get all of your first user's blog posts? Try `User.first.posts`. It's as simple as that. That functionality doesn't come out of the box -- you need to tell Rails that posts actually belong to a user. This is accomplished with *associations*.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what associations are.
- Know how to specify associations.
- Know the importance of setting up your data model and how to do it.

### What are associations?

Associations are Rails' way of establishing relationships between tables. Conceptually, it makes sense that e.g. a Post would belong to a User. Declaring assocations also helps streamline certain operations, such as adding or removing data. For example, once an association has been declared, one can intuitively and explicitly add a new post with `@post = @user.posts.create(title: "New Post Title", content: "Content of the new post")`. Or, if we’re interested in a user’s posts, we just have to query the posts table for all posts that link back to that user’s ID. Additionally, associations are Rails' way of abstracting away foreign key relationships. On the database table level, every row in the posts table will have a column for `user_id` that tells you which user "owns" that post. The users table doesn't need to acknowledge the posts at all... after all, a single user can have an infinite number of posts.

### How to specify an association

Our posts-user example has an aptly named "has many / belongs to" association. A User `has_many` Post objects associated with it, and a Post `belongs_to` a single User. Rails makes these relationships very easy to specify. You can establish the association between models either by using a Rails generator or by manually defining the association in your model files. Regardless of the method you choose, here's what the associations will look like in your codebase:

In `app/models/user.rb`:
```ruby
class User < ApplicationRecord
  has_many :posts
end
```
In `app/models/post.rb`:
```ruby
class Post < ApplicationRecord
  belongs_to :user
end
```

### Setting up your data model

Step one with understanding this stuff is just to think about which different types of relationships are possible. Remember, half the battle of setting up your application is understanding what your data relationships will look like, so give this some thought and keep at it when it gets confusing. If your mind is a bit fried right now, start back in the real world and don’t think about it on a database level – remember, all this stuff is our attempt to reflect the kinds of relationships that can occur in the real world.

### One-to-many relationships

The `has_many` / `belongs_to`, or a "one-to-many", relationship is pretty common, and usually easiest to think of in terms of actual objects... a Child can have many Marble objects, each of which belongs to that Child.  But it also applies in slightly less intuitive cases, like where a single object `belongs_to` multiple other objects.  An example would be a FranchiseLocation for a McDonalds, which `belongs_to` the Corporation McDonalds but might also `belongs_to` the City San Francisco.

It’s clear that it should belong to its corporate parent, but why does it belong to a City too? It’s often easier to think of it from the opposite perspective – a City can certainly have many FranchiseLocation objects. As long as a FranchiseLocation can only be in a single city, it effectively “belongs_to” that city in the way that Rails describes it.

### Many-to-many relationships

### CUSTOM SECTION HEADING

CUSTOM SECTION CONTENT.

### CUSTOM SECTION HEADING

CUSTOM SECTION CONTENT.

### CUSTOM SECTION HEADING

CUSTOM SECTION CONTENT.

#### Note box variations

<div class="lesson-note" markdown="1">

#### A sample title

A sample note box.

</div>

<div class="lesson-note lesson-note--tip" markdown="1">

#### level 4 heading for title is recommended

A sample note box, variation: tip.

</div>

<div class="lesson-note lesson-note--warning" markdown="1">

#### But title is also optional

A sample note box, variation: warning.

</div>

<div class="lesson-note lesson-note--critical" markdown="1">

A sample note box, variation: critical.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. A RESOURCE ITEM
   - AN INSTRUCTION ITEM
1. A PRACTICE ITEM
   - A TASK ITEM

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.