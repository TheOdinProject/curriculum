import { Controller } from '@hotwired/stimulus';

export default class RevealController extends Controller {
  static targets = ['content', 'icon'];

  static values = {
    toggleClasses: Array,
  };

  toggle() {
    this.contentTarget.classList.toggle('hidden');
    this.toggleClassesValue.forEach((classValue) => this.iconTarget.classList.toggle(classValue));
  }
}
