import { Controller } from '@hotwired/stimulus';

export default class CustomEventsController extends Controller {
  static values = {
    eventName: String,
    payload: { type: Object, default: {} },
  };

  emit() {
    this.dispatch(this.eventNameValue, { detail: { content: this.payloadValue } });
  }
}
