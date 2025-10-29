### Introduction

Testing React hooks is a crucial skill for developing robust React applications. This lesson will teach you how to effectively test custom hooks and components that use hooks using React Testing Library.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understanding how to test React hooks
- Testing custom hooks with React Testing Library
- Common testing patterns for different types of hooks
- Testing components that use hooks
- Best practices for hook testing

### Testing Custom Hooks

Custom hooks can be tested in two ways:
1. Testing the hook directly using `renderHook`
2. Testing the hook through a component that uses it

#### Using renderHook

```javascript
import { renderHook, act } from '@testing-library/react-hooks';
import { useCounter } from './useCounter';

describe('useCounter', () => {
  test('should increment counter', () => {
    const { result } = renderHook(() => useCounter());

    act(() => {
      result.current.increment();
    });

    expect(result.current.count).toBe(1);
  });

  test('should decrement counter', () => {
    const { result } = renderHook(() => useCounter());

    act(() => {
      result.current.decrement();
    });

    expect(result.current.count).toBe(-1);
  });
});
```

### Testing Hooks with Side Effects

When testing hooks that have side effects (useEffect), we need to properly handle cleanup and async operations:

```javascript
import { renderHook } from '@testing-library/react-hooks';
import { useDataFetching } from './useDataFetching';

describe('useDataFetching', () => {
  test('should fetch data successfully', async () => {
    const { result, waitForNextUpdate } = renderHook(() => 
      useDataFetching('https://api.example.com/data')
    );

    expect(result.current.loading).toBe(true);
    await waitForNextUpdate();
    
    expect(result.current.loading).toBe(false);
    expect(result.current.data).toBeDefined();
  });
});
```

### Testing Components with Hooks

When testing components that use hooks, we focus on the component's behavior rather than the hook implementation:

```javascript
import { render, fireEvent } from '@testing-library/react';
import Counter from './Counter';

describe('Counter', () => {
  test('should display initial count', () => {
    const { getByText } = render(<Counter />);
    expect(getByText('Count: 0')).toBeInTheDocument();
  });

  test('should increment count', () => {
    const { getByText, getByRole } = render(<Counter />);
    fireEvent.click(getByRole('button', { name: /increment/i }));
    expect(getByText('Count: 1')).toBeInTheDocument();
  });
});
```

### Testing Context Hooks

Testing components that use context requires wrapping the component with a context provider:

```javascript
import { render } from '@testing-library/react';
import { ThemeContext } from './ThemeContext';
import ThemeComponent from './ThemeComponent';

describe('ThemeComponent', () => {
  test('should use theme from context', () => {
    const theme = { background: 'dark' };
    const { getByText } = render(
      <ThemeContext.Provider value={theme}>
        <ThemeComponent />
      </ThemeContext.Provider>
    );
    
    expect(getByText('Dark Theme')).toBeInTheDocument();
  });
});
```

### Best Practices

1. Test Component Behavior: Focus on testing how the component behaves rather than implementation details.
2. Use act() When Needed: Wrap state updates in act() to ensure all updates are processed.
3. Clean Up After Tests: Make sure to clean up any side effects after each test.
4. Test Error Cases: Don't forget to test error scenarios and edge cases.
5. Mock External Dependencies: Use jest.mock() for external dependencies.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Create a custom hook and write tests for it:
   - Implement a useForm hook for form handling
   - Write tests using renderHook
   - Test various scenarios including validation

2. Test a component that uses multiple hooks:
   - Create a component that uses useState, useEffect, and a custom hook
   - Write comprehensive tests for the component
   - Include error scenarios and edge cases

3. Practice testing context and effects:
   - Create a context-based theme switcher
   - Test context updates and effects
   - Ensure proper cleanup in tests

</div>

### Knowledge check

- How do you test custom hooks using renderHook?
- When should you use the act() function in tests?
- How do you test components that use context?
- What are the best practices for testing hooks?
- How do you handle async operations in hook tests?

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Testing Library documentation](https://testing-library.com/docs/react-testing-library/intro/)
- [Kent C. Dodds's blog on testing hooks](https://kentcdodds.com/blog/how-to-test-custom-react-hooks)
- [React Testing Recipes](https://react.dev/learn/testing)