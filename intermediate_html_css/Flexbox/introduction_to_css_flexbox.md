# Introduction to CSS Flexbox

## Overview

This repository serves as a beginner's guide to understanding and using CSS Flexbox. Flexbox is a layout model that allows you to create dynamic and flexible layouts in web applications. With Flexbox, you can easily align, distribute, and reorder elements within a container, making it a powerful tool for creating responsive designs.

## Table of Contents

1. [Basic Concepts](#basic-concepts)
2. [Flex Container](#flex-container)
3. [Flex Items](#flex-items)
4. [Common Properties](#common-properties)
5. [Examples](#examples)
6. [Resources](#resources)

## Basic Concepts

### 1. Flex Container

A flex container is an element that applies the Flexbox layout to its children. To create a flex container, you need to set the `display` property to `flex` or `inline-flex`.

### 2. Flex Items

Flex items are the children of a flex container. They can be aligned and ordered within the container using various Flexbox properties.

## Flex Container

### `display`

The `display` property is set to `flex` to create a flex container.

```css
.container {
  display: flex;
}
```

### `flex-direction`

This property sets the direction of the main axis. Options include `row`, `row-reverse`, `column`, and `column-reverse`.

```css
.container {
  flex-direction: row; /* Default value */
}
```

### `justify-content`

This property aligns flex items along the main axis.

```css
.container {
  justify-content: center;
}
```

### `align-items`

This property aligns flex items along the cross axis.

```css
.container {
  align-items: center;
}
```

## Flex Items

### `order`

This property controls the order in which flex items appear.

```css
.item {
  order: 2; /* Default value is 0 */
}
```

### `flex-grow`

This property specifies how a flex item should grow relative to other items.

```css
.item {
  flex-grow: 1; /* Default value is 0 */
}
```

### `flex-shrink`

This property specifies how a flex item should shrink relative to other items.

```css
.item {
  flex-shrink: 1; /* Default value is 1 */
}
```

## Common Properties

- `flex`
- `align-self`
- `flex-basis`
- `flex-wrap`

## Examples

Check out the `examples` directory for hands-on examples of using Flexbox for different layouts.

## Resources

- [MDN Web Docs - Flexbox](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Flexbox)
- [CSS-Tricks - A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
