import axios from 'axios';

const token = document.querySelector('meta[name=csrf-token]') || { content: 'no-csrf-token' };

const axiosInstance = axios.create();
axiosInstance.defaults.headers.common['X-CSRF-Token'] = token.content;

export default axiosInstance;
