### Introduction
We have one thing to attend to before progressing in our web development journey. We are putting in all of this hard work to make great projects, so naturally we want to show them off to the world, right? In future lessons, we will be **deploying** our applications to a cloud platform, Heroku. Heroku will enable us to run, build, and operate our web applications in the cloud!


<div class="lesson-note" markdown="1">

### Important!

Starting November 28, 2022, Heroku will stop offering their free product plans (which includes deployment). You can read more on [their blog post](https://blog.heroku.com/next-chapter).

We will be replacing the following instructions with an alternative soon.

</div>

### Step 1: Create a Heroku Account

Go to the [Heroku website](https://www.heroku.com/) and create an account using the same email address you used for GitHub and Git.

### Step 2: Heroku CLI

Activate your account from the email they sent you. Now, we'll install the Heroku command line so that we can interact with the Heroku service. We will use `curl` to download a script and run it to install the Heroku CLI. This script may ask for your `sudo` password, this is expected. Go ahead and type it in after running the command below.

Run this command:

~~~bash
curl https://cli-assets.heroku.com/install.sh | sh
~~~

Then, type `heroku version`, which should return something similar to `heroku/7.5.1 linux-x64 node-v10.5.0`.

If you are using a Mac that uses the [Apple M1 Chip](https://www.apple.com/newsroom/2020/11/apple-unleashes-m1/), and have any issues running the above command instead check the Mac install instructions on [the Heroku CLI install page](https://devcenter.heroku.com/articles/heroku-cli) and try the Mac command of

~~~bash
brew tap heroku/brew && brew install heroku
~~~

### Step 3: Add your SSH Key to Heroku

Adding your SSH key lets Heroku know what machine the commands are coming from, similar to how GitHub uses SSH keys.

In your terminal, type

~~~bash
heroku keys:add
~~~

Next, press `y` and then `Enter`. Now, type in the email address you used to create your Heroku account and press `Enter`. Then, type in the password for your Heroku account. Next, press `y` and `Enter` to allow Heroku to upload your public SSH key.

The terminal may read `Invalid credentials provided`. Just press any key and the Heroku website will open in your browser. Log in with the information you created your account with, and the terminal will reappear and accept your public SSH key.

### Conclusion

At this point, we have the necessary setup to deploy our web applications to the internet. You could say... we are _prepared for deployment_. The only thing left to do is continue on with your web development journey by moving on to the next lesson.
