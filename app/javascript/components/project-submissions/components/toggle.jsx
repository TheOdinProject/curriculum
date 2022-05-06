/* eslint-disable react/jsx-props-no-spreading */
import React from 'react';
import PropTypes from 'prop-types';

const toggleBodyClassNames = `
  relative inline-flex flex-shrink-0
  h-6 w-12
  border-2 border-transparent rounded-full
  cursor-pointer
  transition-colors ease-in-out duration-200
  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-odin-green
`;

const toggleSpanClassNames = `
  inline-block
  h-5 w-5
  pointer-events-none
  rounded-full bg-white shadow
  transform ring-0 transition ease-in-out duration-200
`;

const Toggle = ({ label, isToggled, onClick }) => (
  <div className="flex items-center my-5 justify-center">
    <p className="font-bold">{label}</p>
    <div className="my-0 mx-4" data-test-id="is-public-toggle-slider">
      <button
        id="is_public"
        type="button"
        onClick={onClick}
        className={`${toggleBodyClassNames} ${isToggled ? 'bg-odin-green' : 'bg-gray-200'}`}
        role="switch"
        aria-checked={isToggled}
      >
        <span className="sr-only">{label}</span>
        <span
          aria-hidden="true"
          className={`${toggleSpanClassNames} ${isToggled ? 'translate-x-6' : 'translate-x-0'}`}
        />
      </button>
    </div>
  </div>
);

Toggle.defaultProps = {
  label: undefined,
};

Toggle.propTypes = {
  label: PropTypes.string,
  isToggled: PropTypes.bool.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Toggle;
