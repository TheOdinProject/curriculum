### Introduction

Congratulations, you have made it to the very first React project. In this project, you will be creating a small CV application. It's a great project to get you started because it includes many of the basic concepts you've learned so far, without a huge overhead of complexity.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Create a new React project.
1. Think about how to structure your application into components. Your application should include:
    1. A section to add general information like name, email and phone number.
    1. A section to add your educational experience (school name, title of study and date of study)
    1. A section to add practical experience (company name, position title, main responsibilities of your jobs, date from and until when you worked for that company)
1. Be sure to include an edit and submit button for each section or for the whole CV. The submit button should submit your form and display the value of your input fields in HTML elements. The edit button should add back (display) the input fields, with the previously displayed information as values. In those input fields, you should be able to edit and resubmit the content. You're going to make heavy use of state and props, so make sure you understood those concepts.
1. Create a `components` directory under your `src` directory and add your components.
1. Include a `styles` directory under your `src` directory for your CSS files. You'll need to import these in the component files to use them.
1. Push the results and deploy them with any of the options mentioned below. At this point of the curriculum, it doesn't matter which platform you choose as long as your project is live on the internet!

</div>

### Deploying a React app

While we have been using GitHub Pages to deploy our **static webpages** till now, and we can definitely continue to do so with hacky ways, it's far easier to let a PaaS (Platform as a Service) do the same for us! There are a lot of options to host such sites, and the [Vite hosting docs](https://vitejs.dev/guide/static-deploy.html) go over the most popular ones among them.

Not only do some of these get rid of additional steps after pushing our code to GitHub as these services have tools that automatically *deploy on push*, but you also don't have to worry about other issues further down the curriculum, like routers and build steps. We shall use a few selected options for now. Once you are done with the assignment, choose one of the following options, and deploy!

---

### Netlify

While there are many ways to deploy to Netlify, like uploading your `dist` directly or using [Netlify's `netlify-cli`](https://docs.netlify.com/cli/get-started/) CLI, the most convenient way would be to directly import your GitHub repository to Netlify.

1. Push your React application to GitHub.
1. [Import your project](https://app.netlify.com/start) to Netlify by logging in, and selecting your repository.
1. Select the branch to deploy from (the default setting, from `main`, works) and hit "Deploy site"!
1. You can access more settings here if you need to!

#### Netlify Links

- [Homepage](https://www.netlify.com/)
- [Documentation Website](https://docs.netlify.com/)
- This [section of the Vite docs](https://vitejs.dev/guide/static-deploy.html#netlify-with-git) has a similar brief guide for deployment

---

### Vercel

Similar to Netlify, Vercel also offers a few ways to deploy, but we will be importing our GitHub repository to get benefits like deploy-on-push.

1. Again, push your React application to GitHub.
1. [Import your project](https://vercel.com/new) to Vercel.
1. Vercel will automatically detect that you are using Vite. Set your name as you like, and hit "Deploy"!

#### Vercel Links

- [Homepage](https://www.vercel.com/)
- [Documentation Website](https://www.vercel.com/docs)

---

### Cloudflare pages

1. Yes, push your React application to GitHub.
1. Create a new Cloudflare account and log into it.
1. Under "Account Home", select "Workers & Pages" > "Pages" > "Connect to Git".
1. Connect to GitHub and select your GitHub repository.
1. Under "Set up builds and deployments", set `npm run build` as the build command, and `dist` as the build output directory.
1. Under "Environment variables (advanced)" > "Add variable", add a variable named `NODE_VERSION` and set its value to be the version number of Node that you are using. You can find this by executing `node -v` in your terminal.
1. Hit "Save and Deploy" and watch it come to life!

#### Cloudflare Links

- [Homepage](https://pages.cloudflare.com/)
- [Documentation Website](https://developers.cloudflare.com/pages)
- This [section in the Cloudflare docs](https://developers.cloudflare.com/pages/framework-guides/deploy-a-vite3-project/) discusses these very steps
