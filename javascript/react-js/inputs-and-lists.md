### Introduction

Now before we actually go any further, let's do a quick check of how well you understand the topic. Following I will describe the quick assignment, for those who want to try it themselves. I encourage everyone to at least try it yourself, if you've done the reading from the last lectures, you should be able to do it. And if not, you can always come back to this section, because we will discuss the assignment in detail together. Don't be disscouraged if you can't solve it, it includes some tricky parts that we haven't actually discussed so far.

Before you start, make sure you understood the concept of `state` and `props` from the previous lessons.

### Learning Outcomes

- Understanding how to render lists in React
- Understanding how to handle input fields and forms in React.

### Assignment

### DIY Guide

Our application will be made of two components, `App` and `Overview`. Your application should render an input field and a submit button. With the submit button you can add the content from your input to a tasks array managed in state. (We will use class components for this example, because we haven't learned about hooks yet). Finally, for each task in the tasks array an HTML list element should be rendered.

1. Run `npx create-react-app my-first-react-app`, `cd` into your project and open it. You can delete everything in the return statement of the App component and just return an empty `div`. You can also delete all the boilerplate React provides and just leave `index.js` and `App.js` in the src directory. Just make sure to clean up the import statements and the `serviceWorker` in the two remaining files. If you are overwhelmed with all those files, consider redoing Lecture 01.
2. Create a `components` folder in your `src` directory, which includes a files called `Overview.js`. `Overview.js` should just render all of our tasks, while `App.js` is going to handle the input field with all the logic.
3. Go implement it yourself. You can do it. For styling use Bootstrap or another CSS Framework if you're familiar with one, or leave it out. Styling isn't really the point of this lecture.
4. Quick tip: Use the Javascript function `map` to map over your tasks array. You will need to provide a unique key to each item. And there is a difference between handling input fields in plain Javascript and in React. Try figuring it out for your self, but don't worry we will go over it in detail here as well.

### Detailed Guid

1. Let's get started! First run `npx create-react-app task-app` in your terminal, and open the project in your text editor.

2. Delete all files in the src directory and just leave `index.js` and `App.js`.

3. Open your `App.js` file in your `src` directory and make sure it looks like this.

```javascript
// App.js

import React, { Component } from "react";

class App extends Component {
  render() {
    return <div>Hello World</div>;
  }
}

export default App;
```

1. Make sure to clean the `index.js` as well. It should look something similar to this:

```javascript
// Index.js

import React from "react";
import ReactDOM from "react-dom";
import App from "./App";

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);
```

4. For this tutorial we will also use Bootstrap, to make our application look a little bit nicer. For those who don't know how Bootstrap works, in short: It is a CSS Framework, that helps us style our html easily. You add the styling through classNames. So if you're not familiar with it, just ignore all the `className="someClassName"` type of code. Anyways for now let's include it in our code. Get the bootstrap CDN from their website [here](https://getbootstrap.com/docs/4.3/getting-started/introduction/). Just copy the link element under the CSS section, it should be the first. Then go to your `public` folder in your `task-app` and open the `index.html` file. Ignore the code in there for now, just paste the link you just copied **above** the `title` element and save the changes.

5. There we go, now go back to your `src` directory and create a new folder called components with one file in it. You can name the file `Overview.js`. This and our `App.js` file will be our main parts of the project. In `Overview.js` we will just display all our tasks, while the App component in `App.js` will contain all the logic and manage state. Don't forget to capitalize the names of your components. It doesn't change their functionality, but it is widely seen as a "best practice" to do so.

6. So finally let's write some code. First of all, in our `App.js` file, our class component should look like this.

```javascript
// App.js

import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();

    this.state = {
      task: "",
      tasks: [],
    };
  }

  render() {
    const { task, tasks } = this.state;

    return (
      <div className="col-6 mx-auto mt-5">
        <form>
          <div className="form-group">
            <label htmlFor="taskInput">Enter task</label>
            <input type="text" id="taskInput" className="form-control" />
          </div>
          <div className="form-group">
            <button type="submit" className="btn btn-primary">
              Add Task
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default App;
```

We mainly just created the skeleton of our component. First we imported React and Component from react, then we initialized the constructor. In the constructor we defined state with:

```javascript
this.state = {
  task: "",
  tasks: [],
};
```

We assigned `task` to an empty string, this will be the state handling what we type in our input field. And `tasks` will initially be set to an empty array. Later we include all our tasks here.
Also inside the render we destructured our state, in order to make our code look cleaner when using it.

After that we render a form element, with an `input` and a `button` element. As I said, don't worry about all the `className="form-group"` ect. attributes. Just copy past them if you don't want to learn Bootstrap. What they do is just style our html. For example the `className="btn-primary"` that we added to our `button` element insures that our button will be displayed with a blue background.

Ok so far so good, let's have a look at our application. Run `npm start` in your terminal to see what we already got. You should now see an input field with a label and a submit button. When you click the button nothing happens, the page only refreshes.

Let's add some functionality to it. Go back to your `App.js` component and add the following two functions. Make sure to add those functions between your constructor and the render method.

```javascript
handleChange = (e) => {
  this.setState({
    task: e.target.value,
  });
};

onSubmitTask = (e) => {
  e.preventDefault();
  this.setState({
    tasks: this.state.tasks.concat(this.state.task),
    task: "",
  });
};
```

Very good, but without calling those functions nothing will change in our application. So let's call them. The `handleChange` function will be our `onChange` handler for our input field. It just sets the current `task` in state to whatever we type in our input field. The `onSubmitTask` function instead, will be our `onSubmit` handler for our `form` element. The `onSubmit` handler of the form should be invoked by a click on our button.

In the `onSubmitTask` function we first call `e.preventDefault()` because we don't want the default behavior of refreshing the form anytime we submit it. After that we modify state.

The following line does the magic.

```javascript
tasks: this.state.tasks.concat(this.state.task),
```

It adds the task (whatever is in our input field by the time we submit the form) to our `tasks` array. Later we can map over this array to display all the tasks we submitted. Make sure that you **DON'T** directly assign state. That is also the reason we don't use the `push` method here. It would give us an error.
After that we just set our current task in state to an empty string, because we want our input field to be empty, to be able to add another task.

So far we haven't invoked those functions yet, so let's do that.
In your `App.js` component in your render method add an onChange handler to your input element like so:

```javascript
<input
  onChange={this.handleChange}
  value={this.state.task}
  type="text"
  id="taskInput"
  className="form-control"
/>
```

Notice that we also have to specify the `value` attribute for React input elements. In this case we want the value of the input field to be what we saved in our `task` state.
And also add the `onSubmitTask` function to our form element like so:

```javascript
<form onSubmit={this.onSubmitTask}>
  {/* Leave all your code. Just add the onSubmit handler to the form element, or
  as an onClick handler to the submit button, as you prefere */}
</form>
```

If you add an onSubmit handler to the form, your button must be of `type="submit"`, otherwise it won't work. Alternatively you can add an onClick event to the button which calls the `onSubmitTask` function

Great, if you run your application now with `npm start` (or just refresh the browser if you have it still running), you will still see no changes, except that the page doesn't refresh when you submit something. That's because we haven't displayed anything yet. Let's do that now.

Go to your `Overview.js` file in the components folder and add the following code:

```javascript
// Overview.js

import React from "react";

const Overview = (props) => {
  const { tasks } = props;

  return (
    <ul>
      {tasks.map((task) => {
        return <li>{task}</li>;
      })}
    </ul>
  );
};

export default Overview;
```

It just takes the `tasks` from the `props` and maps over it. For each task it will then display a `li` element with the content of tasks. Now when checking out the application in the browser we can see we got an error message, which says, that a unique key is required. React always requires you to add a unique key to each element when you `map` over a list. In real world projects you often use database ids as unique keys, however in this project we are not using a database, so let's install a package that provides us with unique ids.
Run `npm install uniqid` in your project folder. Uniqid is a package which creates unique ids based on the current time, the process and the machine name. Once this is done, we just have to include it like this.

```javascript
// Overview.js

import React from "react";
import React from "react";
import uniqid from "uniqid";

const Overview = (props) => {
  const { tasks } = props;

  return (
    <ul>
      {tasks.map((task) => {
        return <li key={uniqid()}>{task}</li>;
      })}
    </ul>
  );
};

export default Overview;
```

Almost done, the only thing we need to do is importing our `Overview` component to our `App.js` file and adding it in our render method, as well as passing down the `tasks` array as props.

Add this line to the top of your `App.js` file, right below where we import React.

```javascript
import Overview from "./components/Overview";
```

And then add the Overview component to your render method in `App.js`. Add this line of code right before the last closing `div`, and right after the closing `form` tag in `App.js`.

```javascript
<Overview tasks={tasks} />
```

Here we go, run `npm start` one last time. If you've done everything right, you should now be able to type a task into the input field and click submit to display it right below the input field. Feel free to play around a little bit and maybe change or style it as you like.

Your finished files should look like this:

```javascript
// App.js

import React, { Component } from "react";
import Overview from "./components/Overview";

class App extends Component {
  constructor() {
    super();

    this.state = {
      task: "",
      tasks: [],
    };
  }

  handleChange = (e) => {
    this.setState({
      task: e.target.value,
    });
  };

  onSubmitTask = (e) => {
    e.preventDefault();
    this.setState({
      tasks: tasks.concat(task),
      task: "",
    });
  };

  render() {
    const { task, tasks } = this.state;

    return (
      <div className="col-6 mx-auto mt-5">
        <form onSubmit={this.onSubmitTask}>
          <div className="form-group">
            <label htmlFor="taskInput">Enter task</label>
            <input
              onChange={this.handleChange}
              value={task}
              type="text"
              id="taskInput"
              className="form-control"
            />
          </div>
          <div className="form-group">
            <button type="submit" className="btn btn-primary">
              Add Task
            </button>
          </div>
        </form>

        <Overview tasks={tasks} />
      </div>
    );
  }
}

export default App;
```

```javascript
// Overview.js

import React from "react";
import uniqid from "uniqid";

const Overview = (props) => {
  const { tasks } = props;

  return (
    <ul>
      {tasks.map((task) => {
        return <li key={uniqid()}>{task}</li>;
      })}
    </ul>
  );
};

export default Overview;
```

### Optional Tasks / Ideas to play around

Here are a few optional tasks for you to practice. Try them out, if you can't solve them, continue with the curriculum and make sure to come back later to give them another try and see how you advanced.

### **Easy**

1. Instead of displaying unordered list items, manage the amount of tasks in state, and let each task display it's number. Yes, you could also do that with a simple ordered list, but where's the fun in that? Try using state.
2. Implement a delete button for each task. The delete button should remove the specific task from the state array. Don't forget to never directly assign state. If you want you can use [fontawesome](https://fontawesome.com/) for the icon.
   **Tip**: You can remove each task by it's id, but for that you have to save the task id together with the task title.

### **Hard:**

1. Implement an edit button for each task. When pressing the edit button, this specific task should be changable, and the previously displayed edit button changes to a resubmit button.

### Additional Resources
