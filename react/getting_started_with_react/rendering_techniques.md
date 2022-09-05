### Introduction

Now that we have learned how JSX works and how to write it. This lesson will cover how we can render multiple 
elements and conditionally render UI in JSX.  

### Lesson Overview  

This section contains a general overview of topics that you will learn in this lesson.

*  Rendering a list of elements in JSX  
*  Rendering components instead of elements  
*  How you can conditionally render UI

### Rendering a List of Elements in JSX  

Let us say we want to create a component that lists multiple animals. We can do so by doing:  

~~~javascript
function App() {
    return (
        <div>
            <h1>Animals: </h1>
            <ul>
                <li>Lion</li>
                <li>Cow</li>
                <li>Snake</li>
                <li>Lizard</li>
            </ul>
        </div>
    )
}
~~~

It is perfectly acceptable, but what if we want to render more than just four? It can be tedous and long, and most of the time, 
we will be dealing with a list rather than hard coding each animal. We can simplify this process by using a list to which we 
can apply the `map` method to map over the list. You have previously learned that we can embed expressions insidef JSX with 
curly braces. SO let us do just that:  

~~~javascript
function App() {
    const animals = ["Lion", "Cow", "Snake", "Lizard"];
    return (
        <div>
            <h1>Animals: </h1>
            <ul>
                {animals.map((animal) => {
                    return <li key={animal}>{animal}</li>
                })}
            </ul>
        </div>
    )
}
~~~

We have defined an array called `animals` which contains what we have previously written. Now inside our JSX, we used `map` 
to map over each animal in the list and return the `li` element, adding `animal` as its text. It should now render the 
same as the previous snippet we wrote. It is now more dynamic and easy to handle.  

You may be curious as to what the `key` is in our `<li>` element. We will dive into how keys work in the next lesson. 
But, to explain briefly, It is to let React know the identity of each element in the list, React must know this information if 
you are dealing with a dynamic list where you add or remove elements. Since we are only dealing with a static list, it does not matter for now.  

### Rendering a Different Component  

<div class="lesson-note" markdown="1">
We will use `props` here, and you will learn more about them in a future lesson. We will just be writing a simple implementaiton.
</div>  

~~~javascript
function List(props) {
    return (
        <ul>
            {props.animal.map((animal) => {
                return <li key={animal}>{animal}</li>
            })}
        </ul>
    )
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
~~~

We have moved our `<ul>` element to a different component called `<List />` It still returns the `<ul>` element, but we can  
do a lot more with it as a component  

This component accepts a `props` which is an object containing the `animals` that we defined as a property when 
we wrote `<List animals={animals}>` Do note that you can name it anything, for example `<List animalList={animals} />` 
you will still need to pass the animals to the property, but now you will use `props.animalList` instead of `props.animals`  



### Assignment

<div class="lesson-content__panel" markdown="1">

1.  A RESOURCE ITEM
    *   AN INSTRUCTION ITEM
2. A PRACTICE ITEM
    * A TASK ITEM
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
