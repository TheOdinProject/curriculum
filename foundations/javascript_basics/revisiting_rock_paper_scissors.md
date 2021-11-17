### Assignment

<div class="lesson-content__panel" markdown="1">

1. Go back to your "Rock Paper Scissors" game from a previous lesson and give it a simple UI. Before we proceed, we need to get familiar with a very popular Git workflow. [Read this article](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) for everything that you need to know for now.  
   a. The above article shows us how to use a "fork and branch" workflow to contribute to another user's repo. But since we'll be adding a new feature to our own repo, we don't need to make a fork or add a remote since we already have it set up. We can start with the 'Making a branch' step.  
   b. Since we'll be making a UI for our Rock Paper Scissors game, make a new branch and switch to it with the command `git checkout -b rps-ui`  
   c. You are now working in the `rps-ui` branch, locally. However, this branch does not exist in your remote repo yet. If you go to your github repo page, you'll see that you only have 1 branch, which would be `main`. Let's push this new branch to your remote repo with the command `git push origin rps-ui`. Now, you'll see two branches in your Github repository!  
   d. You can now make changes in this branch without worrying about your old code. It will be safe and untouched in the `main` branch. You can think of the main branch as the 'production' branch, which will be the most tested, stable version of our code, and our `rps-ui` branch as a 'development' branch where you're experimenting or trying to implement a new feature without messing up our stable production code. You can see how this process is very convenient for working on a new feature without fear.  
   e. Make sure you are on the `rps-ui` branch. You can check this, with the `git branch` command. The branch you are currently on will have an (\*)asterisk next to it. If you're in another branch for some reason, switch to `rps-ui` with the command `git checkout rps-ui`. Now you're all set to work on your new feature! Note: You can add files, commit to this branch, and push changes to your repo, just like you would with the main branch. Everything is the same except when you push the changes, you'd use `git push origin rps-ui` instead of `git push origin main`, since we're pushing to our new branch.  
2. In our UI, the player should be able to play the game by clicking on buttons rather than typing their answer in a prompt.  
   a. For now, remove the logic that plays exactly five rounds.  
   b. Create three buttons, one for each selection. Add an event listener to the buttons that calls your `playRound` function with the correct `playerSelection` every time a button is clicked. (you can keep the console.logs for this step)  
   c. Add a `div` for displaying results and change all of your `console.log`s into DOM methods.  
   d. Display the running score, and announce a winner of the game once one player reaches 5 points.  
   e. You will likely have to refactor (rework/rewrite) your original code to make it work for this. That's OK! Reworking old code is an important part of the programmer's life.  
   f. Once you're all done with your UI and make sure everything's satisfactory, it's time to merge our current branch `rps-ui` to our main branch.  
3. Now let's take a look at how we can merge these changes back to our `main` branch.  
   a. [Watch this short video](https://www.youtube.com/watch?v=S2TUommS3O0) to get an idea of what we'll be doing. You don't need to worry about merge conflicts for now, as this will be very unlikely when you're working on your own and not collaborating with a team of developers.  
   b. As mentioned in the video, let switch to the branch we want to merge INTO i.e. `main` with the command `git checkout main`  
   c. Now let's merge our `rps-ui` branch into `main`, our current branch with `git merge rps-ui`.  
   d. If everything goes fine, our `rps-ui` branch is now successfully merged with main! Use `git log` and you'll see all the commits you've made to your feature branch on top of the commits you made to the main branch. Now for our final step!  
   e. Let's push our `main` branch into our remote repo by running `git push origin main` . Go to your Github repo and you'll see that our `main` branch will have all the changes and commits you made to the `rps-ui` branch. Congratulations! You've successfully pushed your first feature into your production branch!  
   f. Now that we have all our code in the main branch, we don't really need our `rps-ui` branch anymore. Let's do some cleanup, both locally and in the remote repo. Delete the branch from our local repo with `git branch -d rps-ui` and also delete it from the remote repo on Github with `git push --delete origin rps-ui`. Congrats, we're all done with our cleanup!

</div>
