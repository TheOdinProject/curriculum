### Positioning

By now you have had quite a bit of practice moving elements around the screen using things like margin, padding, flexbox and grid. These techniques have all relied on CSS's default "positioning-mode". This default positioning-mode is intuitive, and you'll continue using it for almost all of your layout needs, however, there are other methods at your disposal that can be very useful in some situations.

### Learning Outcomes
 - You'll learn how to use absolute positioning.
 - You'll learn how to use fixed positioning.
 - You'll learn how to use sticky positioning.
 - You'll know the difference between each property and how to combine them.

### Static and Relative Positioning
The default positioning mode that you've gotten used to is _position: static_.The difference between static and relative is fairly simple. Static is the default position of every element, and properties _top_, _right_, _bottom_, and _left_ have no affect on statically positioned elements. Relative on the other hand is pretty much the same as static, but properties  _top_, _ri....(etc.)_ affect the specific element relative to itself.

### Absolute Positioning
_position: absolute_ allows you to position something at an exact point on the screen without disturbing the other elements around it. More specifically, using absolute positioning on an element will remove that element from the normal document flow. To put it in simple terms: elements that are removed from the normal flow of the document don't affect other elements and are also not affected by other elements. Using absolute positioning allows you to position elements anywhere on the screen using  _top_, _right_, _bottom_, and _left_ properties. This property is really useful when you want to position something at an exact point on the screen, without disturbing any of the other elements.

### Fixed Positioning 
Fixed elements are also removed from the normal flow of the document and are positioned relative to the _viewport_. You basically use  _top_, _right_, _bottom_, and _left_ properties to position it, and it will stay there as the user scrolls. This is especially useful for things like navigation bars.

### Sticky Positioning
Sticky elements will act like normal elements until you scroll past them, then they start behaving like fixed elements. They are also not taken out of the normal flow of the document. It might sound confusing, but checking out the behavior of <a href="https://codepen.io/theanam/pen/MPLBYy">this</a> example might clear things up for you.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. <a href="https://www.youtube.com/watch?v=jx5jmI0UlXU">This</a> video is fast-paced but provides a good visual representation of different positioning behaviors. Go ahead and watch it.
2. <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/position">This MDN article</a> covers all of the conceptual details about positioning. 
3. <a href="https://css-tricks.com/absolute-relative-fixed-positioining-how-do-they-differ/">This CSS Tricks</a> page should give you a different insight on the topic. You should read it as well.
4. Finally, <a href="https://www.kevinpowell.co/article/positition-fixed-vs-sticky/">this article</a> discusses the difference between fixed and sticky positioning, it's a great read to understand the difference better.
</div>

### Additional Resources

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="#static-and-relative-positioning">What is the difference between static and relative positioning?</a>
- <a class="knowledge-check-link" href="#absolute-positioning">What is absolute positioning useful for?</a>
- <a class="knowledge-check-link" href="https://www.kevinpowell.co/article/positition-fixed-vs-sticky/">What is the difference between fixed and sticky positioning?</a>