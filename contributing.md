
## How to add your solution to the curriculum

### 1 The easy way (through your browser)
* [Video](https://www.youtube.com/watch?v=V74l_zS1x8E)
* [Article](https://help.github.com/en/articles/editing-files-in-another-users-repository)

### 2 The more involved but proper way
* [Video](https://www.youtube.com/watch?v=mENDYhfxH-o)

#### Short description of the proper way

* 1. Fork the original repository
* 2. Clone the forked repository
* 3. Make changes to files
* 4. Add the files to the staging area (`git add .`) and then commit the files (`git commit -m "your message"`)
* 5. `git remote add upstream git@github.com:<USER>/<REPO>.git`
* 6. `git pull upstream <BRANCH>` (usually the branch is master)
* 7. Resolve any merge conflicts
* 8. `git push origin`
* 9. Go to the original repo and open a pull request

* All of this is described in detail in the video above!