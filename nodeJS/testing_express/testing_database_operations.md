### Introduction

When the code that you are testing has to touch a database, the amount of setup that you have to do gets quite a bit more complicated. Obviously, you don't want to run your testing code on your production database because of the risk of compromising your users' data. In this lesson, we'll touch on how to deal with databases in unit and integration testing environments.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Cover unit and integration tests in the context of an Express server.
- Create and use a separate database for integration testing.

### Unit tests - do you even need to?

Before diving in, you might want to consider whether or not the database operations you're testing even need to be tested in the first place. If you are reading and writing straight from a database using `pg` or some other db module, you might not really need to test that code. [pg's GitHub repo's tests directory](https://github.com/brianc/node-postgres/tree/master/packages/pg/test) (and presumably all other popular db modules) already has plenty of tests for all of its actions, so if you are just serving up a JSON API and all you're doing is leveraging functions from another module then those operations are already covered.

If your queries are complicated, you might justify adding unit tests to make sure that you are using them correctly and that the code you have written is doing what you intend it to, and if you are using any of your own code to do some filtering, sorting, or other manipulations of the data you will want to test that as well.  In the case of your own code, however, it would be better if you could pull those things out into their own modules, separate from your database operations so you can test them without messing with the database.

### Integration tests

There are cases, however, when you are going to want to test things that touch your database. For example, we performed an integration test on the server in the [Testing Routes and Controllers lesson](https://www.theodinproject.com/lessons/nodejs-testing-routes-and-controllers) using `supertest`.

Create a separate database for testing; prefix it with a `test_` for you to easily identify with. You might want to run a prisma migrate by swapping out the test database url. Afterwards, use a seed script on this database instance, or you could manually insert data in a `beforeAll` function in your test suite.

We'll leverage environment variables for your codebase to identify which database to use. First, add the test database in your `.env` file:

```properties
NODE_ENV=development
DATABASE_URL=postgresql://<user>:<password>@localhost:3306/inventory_application
TEST_DATABASE_URL=postgresql://<user>:<password>@localhost:3306/test_inventory_application
```

Next, setup appropriate npm scripts in your `package.json` file:

```json
{
  // other stuff
  "scripts": {
    "dev": "NODE_ENV=development && node app.js",
    "test": "NODE_ENV=test && jest"
  },
  // even more stuff
}
```

Based on the `NODE_ENV`, you can programmatically switch out database urls:

```javascript
const databaseUrl = process.env.NODE_ENV === 'test'
  ? process.env.TEST_DATABASE_URL
  : process.env.DATABASE_URL;

const prisma = new PrismaClient({
  datasources: {
    db: {
      url: databaseUrl,
    },
  },
});
```

Voila, the setup is complete. Now shoo... go get testin'.

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [When should you unit test database operations?](#unit-tests-do-you-even-need-to)
- [How do you set up and use a test database for integration testing?](#integration-tests)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
