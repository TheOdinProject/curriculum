### Introduction

Alright! Let's flex our skills a little! The section was humongous, and you learned a *lot* of things. The only way to make it stick is to practice!

For this project you are going to create an Inventory management app for an imaginary store. It's up to you what kind of business this is -- you could be managing groceries, car parts, baby-toys, musical-instruments, ponies or anything!

Your Inventory app should have categories and items, so when the user goes to the home-page they can choose a category to view, and then get a list of every item in that category. You should include all of the CRUD methods for both items and categories, so anybody that's visiting the site can Create, Read, Update or Delete any Item or Category.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Set up an Express project and a new PostgreSQL database.
1. Before you begin, take a moment to write down all of the database tables and its fields you'll need, as well as the relations between them. For example:
    1. In a game management app, there can be a game, genre, and developer entity. A game can have one or multiple developers and genres. Similarly a developer can develop multiple games.
    1. In a pokemon management app, there can be a pokemon, trainer and a type entity. Each pokemon must be contained in a type. While a trainer can have multiple pokemons.

    Any sufficient inventory app will have relations and constraints against its entities. Figure out these database particulars for your inventory app.
1. Set up the routes and controllers you're going to need.
1. Create all of the 'READ' views (i.e. view category, and view item).
1. Create all the forms and build out the controllers you need for the create and update actions.
1. Figure out the delete functionality. What happens if you try to delete a category with items in it? Should it delete all the items as well? Should it just remove the category from the items? Or something else? This specific behavior will depend on your app's requirements.
1. Once you're confident with your project, add dummy data via a script to your local database. Do this again when you deploy.
1. Deploy it and show off what you've done!

#### Extra credit
1. Make it pretty!
1. We will learn about creating users with secure passwords in a later lesson, but for now we don't want just *anyone* to be able to delete and edit items in our inventory! Figure out how to protect destructive actions (like deleting and updating) by making users enter a secret admin password to confirm the action.

</div>
