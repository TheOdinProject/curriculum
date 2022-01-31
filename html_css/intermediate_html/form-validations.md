### Introduction

Validations allow us to set specific constraints or rules that determine what data users can enter into an input. When a user enters data that breaks the rules, a message will appear, providing feedback on what was wrong with the entered data and how to fix it.

Validations are a vital ingredient in well-designed forms. They help protect our backend systems from receiving incorrect data, and they help make the experience of interacting with our form as dead-stupid-simple as possible for our users.

This lesson will explore some of the built-in validations you can use with HTML forms. We will also dive into creating custom validations using JavaScript.

### Learning Outcomes

By the end of this lesson, you should be able to:

- Explain what form validations are
- Know how to use a few of the basic built-in HTML validations
- Know how to build custom validations

### Required Validation

We will often want to ensure specific fields have been filled in before submitting the form, for example, the email and password in a login form.

To make a field required, we simply add the `required` attribute to it:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="vYeZGzB" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
<span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/vYeZGzB">
forms-required-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

To ensure a good user experience and to meet accessibility guidelines, we should always indicate which fields are required. This will often be done by adding an asterisk(\*) to the required field label like we have done in the example.

### Text Length Validations

Sometimes we will want users to enter a minimum or a maximum amount of text into a field. Real-world examples of using these validations would be the old 140 character limit that Twitter used to have in its status field or having minimum and maximum length constraints on a username field.

#### Minimum Length Validation

To add the minimum length validation, we give the form control a `minlength` attribute with an integer value that represents the minimum amount of characters we want to allow in the form control:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="WNZOwgp" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/WNZOwgp">
  forms-min-length-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Try entering less than three characters into the text area and clicking the tweet button to see the validation in action.

#### Maximum Length Validation

To add a maximum length validation, we give the form control a `maxlength` attribute with an integer value which represents the maximum amount of characters we want to allow in the form control:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="zYEzqJJ" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/zYEzqJJ">
  forms-maximum-length-validations</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

With the maximum length validation, the browser will prevent users from entering more characters than the max length attribute value. Try this for yourself in the example above.

#### Combining Validations

HTML allows us to apply as many validations as we wish to a form control. For example, we can give our tweet textarea both `minlength` and `maxlength` validations:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="vYeZGVY" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/vYeZGVY">
  forms-combining-validations</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

This gives us much more scope to control what users input.

### Minimum and Maximum Validations

Just like we often need to control the length of text-based form controls, there will be many situations where we will want to control the range of values users can enter into number based form controls.

We can do this with the min and max attributes, which allows us to set the lower and upper bounds of the value entered into the form control.
The min and max attributes only work with number based form controls such as the number, dates and time inputs.
You can view the complete list of supported elements on [MDN's documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/max#syntax).

Some real-world use cases for using these validations would be limiting the quantity on a product order form or choosing the number of passengers on a flight booking form.

#### Min Validation

To add a minimum value validation, we give the form control a `min` attribute with an integer value which represents the minimum number we want the form control to accept:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="poWwyxd" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/poWwyxd">
  forms-min-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Try submitting the form with a quantity of 0 to see the validation in action.

#### Max Validation

To add a maximum value validation, we give the form control a `max` attribute with an integer value which represents the maximum number we want the form control to accept:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="XWegdxB" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/XWegdxB">
  forms-max-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Try submitting the form with seven passengers to see the validation in action.

### Pattern Validations

To ensure we get the correct information from users, we will often want to ensure data matches a particular pattern.
Real-world applications would be checking a credit card number or a zipcode is in the correct format.

To add a pattern validation, we give the form control a `pattern` attribute with a [regular expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) as the value. In our example we are using the pattern validation to ensure a US zip code is in the correct format. 5 numbers followed by an optional dash and 4 more numbers:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="YzrQqRK" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/YzrQqRK">
  forms-pattern-basic-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Entering an incorrect zip code and submitting the form will display the following validation error in the browser "Please match the requested format".
This isn't very useful since it doesn't communicate how to fix the issue.

We can add a more descriptive validation message by giving our input a `title` attribute:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="MWEoyzQ" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/MWEoyzQ">
  forms-pattern-with-title-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

When we submit the form with an incorrect zip code, we will be greeted with a more helpful message telling us exactly what went wrong and how to resolve it.

It is also good practice to use a `placeholder` attribute to show users an example of the expected pattern they need to enter:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="LYzLNXv" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/LYzLNXv">
  forms-pattern-with-placeholder-validation</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

The pattern attribute can only be used on `<input>` elements. Some input elements already validate data matches a certain pattern. For example the email input field which will make sure a valid email is entered and the url input element which will check to ensure the url starts with http or https:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="eYGRZbK" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/eYGRZbK">
  forms-built-in-pattern-validations</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Styling Validations

We can target form controls that have passed or failed validations using the `:valid` and `:invalid` pseudo-classes.

To see this in action, we will be using our email and website example that we looked at previously:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="dyVRMwx" data-preview="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/dyVRMwx">
  forms-styling-validations</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

First of all, we target any valid inputs and give them a green border. Our email and URL inputs initially have a green border since they are not required fields and are valid.

When a field is invalid, we give it a red border instead. Try entering an invalid email address and URL to see how this looks.

### Conclusion

The built-in validations will take you far with ensuring your users enter the correct data. They are quick and easy to add. However, they have their limitations.

Sometimes you will need to include validations that the built-in validations won't be able to do. For example, validating that a password input and password confirmation input have the same value or validating that a username has not already been taken. We are also limited with what we can do with styling the validation messages and the content within them.

In this case, we will need to get creative and make custom validations using JavaScript and CSS. We'll dive into how to do this in the assignment.

It's also worth noting client-side validations are not a silver bullet for ensuring users enter the correct data. To ensure the integrity of any user data coming into our systems, we should also have server-side validations in place. We will cover this side of validations later in the curriculum.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read and follow along to [MDN's Client-Side Form Validation Guide](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation)
2. SitePoint's [Complete Guide to HTML Forms and Constraint Validation Guide](https://www.sitepoint.com/html-forms-constraint-validation-complete-guide/)
3. Watch [Web Dev Simplified's JavaScript Form Validations Tutorial](https://www.youtube.com/watch?v=In0nB0ABaUk&ab_channel=WebDevSimplified)
4. Read CSS Tricks brilliant [Form Validation UX in HTML and CSS Guide](https://css-tricks.com/form-validation-ux-html-css/)

</div>

### Additional Resources

- Check out [html5pattern](https://www.html5pattern.com/) for a list of commonly used pattern regular expressions you may find helpful.
- Look through [this Twitter thread](https://twitter.com/vponamariov/status/1400388896136040454) of the do and don'ts for form validation UX.
- [10 Guidelines](https://www.nngroup.com/articles/errors-forms-design-guidelines/) for form validation design
- [Regular expressions clearly explained](https://towardsdatascience.com/regular-expressions-clearly-explained-with-examples-822d76b037b4) goes over several real world examples of regular expression patterns and walks through what they're doing step by step. This resource can be useful if you don't just want to copy + paste popular patterns, and instead want to know what a pattern is actually doing.
- One last resource on regular expressions that can be helpful is MDN's [regular expression syntax cheatsheet](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet). This cheatsheet does a great job explaining the syntax of regular expressions in more detail.

### Knowledge Check

- <a class="knowledge-check-link" href='#required-validation'>What does the required validation do?</a>
- <a class="knowledge-check-link" href='#text-length-validations'>What validations can you use for checking text length?</a>
- <a class="knowledge-check-link" href='#minimum-and-maximum-validations'>How can you validate the minimum and maximum of numeric inputs?</a>
- <a class="knowledge-check-link" href='#pattern-validations'>What can you use the pattern validation for?</a>
- <a class="knowledge-check-link" href='#styling-validations'>What pseudo css selectors are available for styling valid and invalid inputs?</a>
