### Introduction

Throughout the lessons, we've learned how to manage state and how to pass data/props around components. However, as our application grow in size, not only will this process of managing state and passing data around becomes repetitive and inconvenient, it will also be hard to manage. This lesson will cover how we can reduce these complexities in our application by using The Context API.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Occurence of Prop Drilling in larger applications
- Using the Context API to pass state and data deep into React components
- Real-world application of the Context API
- Drawbacks of using the Context API

### What is Context API

Context API in React is used commonly as a [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection). In React however, this is used as a way to pass data/functions deep into other components without the need of passing props to each of these components. That sounds pretty amazing doesn't it? It alleviates the pain points you may or may not have experienced in the previous projects. Let's take a look at an example of a project that we've built in the past:

In the Shopping Cart project, you might have a Product Detail Page that might or might not look like this very awesome shop:

![](imgs/00.png)

You have a counter at the header that displays the number of items currently in the cart. How you'll add items in the cart is through the "Add to Cart" button.

For this example we will omit the routing that we did in the project and just look at it by the structure to reduce code but try to image that these components have their own routes. As we already know, if we want state to persist and be shared between components, what we want to do is to [Lift the state up](https://beta.reactjs.org/learn/sharing-state-between-components) to a common ancestor/parent.

Our application code might look like:

~~~jsx
// imports

export default function App() {
	const [cartItems, setCartItems] = useState([/* List of Items in Cart */])
	const products = /* some custom hook that fetches products and returns the fetched products */

	const addToCart = () => {
		// add to cart logic (this adds to cartItems)
	}

	return (
		<>
			{/* Let's imagine that each components that needs routing, HAS a routing, but we'll omit it for the sake of brevity and since you've also done routing enough to know a lot about it by now */}
			<Header cartItemsCount={cartItems.length} />
			<Product addToCart={addToCart} products={products} />
		</>
	)
}
~~~

Let's focus on the Header and Product components

Our Header might look like:

~~~jsx
function Links({ cartItemsCount }) {
	return (
		<ul>
			{/* Links */}
			<li>
				<Link to={/* Link to the cart */}>
					<span>Cart</span>
					<CartIcon>{cartItemsCount}</CartIcon>
				</a>
			</li>
		</ul>
	)
}

export default function Header({ cartItemsCount }) {
	return (
		<header>
			{/* Other header elements */}
			<nav>
				<Links cartItemsCount={cartItemsCount} />
			</nav>
		</header>
	)
}
~~~

Our Product component:

~~~jsx
export default function Product({ products, addToCart }) {
  const product = products.find(/* Logic to find the specific product */);

  return (
    <div>
      <img />
      <div>
        {/* elements that aligns with the design */}
        <button type="button" onClick={() => addToCart(product)}>
          Add to Cart
        </button>
      </div>
    </div>
  );
}
~~~

Great. This is a very common pattern, we pass data/functions between components, nothing too complicated. But there's a lot to micro-manage, a lot of components that you need to pass props to, and there's even a little bit of prop drilling that's happening, where the `cartItemsCount` is passed from `App` -> `Header` -> `Links`.

Let's elaborate everything that's happening

- `products` and `addToCart` is passed down to the `Product` component
- `cartItemsCount` is passed down to the `Header` and `Links` components

Very simple application but imagine the application grows in size, with more features added say in the Product Detail Page, a lot more components will be nested inside the component and potentially more nested props. What if we have a `Cart` component, a `ProductListing` component, what if we added more functionalities other than just `addToCart`. It can get repetitive and complex because we all know, more features equals more complexities.

### Implementing Context API

Let's try to implement Context API and refactor our current application to reduce these complexities.

We have three things in the API that we need use in order to implement it.

1. `createContext` - This "creates the context" duh... But yes, it's how we can create the context, it takes in any value be it a number, string, or an object, which can be referred to as the _default state_ of the context, and returns a Context object
2. `useContext` - This is a hook that takes in the Context object that is returned by `createContext`, we will be using this inside our component in order to "get" the data that we need
3. `ContextObject.Provider` - The Context object comes with the `Provider` component that has a prop called `value` which is basically the context value that's going to be passed down to the components no matter how deep they're nested. In other words, a way to "provide" the context value to these components.

We can start by using the `createContext` function that can be imported from the `react` module.

~~~javascript
import { createContext } from "react";
~~~

The createContext is able to take in any value, a string, number, or even an object, which can be referred to as the _default state_ of the context.

In our case, we'll use an object that contains the following shape:

~~~javascript
const ShopContext = createContext({
  products: [],
  cartItems: [],
  addToCart: () => {},
});
~~~

You might think, adding `products` and `cartItems` seems reasonble, but why do we need to include `addToCart` as well? Actually, you're not required to setup your your context like this and it's up to you, but you will be able to add auto-completion in your IDE by doing this, it's basically a bonus!

You can of course do this as well and it will not be a problem at all:

~~~javascript
const ShopContext = createContext();
~~~

So how do we use this context? And that is by using the `Provider` component of the Context object and nesting the children components inside it. In this example, we will remove the props altogether.

~~~jsx
import { usestate, createContext } from 'react';

export const ShopContext = createContext({
	products: [],
	cartItems: [],
	addToCart: () => {}
})

export default function App() {
	const [cartItems, setCartItems] = useState([/* List of Items in Cart */])
	const products = /* some custom hook that fetches products and returns the fetched products */

	const addToCart = () => {
		// add to cart logic (this adds to cartItems)
	}

	return (
		{/* We are going to pass the properties that we've defined in createContext */}
		<ShopContext.Provider value={{ cartItems, products, addToCart }}>
			{/* Let's imagine that each components that needs routing, HAS a routing, but we'll omit it for the sake of brevity and since you've also done routing enough to know a lot about it by now */}
			<Header />
			<Product />
		</>
	)
}
~~~

Great! Now let's try to look at our `Header` component again and we will also remove all the props that we've defined earlier, we will also be using the `useContext` hook.

~~~jsx
// import ShopContext

function Links() {
	const { cartItems } = useContext(ShopContext);

	return (
		<ul>
			{/* Links */}
			<li>
				<Link to={/* Link to the cart */}>
					<span>Cart</span>
					<CartIcon>{cartItems.length}</CartIcon>
				</a>
			</li>
		</ul>
	)
}

export default function Header() {
	return (
		<header>
			{/* Other header elements */}
			<nav>
				<Links />
			</nav>
		</header>
	)
}
~~~

We've completely removed the prop drill, and we can conveniently get the `cartItems` directly in the `Links` component itself as we already know that no matter how deeply nested the component is, we can still get the data as long as it's nested inside the Provider.

We can also do the same in the `Product` component:

~~~jsx
// import ShopContext

export default function Product() {
  const { products, addToCart } = useContext(ShopContext);
  const product = products.find(/* Logic to find the specific product */);

  return (
    <div>
      <img />
      <div>
        {/* elements that aligns with the design */}
        <button type="button" onClick={() => addToCart(product)}>
          Add to Cart
        </button>
      </div>
    </div>
  );
}
~~~

In the `Header` component, we used `useContext()` to access the `cartItems` state from the `CartContext`. Similarly, in the `Product` component, we used `useContext()` to access the `addToCart` function from the `CartContext`.

With this implementation, we no longer need to pass down props from the `App` component to the `Header` and `Product` components. The `Header` and `Product` components can simply access the `cartItems` state and `addToCart` function from the `CartContext`.

### Drawbacks of using Context API

Although the Context API can be a powerful tool for managing state in larger React applications, it also has some drawbacks that you should be aware of:

1. It can lead to performance issues: When you update the state in a context, it can cause all components that are consuming that context to re-render, even if the state that they are using hasn't changed. This can lead to performance issues, especially if you have a lot of components that are using the same context.
2. It can make your code harder to follow: With the Context API, it's easier to access state from any component in your application. However, this can also make your code harder to follow, especially if you have a lot of nested components that are using the same context. It's important to keep your code organized and well-structured to avoid confusion.

### Potential Solutions

WIP

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.

