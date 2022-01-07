/* eslint no-await-in-loop:0, no-restricted-syntax:0 */
import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class MobileMenuController extends Controller {
  static targets = ['container', 'menuOverlay', 'menu', 'closeButton'];

  open() {
    this.menuElements().forEach((menuElement) => enter(menuElement));
  }

  async close() {
    const menuElements = this.menuElements().reverse();

    for (const menuElement of menuElements) {
      await leave(menuElement);
    }
  }

  menuElements() {
    return [
      this.containerTarget,
      this.menuOverlayTarget,
      this.menuTarget,
      this.closeButtonTarget,
    ];
  }
}
