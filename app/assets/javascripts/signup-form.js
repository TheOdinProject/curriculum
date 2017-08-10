var constraints = {
  "user[username]": {
    presence: true,
    length: {
      minimum: 4,
      maximum: 20
    }
  },
  "user[email]": {
    presence: true,
    email: true
  },
  "user[password]": {
    presence: true,
    length: {
      minimum: 6,
      maximum: 128
    }
  },
  "user[password_confirmation]": {
    presence: true,
    equality: {
      attribute: "user[password]",
      message: "^The passwords do not match"
    }
  }
};

document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('form.new_user');
  if (!form) return;
  var inputs = document.querySelectorAll('.auth-form__element');

  inputs.forEach(function(item) {    
    item.addEventListener("change", function(ev) {
      var errors = validate(form, constraints, { fullMessages: false }) || {};
      showErrorsForInput(this, errors[this.name]);
    });
  });
});

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
  divName.classList.add('auth-form__error-message', 'push-down', input.id);
  inputParent.parentNode.insertBefore(divName, inputParent.nextSibling);
  return divName;
}
