### Introduction
Forms are a crucial part of most websites. Almost every major site has sign-up forms, contact forms, search forms and more!  Luckily HTML5 and JavaScript have some handy built-in methods.

- [This tutorial](https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Form_validation) covers pretty much everything you need to know about HTML form validation.
- For Reference, [this document](https://www.w3schools.com/js/js_validation_api.asp) covers the JavaScript validation API in a more concise format.  These functions were explained in the previous article.  Typically, with HTML forms, the inputs are validated upon form submission, but you can use these functions to check validity whenever you like (such as when a user clicks or tabs out of a specific input field).

### Learning Outcomes
By the end of this lesson, you should be able to do the following:

- Understand the importance of validation in HTML forms.
- Add validation attributes in HTML forms.
- Understand Constraint Validation API for more control over form validation.
- Add custom styling to validation errors.
- Add validation using only JavaScript.

### Practice

### Warm-up

Go back to your 'Library' project and add simple validation to that form! Don't let your users submit without filling in all the fields! Don't forget to use your Git workflow skills you learned in [this foundations lesson](https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/revisiting-rock-paper-scissors) to make a new branch, work on your feature and merge it back to main when it's all done.

### Project

Build a browser form which collects Email, Country, Zip Code, Password and Password Confirmation fields.  It should use live inline validation to inform the user whether a field is properly filled in or not.  That means highlighting a field red and providing a helpful error message until it has been filled in properly.

The form doesn't need to actually submit, but you should give an error message if the button is pushed with any active errors or unfilled required fields.  If all is well and the form is "submitted", give the user a high five.

1. Set up a blank HTML document
2. Think about how you would set up the different form elements and their accompanying validators.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
3. Write the simple form elements.  Don't worry about styling them.
4. Add the JavaScript code that checks validation as the user progresses through the form.  When a user leaves a form field, it should automatically validate that field.
5. Test out all possible cases.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#what_is_form_validation'>Understand the importance of validating HTML forms before submitting them to a server.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#different_types_of_client-side_validation'>Describe the two types of client-side form validation, built-in form validation and validation using JavaScript.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#built-in_form_validation_examples'>Write validation checks for HTML forms by using validation attributes.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#validating_forms_using_javascript'>Understand JavaScript Constraint Validation API provides more control and customization of form validation.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#the_constraint_validation_api'>Use JavaScript to write custom error messages and add custom styling to the errors.</a>
- <a class="knowledge-check-link" href='https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#validating_forms_without_a_built-in_api'>Understand forms can also be validated without using Constraint Validation API, which is useful in certain cases.</a>
