/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Rails from '@rails/ujs';

import '../layouts/application.css';

import 'core-js/stable';
import 'regenerator-runtime/runtime';
import 'bootstrap/dist/js/bootstrap';
import 'hint.css/hint.min.css';
import 'notyf/notyf.min.css';

import '../src/js/analytics';
import '../src/js/axiosWithCsrf';
import '../src/js/faq';
import '../src/js/formValidations';
import '../src/js/lessons';
import '../src/js/bootstrapScripts';
import '../src/js/settings';
import '../src/js/navbar';
import '../src/js/admin_flash';
import '../src/js/odinDropDownMenu';
import '../src/js/scrollspy.min';
// import '../src/js/darkModeBeta';

import 'controllers';

Rails.start();

const componentRequireContext = require.context('components', true);
const ReactRailsUJS = require('react_ujs');

ReactRailsUJS.useContext(componentRequireContext);
