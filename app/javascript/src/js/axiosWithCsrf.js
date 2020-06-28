import axios from 'axios';

const elements = document.querySelectorAll('meta[name=csrf-token]');
const csrfToken = elements[0].getAttribute('content');
const axiosInstance = axios.create();

axiosInstance.defaults.headers.common['X-CSRF-Token'] = csrfToken;

export default axiosInstance;
