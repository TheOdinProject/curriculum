import { Controller } from '@hotwired/stimulus';

export default class AdminFlashController extends Controller {
  static values = {
    expiresAt: String,
    id: Number,
  };

  hide() {
    const expiresAt = new Date(this.expiresAtValue).toUTCString();
    document.cookie = `admin_flash_${this.idValue}=disabled; expires=${expiresAt}; path=/`;
  }
}
