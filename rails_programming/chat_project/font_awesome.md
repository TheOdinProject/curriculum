Before moving on to editing and deleting rooms let's look at another tool we can use to enhance the look and feel of our site, (Font Awesome)[https://fontawesome.com/].

Font Awesome is an amazing library of icons and social logos and they even allow the use of some icons for free. Why look at it now in the middle of working on the rooms? Simply because editing and deleting rooms from the index page would look even better with an icon to click and gives us another chance to look at installing a package using yarn.

Whenever you are looking to install a package you should always first refer to its docs. For smaller projects the docs may simply be in the Github README but larger projects with a lot of features usually have their own site to read and search through the documentation.

If you navigiate to the (Font Aweomse)[https://fontawesome.com/] homepage then a good place to start is funnily enough the start link found in the top navigation page. Click that and then on the start page have a scroll down and look at the options available to us. There should be a Yarn icon that you can click. Perfect!

The instructions for Yarn tell us to run

```bash
yarn add @fortawesome/fontawesome-free
```

Let's run that in the terminal of our Rails project folder.

Once complete you should see something like

```bash
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└ @fortawesome/fontawesome-free@5.13.0
info All dependencies
└ @fortawesome/fontawesome-free@5.13.0
Done in 5.27s.
```

This has downloaded the font awesome library to our node_modules folder as a package but we still need to import it into our project to be able to use the icons in much the same way that we needed to import Bulma before we could apply the stylings.

By continuing to read the start page, past the section on installing the pro version of font awesome it then tells you that in order to get it up and running you simply need to import the css.all file into the header section of any page in which you wish to use font awesome. As we are using webpacker we want to import it into our styles.scss file we made earlier for Bulma.

To reference the css.all file you would use an import statement like we did for Bulma.

```css
@import '~@fortawesome/fontawesome-free/css/all'
```

However if you do this and try to include an icon you'll receive a lot of errors in the terminal that look like `Module not found: Error: Can't resolve '../webfonts/fa-solid-900.woff2'`. The reason for this is that fontawesome uses webfonts to build the icons. They are kept in the fontawesome/webfonts directory and the css.all file uses a relative path to access it. When we import the css file into our styles.scss file all of the css is instead compiled by app/javascript/packs/index.js and using a relative path from that file can no longer find the webfonts directory.

The other way mentioned is to import the js.all file instead of the css file. We can't do this in the scss file because that is only for css so where should we import this instead? All javascript code is built from files found in the app/javascript/packs directory. If the javascript file was to be complex we might create a new one but as this is just an import statement we can use the index.js file in the packs directory.

All this is a JS file we don't use the `@import` command but we require the file. Also, as this is a javascript file webpacker includes the node_modules folder in the load path. So we don't need to reference it with `~` as we did with the css import statements.

Open the index.js file and underneath the import for ur styles.scss file let's require the fontawesome js file.

```js
require("@fortawesome/fontawesome-free/js/all")
```

There is one other way we could have imported the css we needed which I will just cover briefly as this is the way you may come across often. Instead of importing the css.all file fontawesome does give us the option to only import the files we need. To do this we first need to set an scss variable that fontawesome uses to point it to where the webfonts directory is located and we can then import the fontawesome scss file and the solid scss file. We need the solid file because the free icons all use the solid style.

You don't need to add the following code but only understand this is another way we could have done it. In the styles.scss file we could have added the following lines:

```css
$fa-font-path: "~@fortawesome/fontawesome-free/webfonts";
@import '~@fortawesome/fontawesome-free/scss/fontawesome';
@import '~@fortawesome/fontawesome-free/scss/solid';
```

The main benefits of this approach would be by only including the files we need we can reduce the file size of our css and by importing what is css code as css or scss files keeps a cleaner seperation of concerns. However we'll leave the js require statement as it is for this project.

Now that we've imported the code let's just do a quick test that it works. Open your app/views/static_pages/home.html.erb file and let's add the following line to the bottom of the file

```html
<i class="fas fa-camera"></i>
```

This is the way that fontawesome includes icons in html. the fas class stands for fontawesome solid which are the free styles we mentioned and fa-camera is the name of the icon. If you go to the fontawesome site you can search through all the icons to find ones you like. Just make sure you use the solid style icons otherwise they won't work with the free set fontawesome provide.

Boot up a server and load `localhost:3000` and hopefully you'll see a camera icon underneath the other text.

If you see it then fantastic, we're all set to start using font awesome icons in our application. If you aren't then when you load the homepage check the server logs to see if there are any compilation errors.

Remove the line in your home.html.erb file for the camera icon as we don't need that going forwards and let's keep moving forward.
