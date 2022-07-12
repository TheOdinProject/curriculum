import { Controller } from '@hotwired/stimulus';

export default class ExternalLinkTargetsController extends Controller {
  connect() {
    this.element
      .querySelectorAll('a[href^=http]')
      .forEach((externalLink) => {
        externalLink.setAttribute('target', '_blank');
        externalLink.setAttribute('rel', 'noreferrer');
      });
  }
}
