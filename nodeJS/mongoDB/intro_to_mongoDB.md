### Introduction

Data persistence is integral to the vast majority of web applications. Local storage has limitations and poses security risks, and SaaS options such as Firebase work well, but ultimately being able to understand how to structure, build, and query your own database are important skills for any full stack developer to have. For example, consider Twitter. Where are your username and password stored? Or perhaps where all of your Tweets might be fetched from? How does the application determine what Tweets are shown to you every time you log on? These operations are handled by a database. Databases are split into "relational" and "non-relational" types of databases, and each handles data and scaling in different manners. [This article](https://circleci.com/blog/SQL-vs-NoSQL-databases/) goes in depth with the difference between the two. This lesson will teach you about MongoDB, a popular NoSQL database.

### Learning Outcomes

By the end of this lesson, you should be able to do the following:

- Set up a database on MongoDB Atlas
- Use the `mongo` shell
- Create, edit, and delete documents in a MongoDB database using the `mongo` shell

<div class="lesson-note" markdown="1">

### Important Notice

Currently MongoDB is not available on Ubuntu 22.04 or it's equivalent flavours. If you are using a 22.04-based distribution, keep this in mind when you get to the steps to installing MongoDB locally. There has been [work done](https://jira.mongodb.org/browse/SERVER-62300) by the MongoDB team, but it has not yet been released. This note will be removed or updated when there is further news on the availability for 22.04 distributions.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

- Take the entire [MongoDB University "Introduction to MongoDB" course](https://learn.mongodb.com/learning-paths/introduction-to-mongodb). This course will teach you the basics of MongoDB and the mongo shell. You will need to make an account.

</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="https://circleci.com/blog/SQL-vs-NoSQL-databases/">What is the difference between a relational database and a non-relational database?</a>
