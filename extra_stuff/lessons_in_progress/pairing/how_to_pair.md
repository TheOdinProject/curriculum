# How do we Pair?

## Tools
For best pairing between two people, we recommend using a tool called [Screenhero](http://www.screenhero.com). Screenhero is like Skype for screen sharing and lets you interact remotely with the other person's computer for free. It includes both screen sharing and voice.  It's just one-click-to-call, allowing you to talk while you're working together on the same code on one of your computers... remotely!

Combining being able to talk with someone and being able to see and interact with the same computer is what makes pairing work.  

You could do it using just chat but it's not close to the same experience.  It's probably not necessary (and a waste of bandwidth) to have a separate video feed going at the same time either.

### Setting up ScreenHero

Setting up ScreenHero: Download the free client at [Screenhero.com](http://www.screenhero.com), set up your account, and "call" your partner to start sharing your screen and allowing your partner to interact with it.  You'll see two mice and you'll both be able to use your keyboards to interact with the shared computer.  Cool!

There is a button that allows you to activate the voice portion of the call.  If that doesn't work well, try using Skype for voice instead.

Once you are able to talk to each other and you can both work on one of your screens, it's time to get coding!


### Google Hangouts

Sometimes a program just won't work properly so you need to go to Plan B.  In our case, we usually recommend [Google Hangouts](http://www.google.com/+/learnmore/hangouts/) because it has both audio and screensharing/remoting tools baked into one.  The bandwidth usage isn't quite as efficient as Screenhero (Screenhero) but should work fine for your purpose.  You'll need to sign up for Google Plus and add the extension to the Chrome browser to get it to work.

[This tutorial](http://www.techrepublic.com/blog/google-in-the-enterprise/quick-tip-set-up-a-google-hangout-for-web-conferencing/2064) describes setting up a hangout session, though they don't get into the actual remote pairing side of things.  **Basically, just click [this link](https://plus.google.com/hangouts/_/) to open a new hangout once you've got the plugin installed.**

The easy way is to just screenshare the code, which means one person will be the driver by default and the other will be the navigator (since it's a one-way screen share not a remote desktop).  When it's time to switch, push your code up to Github and have the other partner pull it down from that repository.

A slightly more interactive way is by using the Hangouts feature called Remote Desktop, which lets your partner use your computer like maybe you've experienced before with tech support.  You'll usually have to activate that feature once you're inside the hangout by clicking on it on the lefthand sidebar.  If it's not there, you may need to click on the three-dots icon on that same sidebar and then click "Add Apps" and find Remote Desktop yourself.

The downside is that you can't really do a good fullscreen session with Google.

#### Additional Google Hangout Resources

Here's a [Google Hangout tutorial (video)](http://www.youtube.com/watch?v=Tt_86-SrBX0) and another on [using Hangouts to screen share](http://www.youtube.com/watch?v=mvpFsmcfz1k).  

Check out [this how-to video](http://www.youtube.com/watch?v=3XeCQrPZQ6Y) to familiarize yourself with Remote Desktop.

Here's an older video on [How To Use Google Hangouts](http://www.youtube.com/watch?v=7K06lHu4gDk).

### Nitrous.io

We've already mentioned [Nitrous](http://nitrous.io) as a development environment, but it also works great for collaboration.  You'll probably want to run a Google Hangout simultaneously so you can chat and look at one person's screen, but what's cool about using Nitrous is that you can both be logged into their web-based IDE and looking at the same code base.

That means you can both type and explore and run it at the same time.  You can invite as many people as you want to collaborate as well.

See [this support article](http://help.nitrous.io/collab/) to learn more about collaborating with Nitrous.

### Apple Screensharing

Another alternative, as described in [this blog post](http://remotepairprogramming.com/post/43644506226/remote-pair-programming-technology), is Apple's native Screen Sharing app (combined with Skype).



## Techniques

There are a few different techniques for how to manage the actual process of pairing.  If you stick with Time Swapping and use an actual online timer, you can't go wrong.  It's the best defense against keyboard hogs.

* **Time swapping:** Spend 25 minutes as the driver, then swap roles. Try using a free online timer [like this one](http://tomato-timer.com/) set to 25 minutes.
* **Ping Pong:** If you're using a test-driven approach, one person writes the failing test then the other person makes it pass. Swap roles for the next test or batch of tests.

## Some tips:

* Think out loud as much as you can -- give each other a chance to hear your thoughts.
* No distractions! Emailing, texting, etc. should all be turned off while pairing.
* As navigator, wait 10 seconds before pointing out a typo... give the driver a chance to correct on their own

## After You've Finished

When you're done with your session, you've got code sitting on someone's computer that you'd both like to have.  If you're using git to save your work and push to a github repo, just make sure the repo is public and both of you will have access to it or be able to fork it as necessary (a good incentive to start using git...).

If you aren't using git yet, just have the student with the code on their hard drive email out the files or a .zip archive of them to make sure both people have it. 

If you're now really curious about git, check out the git section of [Web Development 101](/web-development-101/git-basics) for an introduction to this incredibly important tool.

## Additional Resources

* WikiHow has a solid entry explaining [how to pair program effectively](http://www.wikihow.com/Pair-Program).
* Check out this [Slideshare about pairing](http://www.slideshare.net/rogercafe/pair-programming-presentation)
* To see real pairing sessions in action, check out [these recordings](http://www.youtube.com/playlist?list=PLjbL0BCR04Q1-x5p5L5V11Vm58VlTgPzw)

