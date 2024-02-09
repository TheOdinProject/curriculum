### Introduction

Forms are a crucial part of most websites. Almost every major site has sign-up forms, contact forms, search forms and more!  Luckily HTML5 and JavaScript have some handy built-in methods. You've already learned about validation with HTML and styling validations with CSS in our [Form Validations](https://www.theodinproject.com/paths/full-stack-javascript/courses/intermediate-html-and-css/lessons/form-validation) lesson in the Intermediate HTML and CSS course.

In this lesson, we'll cover the Constraint Validation API: a way to validate forms on the frontend with JavaScript.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand the importance of validation in HTML forms.
- Understand Constraint Validation API for more control over form validation.
- Add validation using only JavaScript.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [This tutorial on Form Validation](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#validating_forms_using_javascript) covers how we can use JavaScript to validate forms, including the constraint validation API.

2. It'll also prove beneficial to go through the [Constraint Validation docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Constraint_validation).

3. For Reference, [this document](https://www.w3schools.com/js/js_validation_api.asp) covers the JavaScript validation API in a more concise format.  These functions were explained in the previous article.  Typically, with HTML forms, the inputs are validated upon form submission, but you can use these functions to check validity whenever you like (such as when a user clicks or tabs out of a specific input field).

</div>

### Practice

<div class="lesson-content__panel" markdown="1">

#### Warmup

Go back to your 'Library' project and add validation to that form! Don't let your users submit without filling in all the fields! Don't forget to use your Git workflow skills you learned in [this foundations lesson](https://www.theodinproject.com/lessons/foundations-revisiting-rock-paper-scissors) to make a new branch, work on your feature and merge it back to main when it's all done.

#### Project

Build a browser form which collects Email, Country, Zip Code, Password and Password Confirmation fields.  It should use live inline validation to inform the user whether a field is properly filled in or not.  That means highlighting a field red and providing a helpful error message until it has been filled in properly.

The form doesn't need to actually submit, but you should give an error message if the button is pushed with any active errors or unfilled required fields. For the sake of this lesson, make sure **all** of the validation occurs in the JavaScript file. If all is well and the form is "submitted", give the user a high five.

1. Set up a blank HTML document
2. Think about how you would set up the different form elements and their accompanying validators.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
3. Write the form elements.
4. Add the JavaScript code that checks validation as the user progresses through the form.  When a user leaves a form field, it should automatically validate that field.
5. Test out all possible cases.
6. Don't forget to style validations with CSS by using the `:valid` and `:invalid` pseudo-classes!

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [Explain the importance of validating HTML forms before submitting them to a server.](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#what_is_form_validation)
- [Describe the two types of client-side form validation.](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#different_types_of_client-side_validation)
- [Explain how JavaScript Constraint Validation API provides more control and customization of form validation.](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#validating_forms_using_javascript)
- [Could forms also be validated without using Constraint Validation API?](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#validating_forms_without_a_built-in_api)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
