import { Controller } from '@hotwired/stimulus';
import { useClickOutside } from 'stimulus-use';

import { toggle, leave } from 'el-transition';

export default class DropdownController extends Controller {
  static targets = ['content'];

  connect() {
    useClickOutside(this);
  }

  toggle() {
    toggle(this.contentTarget);
  }

  clickOutside() {
    if (!this.contentTarget.classList.contains('hidden')) {
      leave(this.contentTarget);
    }
  }
}
