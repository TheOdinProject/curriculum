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
- Learn about one-to-many relationships
- Learn about many-to-many relationships

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

A key distinction here is that we're not talking about how many Post objects a User *currently* has or how many FranchiseLocation objects a City *currently* has, we're trying to model how many they *COULD* have over the entire lifetime of your application. Sure, if your User only has one Post now, you could hard code that post's ID in your user table.  Then when he has another Post, you'd have to create another table column to fit that ID. And another.  And another. Which doesn't make a lick of sense... so that's why we say the User `has_many :posts` and let the Posts table hardcode in the User's ID, since a post will only ever have one User associated with it (assuming you only have one author).

### Many-to-many relationships

Another common relationship is the many-to-many relationship, which can also be called `has_and_belongs_to_many` in Rails terms.  This often comes up in actual relationships -- a Human can have many favorite Dog objects, and each Dog object can have many favorite Human objects.  In this case, how would you specify which Dog objects are your favorites?  It actually requires you to create another table (a join table, or "through" table) that specifically keeps track of all those relationships.  It's a bit wonky to understand when you're learning but it becomes second nature once you've been at it for a short while.

### Conclusion

Pretty soon you'll start thinking of the world around you in terms of these relationships (if you don't take enough breaks).  The real power of them comes when you actually need to use them -- when you want to retrieve data about all the objects that are associated with another.  Do you want to see a list of all your X (formerly known as Twitter) followers?  Do you want to count up all the classmates you had from high school who are living in the same city as you now? Do you want to see all the comments one of your users left on another user's timelines? All of these things are relatively simple and intuitive once you've actually set up the appropriate data relationships. So focus on understanding these relationships.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the beginning of the [Rails Guides Associations Chapter](http://guides.rubyonrails.org/association_basics.html), just up until section 2.7.  Everything after that we can save for later... the important thing is that you've seen the relationships and how they're set up.

</div>

### Knowledge check

Reflect on the key topics from this lesson with the following question. If you're unsure about the answer, click on the link to review the material.

- [If class A has a `belongs_to` association with class B, which class's database table should contain a foreign key?](https://guides.rubyonrails.org/association_basics.html#choosing-between-belongs-to-and-has-one)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.