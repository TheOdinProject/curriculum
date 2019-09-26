### Create your project on your computer first
1. In your command line create a new folder called "testing_git"
2. Go into this new folder `cd testing_git`
3. Now we will initialize it with git by entering `git init`
4. Go to github and create a new repository, name it `testing_git` **Note: It's important to your repository the same name as the name of the folder you created on your local machine.**
5. Check the initialize with read me option and create the new repository. This will redirect you to your new repo on Github.
6. Back on your command line enter `git remote -v` notice that its empty. This project isn't connected to any remote github repositories. Lets fix that.
7. Go to the testing_git repository on github and copy and paste the url. Back in your command line enter: `git remote add origin` followed by the url you copied. The full command will look something like this: `git remote add origin https://github.com/yourname/testing_git`
**Note: `origin` will be the name of your remote connection, you could call it anything you want but origin is convention.**
8. Enter `git remote -v` again, you should now have a connection to your remote github repository.  
