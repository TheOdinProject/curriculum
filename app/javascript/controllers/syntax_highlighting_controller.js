import { Controller } from '@hotwired/stimulus';
import Prism from 'prismjs';

export default class SyntaxHighlightingController extends Controller {
  connect() {
    Prism.highlightAllUnder(this.element);
  }
}
