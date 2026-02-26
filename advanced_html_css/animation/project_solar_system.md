### Introduction

In this project-lesson we will use CSS animation and transition to build animated and intractable solar system model. All this with barely any JavaScript - isn't that amazing?!

### Solar system projection

Our [solar system](https://en.wikipedia.org/wiki/Solar_System) consist of the sun and 8 planets. All those cosmic bodies have unique properties (e.g. size, orbit radius, orbital speed, etc). There is little to no value in projecting those properties with 100% accuracy. In fact it can make model unusable in some cases. Thus go with whatever is beautiful as long as it makes sense: Saturn still should be bigger than mercury and mars shouldn't be blue, also don't add Pluto.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Orbital speeds

If you are nerd who craves accuracy, you can still make orbital speed of planets proportionally realistic. Set Earth's year to whatever time you want and then work out how long other planets' years are using [planets' year length table](https://spaceplace.nasa.gov/years-on-other-planets/en). This is **completely optional** and you can just use common sense. It's still recommend to take a look at [planets' year length table](https://spaceplace.nasa.gov/years-on-other-planets/en)  though.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Animated model

1. Start by creating a list with its items representing sun and orbits of the 8 planets. You will put planet on its orbits in the next step. Reset `<ol>`'s default styles, then center the sun and planets' orbits. You may want to use combination of `position` and `transform` properties to do this.

   ```html
   <ol class="system">
     <li id="sun"></li>
     <li id="mercury" class="orbit"></li>
     <!--...another planets' orbits-->
   </ol>
   ```

1. Add planets to their respectful orbits. As [discussed earlier](#solar-system-projection), their projection doesn't have to be 100% accurate, but it must make sense. Using [CSS variables](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) might help you optimize setting planets' properties.

1. Make planets rotate around the sun using `@keyframe` animation.

#### Control panel

1. Create a panel of 8 buttons, each for one planet. This panel must enable user to select one planet at the time and deselect it by clicking on those buttons. Both the selected planet and its button must be highlighted. You are free to come up with your own highlight effects.

1. Make transition between highlighted and non-highlighted state of both planets and buttons using `transition` property.

</div>
