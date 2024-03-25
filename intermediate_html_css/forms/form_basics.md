### Introduction

Forms are one of the most critical parts of your site. They are your user's gateway into your backend – the user provides data in a form, and you do stuff with it.

You need to specify the proper types of inputs for each possible data item since there are often multiple ways to collect a piece of data, but only one way is easiest for your user.

In this lesson, we will explore the basics of HTML forms and some of the different types of inputs available to you.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Create forms with HTML.
- Have a basic idea of how to style forms.

### The form element

The form element is a container element like the div element we learned earlier in the curriculum. The form element wraps all of the inputs a user will interact with on a form.

The form element accepts two essential attributes; the first is the `action` attribute which takes a URL value that tells the form where it should send its data to be processed.
Later in the curriculum, we will learn to hook backend systems up to frontend forms using this attribute. For now, it's only essential to know what the `action` attribute is used for.

The second is the `method` attribute which tells the browser [which HTTP request method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) it should use to submit the form.
The GET and POST request methods are the two you will find yourself using the most.

We use GET when we want to retrieve something from a server. For example, Google uses a GET request when you search as it *gets* the search results.

POST is used when we want to change something on the server, for example, when a user makes an account or makes a payment on a website.

The markup for creating a form element looks like this:

```html
<form action="example.com/path" method="post">

</form>
```

### Form controls

To start collecting user data, we need to use form control elements. These are all the elements users will interact with on the form, such as text boxes, dropdowns, checkboxes and buttons. In the following few sections, we will explore some of the form controls you will use most commonly.

### The input element

The input element is the most versatile of all the form control elements. It accepts a `type` attribute which tells the browser what *type* of data it should expect and how it should render the input element.

A text input looks like this:

```html
<form action="example.com/path" method="post">
  <input type="text">
</form>
```

Text inputs accept any text input. For example, you would use it to collect things like users' first and last names.

**Labels**

An input on its own isn't very useful since the user will not know what kind of data they are supposed to provide. Instead, we can give our inputs a label to inform users what type of data they are expected to enter.

To create a label, we use the `<label>` element. The text we want displayed in the label will go between its opening and closing tags:

```html
<form action="example.com/path" method="post">
  <label for="first_name">First Name:</label>
  <input type="text" id="first_name">
</form>
```

Labels accept a `for` attribute, which associates it with a particular input. The input we want to associate with a label needs an `id` attribute with the same value as the label's `for` attribute.

When a label is associated with an input and is clicked, it will focus the cursor on that input, ready for the user to input some data. This helps make our forms more accessible to users who rely on assistive technologies.

**Placeholder attribute**

To guide users on what to enter in form elements, we can include placeholder text in input fields.

This is done by adding a `placeholder` attribute to an input. The value will be the *placeholder* text we want to display in the input:

```html
<label for="first_name">First Name:</label>
<input type="text" id="first_name" placeholder="Bob...">
```

Use placeholder text to demonstrate how text should be entered and formatted.


<span id="the-name-attribute">**The name attribute**</span>

We need to use labels so that users understand what the data entered into an input field will represent. Just like that, we also need to let the backend, where we send our data, know what each piece of data represents.

We do this by adding a `name` attribute to our inputs:

```html
<label for="first_name">First Name:</label>
<input type="text" id="first_name" name="first_name">
```

The `name` attribute serves as a reference to the data inputted into a form control after submitting it. You can think of it as a variable name for the input. Form input should always have a `name` attribute; otherwise, it will be ignored when the form is submitted.

To get a better understanding of what this looks like we can submit a form to [httpbin](http://httpbin.org/). This service will send back a response which will let us view what data was submitted. Fill in the form below and click submit:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="dyVRMbq" data-preview="true" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/dyVRMbq">
  form-basics-name-attribute</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

The output we care about from the response is the "form" object. It should look something like this:

```json
"form": {
    "age": "33",
    "first_name": "John",
    "last_name": "Doe"
  },
```

Try changing the `name` attributes of some of the input fields in the form and removing the attribute entirely, then submit the form again to see how the form data in the response changes.

**Using form controls outside of forms**

It's worth mentioning that you can use any of the form controls HTML provides outside of the `<form>` element, even when you don't have a backend server where you can send data.

For example you might want to have an input that gets some data from a user and display that somewhere else on the page with JavaScript:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="result" data-slug-hash="PoJjNYr" data-preview="true" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PoJjNYr">
  using-form-controls-outside-of-form</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We will need to manipulate data from form controls like this in projects later in the curriculum.

**The type attribute**

`Email inputs` are specialized text inputs just for email addresses. They are different from text inputs in that they will display a different keyboard which will include the @ symbol on mobile devices to make entering email addresses easier.

They also validate that the user has entered a correctly formatted email address, but there will be more on validations later.

To create an email input, we use an input element with `type` attribute of "email":

```html
<label for="user_email">Email Address:</label>
<input type="email" id="user_email" name="email" placeholder="you@example.com">
```

`Password inputs` are another specialized text input. They differ from regular text inputs in that they mask the inputted data with another character – usually an asterisk (*) or bullet point (•) – to prevent anyone from seeing what has been entered.

A password input can be created using an input element with a type of "password":

```html
<label for="user_password">Password:</label>
<input type="password" id="user_password" name="password">
```

The `number input` only accepts number values and ignores any other characters the user tries to enter.

We create a number input using the input element with a `type` attribute of "number":

```html
<label for="amount">Amount:</label>
<input type="number" id="amount" name="amount">
```

To collect dates from a user, we can use a `date input`. This input is unique because it provides a better user experience for choosing dates by rendering a date picker calendar.

To create a date input, we use the input element with a `type` attribute of "date":

```html
<label for="dob">Date of Birth:</label>
<input type="date" id="dob" name="dob">
```

**Text area**

While technically not an input element, the text area element provides an input box that can accept text that spans multiple lines like user comments and reviews. It can also be resized by clicking and dragging the bottom right corner to make it bigger or smaller.

To create a text area, we use the `<textarea>` element:

```html
<textarea></textarea>
```

Unlike input elements, Textarea elements do have a closing tag. This allows you to wrap some initial content you want the text area to display:

```html
<textarea>Some initial content</textarea>
```

Text area elements accept a couple of unique attributes that other form controls do not. These are the `rows` and `cols` attributes. They allow you to control the initial height (rows) and width (cols) of the text area:

```html
<textarea rows="20" cols="60"></textarea>
```

### Selection elements

Sometimes you will want users to select a value from a predefined list. This is where select elements will be useful.

**Select dropdown**

The select element renders a dropdown list where users can select an option. Syntactically, select elements have similar markup to unordered lists. The select element wraps option elements which are the options that can be selected.

To create a select dropdown, we use the `<select>` element. Any options we want to display within the select element are defined using `<option>` elements:

```html
<select name="Car">
  <option value="mercedes">Mercedes</option>
  <option value="tesla">Tesla</option>
  <option value="volvo">Volvo</option>
  <option value="bmw">BMW</option>
  <option value="mini">Mini</option>
  <option value="ford">Ford</option>
</select>
```

All the option elements should have a `value` attribute (otherwise the text content inside is used). This value will be sent to the server when the form is submitted.

We can set one of the options to be the default selected element when the browser first renders the form by giving one of the options the `selected` attribute:

```html
<select name="Car">
  <option value="mercedes">Mercedes</option>
  <option value="tesla">Tesla</option>
  <option value="volvo" selected>Volvo</option>
  <option value="bmw">BMW</option>
  <option value="mini">Mini</option>
  <option value="ford">Ford</option>
</select>
```

We may also split the list of options into groups using the `<optgroup>` element. The optgroup element takes a `label` attribute which the browser uses as the label for each group:

```html
<select name="fashion">
  <optgroup label="Clothing">
    <option value="t_shirt">T-Shirts</option>
    <option value="sweater">Sweaters</option>
    <option value="coats">Coats</option>
  </optgroup>
  <optgroup label="Foot Wear">
    <option value="sneakers">Sneakers</option>
    <option value="boots">Boots</option>
    <option value="sandals">Sandals</option>
  </optgroup>
</select>
```

**Radio buttons**

Select dropdowns are great for saving space on the page when we have an extensive list of options we want users to choose from. However, when we have a smaller list of 5 or fewer options to choose from, it is often a better user experience to have them displayed on the page instead of hidden behind a dropdown.

In this case, we can use radio buttons. Radio buttons allow us to create multiple options that the user can choose one of. To create radio buttons, we use the ever adaptable input element again with a `type` attribute of "radio":

```html
<h1>Ticket Type</h1>
<div>
  <input type="radio" id="child" name="ticket_type" value="child">
  <label for="child">Child</label>
</div>

<div>
  <input type="radio" id="adult" name="ticket_type" value="adult">
  <label for="adult">Adult</label>
</div>

<div>
  <input type="radio" id="senior" name="ticket_type" value="senior">
  <label for="senior">Senior</label>
</div>
```

When we select one of the radio buttons and then select another, it will deselect the first one. Radio buttons know to do this because they have the same `name` attribute. This is how the browser knows these elements are part of the same group of options.

We can set the default selected radio button by adding the `checked` attribute to it:

```html
<h1>Ticket Type</h1>
<div>
  <input type="radio" id="child" name="ticket_type" value="child">
  <label for="child">Child</label>
</div>

<div>
  <input type="radio" id="adult" name="ticket_type" value="adult" checked>
  <label for="adult">Adult</label>
</div>

<div>
  <input type="radio" id="senior" name="ticket_type" value="senior">
  <label for="senior">Senior</label>
</div>
```

**Checkboxes**

Checkboxes are similar to radio buttons in that they allow users to choose from a set of predefined options. But unlike radio buttons, they allow multiple options to be selected at once.

To create a checkbox, we use the input element with a `type` attribute of "checkbox":

```html
<h1>Pizza Toppings</h1>

<div>
  <input type="checkbox" id="sausage" name="topping" value="sausage">
  <label for="sausage">Sausage</label>
</div>

<div>
  <input type="checkbox" id="onions" name="topping" value="onions">
  <label for="onions">Onions</label>
</div>

<div>
  <input type="checkbox" id="pepperoni" name="topping" value="pepperoni">
  <label for="pepperoni">Pepperoni</label>
</div>

<div>
  <input type="checkbox" id="mushrooms" name="topping" value="mushrooms">
  <label for="mushrooms">Mushrooms</label>
</div>
```

We can also have a single checkbox when we want users to toggle if they want something to be true or false. Like signing up to a newsletter when they create an account for example:

```html
<div>
  <input type="checkbox" id="newsletter" name="news_letter">
  <label for="newsletter">Send me the news letter</label>
</div>
```

We can set checkboxes to be checked by default on page load by giving them a `checked` attribute:

```html
<div>
  <input type="checkbox" id="newsletter" name="news_letter" checked>
  <label for="newsletter">Send me the news letter</label>
</div>
```

### Buttons

The button element creates clickable buttons that the user can interact with to submit forms and trigger other actions.

To create a button, we use the `<button>` element. The content or text we want to have displayed inside the button will go within the opening and closing tags:

```html
<button>Click Me</button>
```

The button element also accepts a `type` attribute that tells the browser which kind of button it is dealing with. There are three types of buttons available to us.

**Submit buttons**

Once a user is finished filling in a form, they will need a way to submit it. There is a specialized button for this; the submit button. When a submit button is clicked, it will submit the form it is contained within. The `type` attribute has a value of submit by default, i.e. if the `type` is not specified or the value provided is invalid.

To create a submit button, we use the button element with a `type` attribute of "submit":

```html
<button type="submit">Submit</button>
```

**Reset button**

A reset button clears all the data the user has entered into the form and sets all the inputs in the form back to what they were initially.

To create a reset button, we use the button element with a `type` attribute of "reset":

```html
<button type="reset">Reset</button>
```

**Generic button**

The third and final button type is a generic button that can be used for anything. It's commonly used with JS for creating interactive UI's.

To create a generic button, we use the button element with a `type` attribute of "button":

```html
<button type="button">Click to Toggle</button>
```

<div class="lesson-note lesson-note--tip" markdown=1>
It is important to remember that a button within a form with the `type` value of submit (which happens to be the default value) will always try to make a new request and submit data back to the server. Hence, for buttons that are used within a form for different purposes other than submitting the data, the `type` attribute should always be specified to avoid unwanted effects of submitting a form.
</div>

### Organizing form elements

Using the correct inputs for the data we want users to enter goes a long way towards making our forms user friendly. However, in larger forms, users can easily get overwhelmed and discouraged if there are many inputs to fill in.

Luckily, HTML provides a couple of elements that make it easy to organize forms into sections that are visually distinct and manageable to digest.

**Fieldset element**

The fieldset element is a container element that allows us to group related form inputs into one logical unit.

To create a fieldset, we use the `<fieldset>` element. Whatever form inputs we want to group together go within the opening and closing fieldset tags:

```html
<fieldset>
  <label for="first_name">First Name</label>
  <input type="text" id="first_name" name="first_name">

  <label for="last_name">Last Name</label>
  <input type="text" id="last_name" name="last_name">
</fieldset>
```

**Legend**

The legend element is used to give field sets a heading or caption so the user can see what a grouping of inputs is for.

To create a legend, we use the `<legend>` element with the text we want to display within its opening and closing tags. A legend should always come right after an opening fieldset tag:

```html
<fieldset>
  <legend>Contact Details</legend>

  <label for="name">Name:</label>
  <input type="text" id="name" name="name">

  <label for="phone_number">Phone Number:</label>
  <input type="tel" id="phone_number" name="phone_number">

  <label for="email">Email:</label>
  <input type="email" id="email" name="email">
</fieldset>

<fieldset>
  <legend>Delivery Details</legend>

  <label for="street_address">Street Address:</label>
  <input type="text" id="street_address" name="street_address">

  <label for="city">City:</label>
  <input type="text" id="city" name="city">

  <label for="zip_code">Zip Code:</label>
  <input type="text" id="zip_code" name="zip_code">
</fieldset>
```

A common use-case for these elements is using a fieldset to group radio buttons and using a legend to communicate to the user what each of the options is ultimately for:

```html
<fieldset>
  <legend>What would you like to drink?</legend>

  <div>
    <input type="radio" name="drink" id="coffee" value="coffee">
    <label for="coffee">Coffee</label>
  </div>

  <div>
    <input type="radio" name="drink" id="tea" value="tea">
    <label for="tea">Tea</label>
  </div>

  <div>
    <input type="radio" name="drink" id="soda" value="soda">
    <label for="soda">Soda</label>
  </div>
</fieldset>
```

### A note on styling forms

We will provide resources that go deep into styling forms in the assignment section that comes next. However, before we get to the assignment, we should talk about some of the challenges with styling HTML forms and how we can get around them:

**Default browser styles**

Each browser has its own default styles for form controls, making your forms visually different for users depending on what browser they are using.

To have a consistent design among all browsers, we have to override these default styles and style them ourselves.

**Tricky and downright impossible to style form controls**

Text-based form controls like text, email, password and text areas are reasonably straightforward to style. They operate like any other HTML element, and most CSS properties can be used on them.

Things get more tricky when creating custom styles for radio buttons and checkboxes. But there are many [guides](https://moderncss.dev/pure-css-custom-checkbox-style) out there you can use to achieve your desired design. There have also been [new CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/accent-color) made available in recent times to make styling radio buttons and checkboxes much easier.

Certain aspects of other elements are downright impossible to style, for example, calendar or date pickers. If we want custom styles for these, we will have to build custom form controls with JavaScript or use one of the many JavaScript libraries that provide us with ready-made solutions.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Form basics

1. Read and follow along to [MDN's Introductory Guides to Forms](https://developer.mozilla.org/en-US/docs/Learn/Forms#introductory_guides) - complete [Your first form](https://developer.mozilla.org/en-US/docs/Learn/Forms/Your_first_form) and [How to structure a web form](https://developer.mozilla.org/en-US/docs/Learn/Forms/How_to_structure_a_web_form)
2. Read and follow along to [MDN's The Different Form Controls Guides](https://developer.mozilla.org/en-US/docs/Learn/Forms#the_different_form_controls)

#### Styling forms

1. Read and follow along to [MDN's Form Styling Guides](https://developer.mozilla.org/en-US/docs/Learn/Forms#form_styling_guides)
2. Read and follow along to [the internetingishard guide to forms](https://internetingishard.netlify.app/html-and-css/forms/index.html)

</div>

### Knowledge check

- [Explain what the form element is for and what two attributes it should always include.](#the-form-element)
- [Explain what form controls are at a high level.](#form-controls)
- [What is the `name` attribute for?](#the-name-attribute)
- [What are the three most common form controls you can use for allowing users to select predefined options?](#selection-elements)
- [What are the three types of buttons in HTML?](#buttons)
- [What are the two most challenging aspects of styling forms?](#a-note-on-styling-forms)

### Additional resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental.

- [Web.dev's Form Course](https://web.dev/learn/forms/)
