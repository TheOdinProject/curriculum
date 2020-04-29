The aim of this project isn't to learn html and css inside out, and Rails is big enough that we don't need another distraction. Therefore for this tutorial we will use a popular css framework called (Bulma)[https://bulma.io].

Bulma does come with a rails gem that would allow us to import it using the asset pipeline, but this is a good opportunity to use yarn to add the package from npm and to use webpacker to compile it.

Bulma comes in two flavours, either a css file or an scss one. The main difference is that you will need to use the scss one if you want to customise any variables bulma uses to give different elements their look and feel. We will import the scss one for this project.

#### Step 1.1: Add Bulma

Make sure the terminal is in your Rails odin_chat project folder and then type

```bash
yarn add bulma
```

It may take a couple of moments to compile everything. Once it is done bulma will have been added to your node_modules directory.

#### Step 1.2: Create a styles scss directory

Then entry point for our webpack compilation is the app/javascript/packs/application.js file, if we want to compile anything using webpack it has to be referenced in there somewhere. We could import bulma there, and that might be suitable for this project which won't have a lot of moving parts. However in a larger application the application.js file can quickly become clustered if add everything directly there. Another way would be to create a file to import bulma and import that file into application.js. It may seem unnecessary now, as we are just adding another layer of indirection to the import, but as we import further files in the future that relate to styling, they can be added to the styles file and our application.js file will still have just that one import.

Where should we create this file?

For now we will place it in the app/javascript directory. If we had a lot of different styling files, for example if we wanted to add lots of setup configuration to our scss imports it may be better to create an app/javascript/styles directory for all the styling files. As we have just one we can just place it in the javascript directory itself.

As we are importing the bulma scss file we should create a styles scss file. In app/javascript create a file called `styles.scss`

#### Step 1.3: Import Bulma

Open up your `styles.scss` file and add the following line

```css
@import '~bulma/bulma'
```

The `~` in the import statement refers to node_modules directory. So inside node_modules it looks for a directory called `bulma` and inside `bulma` it looks for a file called `bulma`. As our file is an scss one it will look for a file ending with `scss` or `sass`. In this case there is a bulma.sass file. That file then imports all of the sass files with the bulma stylings inside.

You can take look yourself in your own node_modules folder if you like. Be prepared to do a bit of scrolling around as node_modules directories are well known for their size.

#### Step 1.4: Import the styles into the application.js file

Open up your app/javascript/packs/application.js file under the require statements add

```js
import '../styles'
```
