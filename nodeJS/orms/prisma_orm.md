### Introduction

Tired of writing raw SQL queries in your projects? In this lesson, we'll talk about Object Relational Mappers (ORM for short). ORMs are tool that let you manipulate data in your database and is widely used in the software industry. We'll deep dive into one such ORM popular in the Node.js landscape: [Prisma ORM](https://www.prisma.io/).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are ORMs, and why are they used?
- Introduction to Prisma ORM
- Features of Prisma

### Challenges with raw SQL'in

With the couple of projects you've done earlier, you might've run into the tediousness of raw SQL queries. Let's briefly discuss some of these challenges.

#### So much more code

You need a select statement? Cool, write a query. Need a select statement for a different table? Write another query. Or if your programmer senses are tingling, you could create a utility function for select. But now you need a select statement for specific columns? You'll have to modify the utility function. What about filters and sorting? You get the point.

Replicate the above for insert queries, and all of its variations. Or you could go in a different direction. Create modules per entity. For example, the books module would have:

```javascript
class Book {
  async getBooks(filters) {}
  async getBookById(id) {}
  async createBook(data) {}
  async updateBook(id, data) {}
  async deleteBook(id) {}
  async getBookAuthors(id) {}
  async getBookGenres(id) {}
  // and so on
}
```

Or you could mix and match the two approaches. Create a `Database` class and inherit from it in your entity classes. Or you fancy composition, and just want to deal with pure functions.

Now do this over and over for each of entity, across multiple projects. You get the point. It can be argued that the above is not a bad thing, as you're learning and practicing, and it isn't. It's sufficient for solo projects, but as your codebase grows, and as you work in teams, you'll realize how much an ORM really helps you focus on writing code that's business critical.

Writing more code is not necessarily a bad thing, and we even suggest that you explore these above ideas in your solo projects. But as you start to work in teams, and large scale software, it becomes imperative to have a standard way of interacting with the database, either with a external library or a homegrown solution.

<div class="lesson-note lesson-note--tip" markdown="1">

If you haven't applied any of the above paradigms in your previous projects, we highly recommend going back and refactoring. You might end up with a very basic mini ORM for your project. This will help you appreciate a bit more on how a proper ORM will make your life easier.

</div>

#### Navigating the codebase

When all database interactions are done in raw SQL, there's nowhere in the codebase where you can understand the database tables, their relations, and column data types. You might have to login to your database to make sense of what the codebase is doing. To attain technical understanding of the project, you now rely on the codebase as well as access to the database.

Most ORMs out there solve this problem by bringing database definitions into the codebase. This is called a "schema". This allows you to quickly glance at the schema of a table and understand what columns it has and so forth.

#### Altering production data

Databases are inevitable to change as requirements of the project evolve. You might have to add a new column, or populate a new table with existing data. In technical terms, this is called a migration. Without an ORM or a similar library, you'll be hand rolling these migrations, which will be error-prone and tedious. ORMs standardize migrations via changelogs, and have processes to deal with conflicts. Granted, you won't be running as many migrations in your curriculum projects, but as you work professionally, you might do it every other day.

### Introducing Prisma ORM

ORMs pretty much solve all of the pain points mentioned above but it's not all sunshine and roses. There can be a learning curve to fully understand the ins and outs of an ORM and some don't even fully support all SQL features. Even with these shortcomings, using an ORM can be extremely worthwhile.

In the Node.js ecosystem, there's A LOT of ORMs to choose from, and the community has not landed on a go-to yet. We've decided to cover [Prisma](https://www.prisma.io/) in the curriculum because of its popularity and community support.

Prisma has all the features we need to complete this curriculum and then some. Prisma is just a library which you will `npm install` and use. Let's discuss some of its features. Then will link to some official Prisma guides to get you started.

### Prisma Schema

The Prisma schema is a file where you will define your models. For example, consider a message table in a chat app:

```text
model Message {
   id        Int      @id @default(autoincrement())
   content   String   @db.VarChar(255) 
   createdAt DateTime @default(now())
   author    User     @relation(fields: [authorId], references: [id])
   authorId  Int     
}

model User {
   // user's fields
}
```

There's a bunch of new stuff up here. Prisma schema files are written in Prisma Schema Language. You can see how not only there are column definitions for the table, but also a relation to another table defined within the `Message` model. You'll learn more about this in the assignment readings.

This schema file lives in your codebase and is tracked by version control. You can probably guess by now, just how useful this is.

### Prisma client

The client is a separate library that you will use to interact with your database. The Prisma client is a bit special in that it's customized to your schema. Um... what?

```javascript
// instantiate the client
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

// when creating a new message
await prisma.message.create({
   data: {
      content: 'Hello, world!',
      authorId: 1
   }
})

// when fetching all messages
const messages = await prisma.message.findMany();
```

Notice `prisma.message` object? How did Prisma know that there's a `message` model? Once you create or update the schema file, all you have to do is run

```bash
npx prisma generate
```

in the cli, and Prisma will generate the client for you. The client can handle all sorts of querying: joins, filters, sorting, pagination, and more.

You might have a complex query that you just are unable to get right via the Prisma client, or you feel more comfortable in writing a query raw, you can do that too. Prisma supports raw queries as well.

### Prisma migrate

Prisma migrate is a tool that helps you perform database migrations. You won't be using it a whole ton in the curriculum, but it's good to be aware of it. When you decide to change the schema in anyway, you run a prisma migration to apply schema changes to the database. These changes are tracked in a `migrations` folder in your codebase.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Go through the [get started guide for relational databases](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases-typescript-postgresql). It covers migrations, schema, and the Prisma client. Make sure you select "JavaScript" as the language and "PostgreSQL" as the database.
1. Read the following articles from Prisma's documentation. Try to code along with the examples. Don't worry if things don't stick yet, we'll be practising A LOT of prisma in the coming projects.
   - [What is Prisma ORM?](https://www.prisma.io/docs/orm/overview/introduction/what-is-prisma),
   - [Prisma schema overview](https://www.prisma.io/docs/orm/prisma-schema/overview)
   - [Data models](https://www.prisma.io/docs/orm/prisma-schema/data-model/models)
   - [Relations](https://www.prisma.io/docs/orm/prisma-schema/data-model/relations)
   - [Prisma client CRUD](https://www.prisma.io/docs/orm/prisma-client/queries/crud)
   - [Raw queries](https://www.prisma.io/docs/orm/prisma-client/queries/raw-database-access/raw-queries)
   - [Prisma migrate getting started](https://www.prisma.io/docs/orm/prisma-migrate/getting-started)
   - [Prisma migrate mental model](https://www.prisma.io/docs/orm/prisma-migrate/understanding-prisma-migrate/mental-model)
   - [Data migrations](https://www.prisma.io/docs/orm/prisma-migrate/workflows/data-migration)

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are some of the challenges of using raw sql?](#challenges-with-raw-sqlin)
- [What is Prisma schema and how is it useful?](#prisma-schema)
- [What is the Prisma client?](#prisma-client)
- [How does Prisma client know about the models in your schema?](#prisma-client)
- [What is Prisma migrate?](#prisma-migrate)
- [How do you define a relation in Prisma schema?](https://www.prisma.io/docs/orm/prisma-schema/data-model/relations)
- [How can you get all records from a table using Prisma client?](https://www.prisma.io/docs/orm/prisma-client/queries/crud#get-all-records)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
