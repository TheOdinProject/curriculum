import React from 'react';
import PropTypes from 'prop-types';

const VisibleToggle = ({ submission, handleVisibleToggle }) => (
  <button
    onClick={() => handleVisibleToggle({ ...submission, is_public: !submission.is_public })}
    className={`link-button submissions__public-icon submissions__public-icon${submission.is_public ? '--visible hint--top' : ' hint--top'}`}
    aria-label="Toggle visibility"
    aria-hidden="true"
    type="button"
  >
    <i className="fas fa-eye" />
  </button>
);

VisibleToggle.propTypes = {
  submission: PropTypes.object.isRequired,
  handleVisibleToggle: PropTypes.func.isRequired,
};

export default VisibleToggle;
