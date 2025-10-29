### Introduction

React 18 introduced several groundbreaking features that improve application performance and developer experience. This lesson will explore these new features and how to effectively use them in your applications.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understanding Concurrent Features in React 18
- Working with Automatic Batching
- Using the new Transitions API
- Implementing Suspense and Streaming Server-Side Rendering
- Exploring the new Hooks (useId, useTransition, useDeferredValue)

### Understanding Concurrent Features

React 18's concurrent rendering is a powerful new feature that enables React to prepare multiple versions of your UI at the same time. This change enables new features like automatic batching, transitions, and streaming server-side rendering.

#### What is Concurrent React?

Concurrent React is not a feature itself but rather a new behind-the-scenes mechanism that enables React to prepare multiple versions of your UI simultaneously. This helps in:

- Interrupting rendering to handle more urgent updates
- Keeping the UI responsive during intensive tasks
- Avoiding unnecessary loading states
- Maintaining consistent performance regardless of device capability

### Automatic Batching

Automatic batching is a performance optimization where React combines multiple state updates into a single re-render. While React has always batched updates inside React event handlers, React 18 extends this to other contexts like promises, setTimeout, and native event handlers.

```javascript
// Before React 18 (in promises, setTimeout, etc)
setTimeout(() => {
  setCount(c => c + 1); // Causes a re-render
  setFlag(f => !f);     // Causes a re-render
}, 1000);

// React 18 with Automatic Batching
setTimeout(() => {
  setCount(c => c + 1); // Does not cause a re-render
  setFlag(f => !f);     // Both updates are batched - only causes one re-render
}, 1000);
```

### The Transitions API

Transitions are a new concept in React 18 that allow you to mark some updates as non-urgent, letting other, more urgent updates interrupt them.

```javascript
import { useTransition } from 'react';

function SearchPage() {
  const [isPending, startTransition] = useTransition();
  const [searchQuery, setSearchQuery] = useState('');
  
  function handleSearch(e) {
    // Urgent: Show what was typed
    setSearchQuery(e.target.value);
    
    // Non-urgent: Show the results
    startTransition(() => {
      setSearchResults(filterData(e.target.value));
    });
  }
  
  return (
    <>
      <input value={searchQuery} onChange={handleSearch} />
      {isPending && <Spinner />}
      <SearchResults results={searchResults} />
    </>
  );
}
```

### Suspense and Server Components

React 18 introduces streaming server-side rendering with support for Suspense, allowing you to break down your application's initial page load into smaller chunks.

```javascript
import { Suspense } from 'react';

function HomePage() {
  return (
    <>
      <Navigation />
      <Suspense fallback={<Spinner />}>
        <MainContent />
      </Suspense>
      <Suspense fallback={<Spinner />}>
        <Sidebar />
      </Suspense>
    </>
  );
}
```

### New Hooks in React 18

#### useId

The useId hook generates unique IDs that are consistent across the server and client:

```javascript
function AccessibleInput() {
  const id = useId();
  return (
    <>
      <label htmlFor={id}>Email</label>
      <input id={id} type="email" />
    </>
  );
}
```

#### useDeferredValue

useDeferredValue lets you defer updating a non-urgent part of the UI:

```javascript
function SearchResults({ query }) {
  const deferredQuery = useDeferredValue(query);
  
  return (
    <ul>
      {filterData(deferredQuery).map(item => (
        <SearchResult key={item.id} item={item} />
      ))}
    </ul>
  );
}
```

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read through the official [React 18 release announcement](https://react.dev/blog/2022/03/29/react-v18) to understand the major changes.
   - Pay special attention to the migration steps and breaking changes.

2. Complete this hands-on tutorial on implementing React 18 features:
   - Create a new React 18 project
   - Implement automatic batching
   - Use transitions for non-urgent updates
   - Implement Suspense for loading states

3. Practice using the new hooks:
   - Create examples using useId
   - Implement useDeferredValue
   - Work with useTransition
   
</div>

### Knowledge check

- [What is Concurrent React and how does it improve performance?](#concurrent-react)
- [How does automatic batching work in React 18?](#automatic-batching)
- [What are transitions and when should you use them?](#transitions)
- [How can Suspense improve the loading experience?](#suspense)
- [What are the use cases for useDeferredValue vs useTransition?](#new-hooks)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [React 18 Working Group discussions](https://github.com/reactwg/react-18/discussions)
- [Patterns for Performance in React 18](https://react.dev/blog/2022/03/29/react-v18#gradually-adopting-concurrent-features)
- [Data Fetching with Suspense](https://react.dev/reference/react/Suspense)