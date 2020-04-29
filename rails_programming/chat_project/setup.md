### Getting Started

#### Step 1.1: Creating the initial application

Let's get this party started. Make sure you are in a suitable directory in your terminal to create a Rails project, maybe you have a Projects folder or similar.

Open a terminal and navigate to the right directory and then run:

```bash
rails new odin_chat -T
```

The `-T` option tells Rails to create an app without the testing directory. By default Rails uses the minitest library to test applications but we are going to be using RSpec. A very popular testing library.

Then run:

```bash
cd odin_chat
```

#### Step 1.2: Version Control

We should get into good habits with version control now. Commiting changes as we go will allow us to take a step back if we make a mistake in your code. This can save you huge amounts of time trying to unravel breaking changes you've made to your code. Even for your personal projects you should practice good version control habits.

Rails initializes a git repository for us within the Rails project folder.

Let's make our first commit

```bash
git add .
git commit -m "initial commit"
```

### Step 2: Exploring the app

Now is a good time to explore the rails application default structure to get a feel for the structure and where different components of the app live.
