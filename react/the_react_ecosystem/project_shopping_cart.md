### Introduction

By now you've come far from your React-baby days, with tools like routers and testing frameworks under your belt. You still have a longer way to go. It's a great time to put these concepts to use with a classic project - a mock shopping cart.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  Create a new React Project.
2.  Think about the component and the folder structure. How could you set up your application? Which components or functionalities do you need? It's a good idea to note this down somewhere you can easily get to and refer back and add to it to keep track.
3.  You should have at least two pages (a homepage and a shop page, which includes your shopping cart). Let a user navigate between the pages with a navigation bar, which will be shown on both routes.
4.  To your homepage, you can add whatever you'd like! A few images or information will be totally fine; it doesn't have to be something fancy - it's to test the concepts taught thus far.
5.  The same navigation bar should show up on the shopping cart route, which displays the number of items currently in the cart. You should also have a button next to it where you can go to the cart to checkout and pay (however we are not going to implement this logic here).
6.  Build individual card items for each of your products. Display an input field on it, which lets a user manually type in how many items they want to buy. Also, add an increment and decrement button next to it for fine-tuning. You can also display a title for each product as well as an "Add To Cart" button. These card items **need to be fetched** from an external API. You can use this [FakeStore API](https://fakestoreapi.com/) or something else.
7.  Once a user has submitted their order, the amount on the cart itself should adjust accordingly.
8.  Make sure to test your app thoroughly using the React Testing Library. Take care that you don't directly test `react-router-dom`, since it is an external library and the developers working on it must have tested the library already.
9.  As usual, style your application so you can show it off! You have a host of options provided, already.
10. Lastly, it's time to deploy it! Depending on what hosting solution you're using, you may need some additional configuration.
    1.  **Netlify** or **Cloudflare Pages**: You need to add a `_redirects` file at the root of your project. Copy the following to redirect all routes to the index page and let `react-router-dom` handle the rest. 

    ~~~txt
    /* /index.html 200
    ~~~

    2. **Vercel**: You need to add a `vercel.json` file at the root of your project and copy the following configuration. Similar to Netlify, this redirects all routes to the index page and lets `react-router-dom` handle the rest.

    ~~~json
    {
      "rewrites": [
        {
          "source": "/(.*)",
          "destination": "/index.html"
        }
      ]
    }
    ~~~

    You can learn more about how these work at the [Netlify](https://docs.netlify.com/routing/redirects/), [Vercel](https://vercel.com/docs/frameworks/vite#using-vite-to-make-spas) and [Cloudflare Pages](https://developers.cloudflare.com/pages/platform/redirects/) docs.

</div>