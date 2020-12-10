import React from 'react';
import PropTypes from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';
import ProjectSubmissionContext from './ProjectSubmissionContext';

const ProjectSubmissions = ({
  submissions, course, lesson, userId, allSubmissionsPath, legacySubmissionsUrl, userSubmission,
}) => (
  <ProjectSubmissionContext.Provider value={{
    userId, lesson, course, allSubmissionsPath, legacySubmissionsUrl,
  }}
  >
    <ProjectSubmissionsContainer submissions={submissions} userSubmission={userSubmission} />
  </ProjectSubmissionContext.Provider>
);

ProjectSubmissions.defaultProps = {
  allSubmissionsPath: '',
  userId: null,
  userSubmission: null,
  legacySubmissionsUrl: null,
};

ProjectSubmissions.propTypes = {
  userId: PropTypes.number,
  submissions: PropTypes.array.isRequired,
  lesson: PropTypes.object.isRequired,
  course: PropTypes.object.isRequired,
  allSubmissionsPath: PropTypes.string,
  legacySubmissionsUrl: PropTypes.string,
  userSubmission: PropTypes.object,
};

export default ProjectSubmissions;
