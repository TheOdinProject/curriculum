/* eslint-disable */

import validate from 'validate.js';

const constraints = {
  'user[username]': {
    length: {
      minimum: 4,
      maximum: 20,
    },
  },
  'user[email]': {
    email: true,
  },
  'user[password]': {
    length: {
      minimum: 6,
      maximum: 128,
    },
  },
  'user[password_confirmation]': {
    equality: {
      attribute: 'user[password]',
      message: '^The passwords do not match',
    },
  },
  'user[current_password]': {
    length: {
      minimum: 6,
      maximum: 128,
    },
  },
  'user[learning_goal]': {
    length: {
      minimum: 4,
      maximum: 100,
    },
  },
};

document.addEventListener('DOMContentLoaded', () => {
  const forms = document.querySelectorAll('.form');
  if (!forms) return;

  forms.forEach((form) => {
    // Disable form submission if error
    form.addEventListener('submit', (ev) => {
      const formErrors = validate(form, constraints, { fullMessages: false });
      if (formErrors) {
        ev.preventDefault();
        handleFormSubmit(form);
        ev.stopPropagation();
      }
    });

    const inputs = form.querySelectorAll('.form__element');

    inputs.forEach((item) => {
      item.addEventListener('change', function (ev) {
        const errors = validate(form, constraints, { fullMessages: false }) || {};
        showErrorsForInput(this, errors[this.name]);
      });
    });
  });
});

function handleFormSubmit(form) {
  const formErrors = validate(form, constraints, { fullMessages: false });
  if (!formErrors) {
    form.submit();
  }
  showErrors(form, formErrors || {});
}

function showErrors(form, errors) {
  const formInputs = form.querySelectorAll('.form__element');
  formInputs.forEach((item) => {
    showErrorsForInput(item, errors[item.name]);
  });
}

function showErrorsForInput(input, errors) {
  const inputParent = input.parentNode;
  const errorWrapper = findErrorWrapper(input) || createErrorWrapper(input, inputParent);
  const errorDiv = findErrorDiv(input) || createErrorDiv(input, inputParent);

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
  }
  return null;
}

function createErrorWrapper(input, inputParent) {
  const newDiv = document.createElement('div');
  inputParent.appendChild(newDiv);
  newDiv.appendChild(input);
  return newDiv;
}

function findErrorDiv(input) {
  return document.querySelector(`.${input.id}`);
}

function createErrorDiv(input, inputParent) {
  const divName = document.createElement('div');
  divName.classList.add('form__error-message', 'push-down', input.id);
  inputParent.parentNode.insertBefore(divName, inputParent.nextSibling);
  return divName;
}
