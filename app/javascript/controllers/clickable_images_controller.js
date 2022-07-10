/* eslint class-methods-use-this: ["error", { "exceptMethods": ["makeImageChildOfAnchor"] }] */
import { Controller } from '@hotwired/stimulus';

export default class ClickableImagesController extends Controller {
  connect() {
    const images = this.element.getElementsByTagName('img');

    // If there is already a wrapping anchor tag, we do not want to add another
    [...images]
      .filter((image) => image.parentElement.nodeName !== 'a')
      .forEach(this.makeImageChildOfAnchor);
  }

  makeImageChildOfAnchor(image) {
    const wrappingAnchor = document.createElement('a');

    wrappingAnchor.href = image.getAttribute('src');

    // Append after image in DOM tree, then embed image into the anchor
    image.after(wrappingAnchor);
    wrappingAnchor.appendChild(image);
  }
}
