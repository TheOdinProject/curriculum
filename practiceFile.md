Initial setup
Read the TOP contributing guide for the project.
Navigate to the curriculum repository and fork the original (“upstream”) repository into your own GitHub account by using the “fork” button at the top of that repo’s page on GitHub.
Clone your forked repository onto your local machine using something like git clone git@github.com:your_user_name_here/curriculum.git (you can get the url from the little widget on the sidebar on the right of that repo’s page on GitHub).
Because you cloned the repository, you’ve already got a remote that points to origin, which is your fork on GitHub. You will use this to push changes back up to GitHub. You’ll also want to be able to pull directly from the original repository on GitHub, which we’ll call upstream, by setting it up as another remote. Do this by using the git command below inside the project folder curriculum:

TLDR:
fork it, clone the fork into a folder on your computer, cd into the fork, then continue...

1. git remote add upstream git@github.com:TheOdinProject/curriculum.git (this makes sure we always have access to the upstream/original (not fork))

//THEN: 

2. Create and enter the new branch and make whatever changes you want before adding and committing them
git checkout -b <practice-features>
touch <practicefile.md> //you can edit, add, do whatever with existing and new files
git add practicefile.md //OR if you have multiple, just git add . (you know this)
git commit -m 'message about the add'

3. Prepare the main by going into it and adding the upstream(original where we cloned our fork from) and merging it to create an updated main
with any features that may have been added to the upstream while making our edits
git checkout main
git pull upstream main //equivalent to: git fetch upstream then git merge upstream/main

4. Go back to branch and merge the updated main to the branch to create the new branch
git checkout <practice-features> 
git merge main

5. Now push our pull request and cosider yourself an OpenSource Contributor: 
git push upstream <practice-features>

but since this tutorial, we don't have access to the upstream ie TheOdinProjects folders on github, lets just push to our origin (our fork)
git push origin <practice-features>