import validate from 'validate.js';

var constraints = {
  "user[username]": {
    length: {
      minimum: 4,
      maximum: 20
    }
  },
  "user[email]": {
    email: true
  },
  "user[password]": {
    length: {
      minimum: 6,
      maximum: 128
    }
  },
  "user[password_confirmation]": {
    equality: {
      attribute: "user[password]",
      message: "^The passwords do not match"
    }
  },
  "user[current_password]": {
    length: {
      minimum: 6,
      maximum: 128
    }
  },
  "user[learning_goal]": {
    length: {
      minimum: 4,
      maximum: 100
    }
  },
};

document.addEventListener('turbolinks:load', function() {
  var forms = document.querySelectorAll('.form');
  if (!forms) return;

  forms.forEach(function(form) {

    // Disable form submission if error
    form.addEventListener("submit", function(ev) {
      var formErrors = validate(form, constraints, { fullMessages: false });
      if (formErrors) {
        ev.preventDefault();
        handleFormSubmit(form);
        ev.stopPropagation();
      }
    })

    var inputs = form.querySelectorAll('.form__element');

    inputs.forEach(function(item) {
      item.addEventListener("change", function(ev) {
        var errors = validate(form, constraints, { fullMessages: false }) || {};
        showErrorsForInput(this, errors[this.name]);
      });
    });
  });
});

function handleFormSubmit(form) {
  var formErrors = validate(form, constraints, { fullMessages: false });
  if (!formErrors) {
    form.submit();
  }
  showErrors(form, formErrors || {});
}

function showErrors(form, errors) {
  var formInputs = form.querySelectorAll('.form__element');
  formInputs.forEach(function(item) {
    showErrorsForInput(item, errors[item.name]);
  });
}

function showErrorsForInput(input, errors) {
  var inputParent = input.parentNode;
  var errorWrapper = findErrorWrapper(input) || createErrorWrapper(input, inputParent);
  var errorDiv = findErrorDiv(input) || createErrorDiv(input, inputParent);

  if (!errors) {
    errorWrapper.parentNode.insertBefore(input, errorWrapper);
    errorWrapper.parentNode.removeChild(errorWrapper);
    errorDiv.parentNode.removeChild(errorDiv);
    return;
  }

  errorWrapper.classList.add('field_with_errors');
  errorDiv.innerHTML = errors;
}

function findErrorWrapper(input) {
  if (input.parentNode.classList.contains('field_with_errors')) {
    return input.parentNode;
  } else {
    return null;
  }
}

function createErrorWrapper(input, inputParent) {
  var newDiv = document.createElement('div');
  inputParent.appendChild(newDiv);
  newDiv.appendChild(input);
  return newDiv;
}

function findErrorDiv(input) {
  return document.querySelector("." + input.id);
}

function createErrorDiv(input, inputParent) {
  var divName = document.createElement('div');
  divName.classList.add('form__error-message', 'push-down', input.id);
  inputParent.parentNode.insertBefore(divName, inputParent.nextSibling);
  return divName;
}
