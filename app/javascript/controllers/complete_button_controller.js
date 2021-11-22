/* eslint class-methods-use-this: ["error", { "exceptMethods": ["emitUpdateProgressEvent"] }] */
import { Controller } from '@hotwired/stimulus';
import { decamelizeKeys } from 'humps';
import { Notyf } from 'notyf';
import axios from '../src/js/axiosWithCsrf';

axios.defaults.headers.common['Content-Type'] = 'application/json';

export default class CompleteButton extends Controller {
  static targets = ['text'];

  static classes = ['loading', 'completed'];

  static values = {
    id: Number,
    isCompleted: Boolean,
    isLoading: Boolean,
  };

  connect() {
    this.setState(this.isCompletedValue);
  }

  toggle({ params }) {
    const { id } = params;
    const requestMethod = this.isCompletedValue ? 'delete' : 'post';

    this.isLoadingValue = true;

    axios({
      method: requestMethod,
      url: `/lessons/${id}/lesson_completions`,
      data: decamelizeKeys(params),
    }).then(() => {
      this.onSuccess();
    }).catch(() => {
      this.onFailure();
    });
  }

  onSuccess() {
    setTimeout(() => {
      this.isLoadingValue = false;
      this.isCompletedValue = !this.isCompletedValue;
      this.emitUpdateProgressEvent();
    }, 500);
  }

  onFailure() {
    const message = this.isCompletedValue ? 'Unable to mark incomplete' : 'Unable to mark complete';
    const notyf = new Notyf();

    this.isLoadingValue = false;

    notyf.error({
      message,
      dismissible: true,
      duration: 9000,
      ripple: false,
      position: {
        x: 'right',
        y: 'top',
      },
    });
  }

  emitUpdateProgressEvent() {
    const event = new CustomEvent('update-progress', { bubbles: true });
    window.dispatchEvent(event);
  }

  isLoadingValueChanged(loading) {
    if (loading) {
      this.element.classList.remove(this.completedClass);
      this.element.classList.add(this.loadingClass);
      this.element.disabled = true;
    } else {
      this.element.classList.remove(this.loadingClass);
      this.element.disabled = false;
    }
  }

  isCompletedValueChanged(completed) {
    this.setState(completed);
  }

  setState(completed) {
    const buttonText = completed ? 'Lesson Completed' : 'Mark Complete';

    if (completed) {
      this.element.classList.add(this.completedClass);
    }

    if (this.hasTextTarget) {
      this.textTarget.textContent = buttonText;
    }
  }
}
