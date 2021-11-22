import { Controller } from '@hotwired/stimulus';
import { debounce } from 'lodash';
import axios from '../src/js/axiosWithCsrf';

axios.defaults.headers.common['Content-Type'] = 'application/json';

export default class ProgressController extends Controller {
  static targets = ['percentage'];

  static values = {
    url: String,
    percent: String,
  };

  initialize() {
    this.fetchProgress = debounce(this.fetchProgress, 400).bind(this);
  }

  connect() {
    this.fetchProgress();
  }

  fetchProgress() {
    axios.get(this.urlValue).then((response) => {
      const { percentage } = response.data;

      this.percentValue = percentage;
      this.percentageTarget.textContent = `${percentage}%`;
    });
  }
}
