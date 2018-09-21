### Introduction
With the limitations of the more traditional css layout techniques becoming more apparent with the huge growth in mobile and tablet sized screens, a new way was needed to reduce the current complexity of creating responsive website layouts.

Grid was introduced to fill this need.


### Learning Outcomes
- What is a grid?
- How do you create a grid container?
- How do you create a fixed track size?
- How do you create a flexible track size?
- What is the different between an implicit and explicit grid?
- How is the fr unit used?
- How do you place items into a precise location on the grid?
- How does Grid handle overlapping content?
- What are grid lines and how are they used?
- How do you position items against the grid line?
- What is a grid cell?
- What are grid areas and how are they used to layout content?
- What are gutters (also known as alleys) in the grid?
- How can you nest grids?

### Overview
Grid layout introduces a two-dimensional grid system which works with columns and rows. This compares against the mainly one dimensional alternatives where you fix the layout to either columns or rows. The result is the ability to create complex layouts in a simple and clean way as you aren't required to include anything in your html markup as you would with tools like Bootstrap.

If you have any experience with other css layout options like floats then Grid can take a little getting used to. Here are some practical tips that can help you as you use Grid in your layouts.

1) Draw your grid first on paper. It really helps you have a visual representation of what you are trying to achieve and makes it much easier to set up the grid in the right way. You don't want to have to keep making major adjustments for things you haven't accounted for.
2) Take care when using fractions. Grid offers a powerful feature to set widths as fractions of the available space. If you mix fractions and non-flexible spacing, such as pixels, fractions are calculated based on the space remaining after the fixed width elements are accounted for. This can mean the grid doesn't end up looking how you pictured it.
3) If your layout includes any rows or columns with no elements, you need to account for this whitespace too. Be sure to account for empty contents as much as elements.
4) Understand how explicit and implicit grids are formed. This will be covered more in the assignments but implicit grids can be formed when Grid is using your explicit grid template. Understanding how Grid forms these will really help you set up your grid properly and avoid unexpected results.
5) While learning, start with a simple grid. Don't complicate it too early by starting with elements spanning multiple rows and grids. Setup a simple grid and make small adjustments. If you create a grid with and even number of columns and rows it will limit the flexibility of the grid but while learning will help avoid any confusion.

One limitation to the current grid specification is subgrids are not yet available. By that I mean a nested grid that follows the same grid as the parent. There is a subgrid keyword in the grid specification, but it is not yet implemented and there is no current schedule for release.

Grid is now supported in all major browsers meaning you can use it right away to start creating awesome layouts. You can find out if your browser version supports it [here](https://caniuse.com/#feat=css-grid).


### Assignment
- Complete [CSS Grid Garden](www.cssgridgarden.com). An awesome resource for learning the basics of css grid through 28 levels.
- Check out the videos at [Grid by Example](https://gridbyexample.com/video). They are nice and short and cover all the major areas of CSS Grid.
- Wes Bos has a [CSS Grid course](https://cssgrid.io/) which is goes really in depth on the subject

### Additional Resources
- The [MDN Grid pages](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout) are a great place to review CSS Grid and make sure you are comfortable with the main areas of the specification.
- This [Rachel Andrew Youtube Video](https://youtu.be/N5Lt1SLqBmQ) is a great video on using Grid over other options
