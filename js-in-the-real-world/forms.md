Forms are a crucial part of most websites. Almost every major site has sign-up forms, contact forms, search forms and more!  Luckily HTML5 and JavaScript have some handy built-in methods

- [This tutorial](https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Form_validation) covers pretty much everything you need to know about HTML form validation.
- For Reference, [this document](https://www.w3schools.com/js/js_validation_api.asp) covers the JavaScript validation API in a more concise format.  These functions were explained in the previous article.  Typically with HTML forms, the inputs are validated upon form submission, but you can use these functions to check validity whenever you like (such as when a user clicks or tabs out of a specific input field).

## Practice

### Warmup

Go back to your 'Library' project and add simple validation to that form!  Don't let your users submit without filling in all the fields!

### Project

Build a browser form which collects Email, Email Confirmation, Country, Zip Code, Password and Password Confirmation fields.  It should use live inline validation to inform the user whether a field is properly filled in or not.  That means highlighting a field red and providing a helpful error message until it has been filled in properly.

The form doesn't need to actually submit, but you should give an error message if the button is pushed with any active errors or unfilled required fields.  If all is well and the form is "submitted", give the user a high five.

1. Set up a blank HTML document
2. Think about how you would set up the different form elements and their accompanying validators.  What objects and functions will you need? A few minutes of thought can save you from wasting an hour of coding.  The best thing you can do is whiteboard the entire solution before even touching the computer.
3. Write the simple form elements.  Don't worry about styling them.
4. Add the JavaScript code that checks validation as the user progresses through the form.  When a user leaves a form field it should automatically validate that field.
5. Test out all possible cases.