import { Controller } from '@hotwired/stimulus';
import { debounce } from 'lodash';
import axios from '../src/js/axiosWithCsrf';

axios.defaults.headers.common['Content-Type'] = 'application/json';

export default class ProgressController extends Controller {
  static targets = ['percentage', 'progressCircle', 'loading'];

  static classes = ['loaded'];

  static values = {
    url: String,
    percent: Number,
    circumference: Number,
    loading: Boolean,
  };

  initialize() {
    this.fetchProgress = debounce(this.fetchProgress, 400).bind(this);
  }

  connect() {
    this.fetchProgress();
  }

  fetchProgress() {
    this.loadingValue = true;

    axios.get(this.urlValue).then((response) => {
      const { percentage } = response.data;

      this.loadingValue = false;
      this.percentValue = percentage;
      this.percentageTarget.textContent = `${percentage}% Complete`;
      this.percentageTarget.classList.add(this.loadedClass);
    });
  }

  percentValueChanged(percent) {
    const offset = this.circumferenceValue - (percent / 100) * this.circumferenceValue;

    setTimeout(() => { this.progressCircleTarget.style.strokeDashoffset = offset; }, 200);
  }

  loadingValueChanged(loading) {
    if (loading) {
      this.loadingTarget.classList.remove('hidden');
    } else {
      this.loadingTarget.classList.add('hidden');
    }
  }
}
