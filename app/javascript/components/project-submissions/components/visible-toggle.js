import React from 'react';
import { object, func } from 'prop-types';

const VisibleToggle = ({ submission, handleVisibleToggle }) => {
  const updateObj = {
    repo_url: submission.repo_url,
    live_preview_url: submission.live_preview_url,
    is_public: !submission.is_public,
    project_submission_id: submission.id,
  };

  return (
    <a
      onClick={() => handleVisibleToggle(updateObj)}
      className={`submissions__public-icon submissions__public-icon${submission.is_public ? '--visible hint--top' : ' hint--top'}`}
      aria-label='Toggle visibility'>
      <i className="fas fa-eye"></i>
    </a>
  );
};

VisibleToggle.propTypes = {
  submission: object.isRequired,
  handleVisibleToggle: func,
}

export default VisibleToggle;
