### Introduction

Data persistence is integral to the vast majority of web applications. Data persistence is achieved through databases. Being able to understand how to structure, build, and query your own database are important skills for any full-stack developer to have.

For example, consider The Odin Project. Where is your username stored? Where are project submissions stored? Where does this lesson content, the one you're reading right now, get stored? Yes, a database!

We've chosen [PostgreSQL](https://www.postgresql.org/) as our database of choice for the curriculum. All SQL knowledge that you've learned in the earlier course should be transferable to PostgreSQL. We'll also learn new PostgreSQL specific things. Watch through this [fun and short introduction video to PostgreSQL by Fireship](https://www.youtube.com/watch?v=n2Fluyr3lbc).

<div class="lesson-note lesson-note--critical" markdown="1">

#### Complete the SQL course

Make sure you've completed the [SQL course](https://www.theodinproject.com/paths/full-stack-javascript/courses/databases).

This lesson and all subsequent lessons will assume you understand SQL syntax and concepts.

</div>

In this lesson, we'll install PostgreSQL and in the next lesson we'll learn how to use it in our Express application.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- The PostgreSQL shell.
- How to install PostgreSQL.

### PostgreSQL shell

The PostgreSQL shell, also known as psql, is a terminal-based front end to PostgreSQL that allows users to interactively execute SQL queries and manage the database.

It is typically included with the PostgreSQL installation and can be accessed through the command line. Its scope includes running queries, creating and modifying database structures, and interacting with the database in a command-line environment, psql provides a number of meta-commands and various shell-like features to facilitate writing scripts and automating a wide variety of tasks.

The database using the psql terminal is located inside the file system or local machine, as PostgreSQL stores databases in ordinary files within the filesystem. The default location of the data directory may vary between different operating systems.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Depending on the OS you are running, follow the appropriate PostgreSQL installation guide below:
   - [Linux](https://github.com/TheOdinProject/curriculum/tree/main/nodeJS/express/installation_guides/postgresql/linux.md "PostgreSQL installation for Linux")
   - [MacOS](https://github.com/TheOdinProject/curriculum/tree/main/nodeJS/express/installation_guides/postgresql/macos.md "PostgreSQL installation for MacOS")

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why is data persistence important in web applications?](#introduction)
- [What is the PostgreSQL shell?](#postgresql-shell)
