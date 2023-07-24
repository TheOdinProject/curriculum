### Introduction

This lesson will build upon the previous lesson on state and introduce further concepts and techniques to manage state. Let's dive in.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to structure state.
- How state updates.
- Learn about controlled components.

### How to structure state

Managing and structuring state effectively is by far one of the most crucial parts of building your application. If not done correctly it can become a source of bugs and headaches.   

The assignment items go through the topic thoroughly, but as a general rule of thumb: don't put values in state that can be calculated using existing values, state, and/or props. 

#### State is immutable

<span id="state-is-immutable"></span>Mutating state is no-go area in React as it leads to unpredictable results. Primitives are already immutable, but if you are using reference type values i.e. arrays and objects, never mutate them. Instead always use the `setState` function to update state. 

Make sure to run the following example locally and see the difference for yourself.

~~~jsx
function Person() {
   const [person, setPerson] = useState({ name: 'John', age: 100 });

   // BAD - Don't do this!
   const handleIncreaseAge = () =>{
      // mutating the current state object
      person.age = person.age + 1;
      setPerson(person);
   }

   // GOOD - Do this!
   const handleIncreaseAge = () =>{
      // copy the existing person object into a new object 
      // while updating the age property
      const newPerson = { ...person, age: person.age + 1 };
      setPerson(newPerson);
   }
   
   return (
      <>
         <h1>{person.name}</h1>
         <h2>{person.age}</h2>
         <button onClick={handleIncreaseAge}>Increase age</button>
      </>
   )
}
~~~

<div class="lesson-note lesson-note--tip" markdown="1">

#### Nested objects and arrays in state

In the above example, notice how we had to copy the existing state object. Herein lies another lesson, nested objects and arrays as state can get tricky fast since you will have to replicate the nested items as well. Be careful when using them.

</div>

### How state updates

State updates are asynchronous. What this implies is whenever you call the `setState` function, React will apply the update in the **next** component render. This concepts takes a while to wrap your head around. With a lot of practice, you'll get the hang of it no time.

Remember, state variables aren't reactive, the component is. This can be understood by the fact that calling `setState` re-renders the entire component instead of just changing the state variable on the fly.

~~~jsx
function Person() {
   const [person, setPerson] = useState({ name: 'John', age: 100 });

   const handleIncreaseAge = () =>{
      console.log("in handleIncreaseAge (before setPerson call): ", person)
      setPerson({ ...person, age: person.age + 1 });
      // we've called setPerson, surely person has updated?
      console.log("in handleIncreaseAge (after setPerson call): ", person);
   }

   // this console.log runs every time the component renders 
   // what do you think this will print?
   console.log("during render: ", person);
   
   return (
      <>
         <h1>{person.name}</h1>
         <h2>{person.age}</h2>
         <button onClick={handleIncreaseAge}>Increase age</button>
      </>
   )
} 
~~~

These are the logs:

![browser console of above code snippet](https://cdn.statically.io/gh/TheOdinProject/curriculum/bd3063e12816ac241f73daeffa600ca89e56c443/react/states_and_effects/more_on_state/imgs/00.png)

Uh oh, what is happening? Let's break it down (ignore the double `console.logs` for the render case, this is covered in the upcoming lessons).

1. The component renders for the first time. The `person` state variable is initialized to `{ name: 'John', age: 100 }`. The "during render" `console.log` prints the state variable.
1. The button is clicked invoking `handleIncreaseAge`. Interestingly, the `console.log` before and after the `setPerson` call prints the same value.
1. The component re-renders. The `person` state variable is updated to `{ name: 'John', age: 101 }`. 

The `person` state stays the same throughout the current render of the component. This is what "state as a snapshot" refers to. The `setState` call triggers a component re-render and the `person` state is updated to the new value.

<div class="lesson-note lesson-note--warning" markdown="1">

#### The unexpected infinite loop

The following is an infinite loop, can you guess why? Drop by in our [Discord chatroom](https://discord.com/invite/fbFCkYabZB), tell us why, and score a brownie point!

~~~jsx
function Time() {
   const [time, setTime] = useState();

   setTime(new Date());

   return (
      <h1>{time.toLocaleTimeString()}</h1>
   )
}
~~~

</div>

#### State updater functions

<span id="state-update-functions"></span>A trick question. Let's look another implementation of `handleIncreaseAge`; what do you think it does?

~~~jsx
const handleIncreaseAge = () => {
   setPerson({ ...person, age: person.age + 1 });
   setPerson({ ...person, age: person.age + 1 });
}
~~~

Surely, it increase the age by 2? Nope. The above code is saying to React:

> Hey, replace the current render's `person` with an increase in age by 1. Then, replace the current render's `person` with an increase in age by 1.

Notice the word "replace". When you pass in the value to the `setState` function, React will replace the current state with the value you passed in. You might be wondering, what if I want to update the state multiple times using the latest state? This is where the state updater function comes in.

~~~jsx
const handleIncreaseAge = () => {
   setPerson((prevPerson) => ({ ...prevPerson, age: prevPerson.age + 1 }));
   setPerson((prevPerson) => ({ ...prevPerson, age: prevPerson.age + 1 }));
}
~~~

When a callback is passed to the `setState` function, it ensures that the latest state is passed in as an argument to the callback. 

You will find yourself reaching out for state updater functions rarely, but it's good to know they exist.

<div class="lesson-note" markdown=1>

#### React batches state updates

There are two `setPerson` calls in the above example, and from what we've learned so far, a `setState` call triggers a component re-render. So, the component should re-render twice, right? You would say yes, but React is smart. Wherever possible React batches the state updates. Here the component only re-renders once. We'd encourage you to use `console.log`s to verify this.

</div>


### Controlled components

There are native HTML elements that maintain their own internal state. The `input` element is a great example. You type into an `input` and it updates its own value on every keystroke. For many use-cases, you would like to _control_ the value of the `input` element i.e. set its value yourself. This is where controlled components come in.

~~~jsx
function CustomInput() {
   const [value, setValue] = useState('');
   
   return (
      <input
         type="text"
         value={value}
         onChange={(event) => setValue(event.target.value)}
      />
   );
}
~~~

Instead of letting the `input` maintain its own state, we define our own state using the `useState` hook. We then set the `value` prop of the `input` to the state variable and update the state variable on every `onChange` event. Now, every time the user types something in the input, React will ensure you have the latest comment/review/post (whatever the user was typing) in `value`. 

This pattern is extremely useful wherever you need user input i.e. typing in a textbox, toggling a checkbox etc. Contrarily, yes, the `input` element can be left uncontrolled and access its value through some other method. You don't need to worry about it yet as it is covered later on in the course. For now, control your components!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the following articles from the React documentation: 
   - [State as a Snapshot](https://react.dev/learn/state-as-a-snapshot)
   - [Choosing the State Structure](https://react.dev/learn/choosing-the-state-structure)
   - [Sharing State Between Components](https://react.dev/learn/sharing-state-between-components)

2. Update the `Person` component we've been using above.
   - Add two separate input fields for first name and last name. The updated full name should be displayed on every keystroke on either of the two input fields. 
   - There are many ways you can do this. Keep in mind what you've learned in this lesson while coding it out.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [What should you keep in mind while declaring state?](#how-to-structure-state)
- [What does "state is immutable" mean?](#state-is-immutable)
- [What does "state as a snapshot" mean?](#how-state-updates)
- [What's the difference between passing a value vs a callback to the `setState` function?](#state-updater-functions)
- [Why would you want to control a component?](#controlled-components)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- We intentionally skipped some of the articles pertaining to state from the React documentation. We are confident that the concepts covered thus far will equip you with enough knowledge to tackle the projects to come in the course. Though if you want to delve into the topic further, you can read all of the articles in the [Adding Interactivity](https://react.dev/learn/adding-interactivity) and the [Managing State](https://react.dev/learn/managing-state) section.
