
## How to add your solution to the curriculum

### 1 The easy way (through your browser)
* [Video](https://www.youtube.com/watch?v=V74l_zS1x8E)
* [Article](https://help.github.com/en/articles/editing-files-in-another-users-repository)

### 2 The more involved but proper way
* [Video](https://www.youtube.com/watch?v=mENDYhfxH-o)

#### Short description of the proper way

* Fork the original repository
* Clone the forked repository to your local system
* Make changes to files
* Add the files to the staging area (`git add .`) and then commit the files (`git commit -m "your message"`)
* Add the original repo as a remote, so you can pull from it (`git remote add upstream git@github.com:<USER>/<REPO>.git`)
* `git pull upstream <BRANCH>` (usually the branch is master)
* Resolve any merge conflicts
* `git push origin`
* Go to the original repo and open a pull request

#### All of this is described in detail in the video above!