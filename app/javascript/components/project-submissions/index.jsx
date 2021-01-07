import React from 'react';
import PropTypes from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';
import ProjectSubmissionContext from './ProjectSubmissionContext';

const ProjectSubmissions = ({
  submissions, course, lesson, userId, allSubmissionsPath, userSubmission,
}) => (
  <ProjectSubmissionContext.Provider value={{
    userId, lesson, course, allSubmissionsPath,
  }}
  >
    <ProjectSubmissionsContainer submissions={submissions} userSubmission={userSubmission} />
  </ProjectSubmissionContext.Provider>
);

ProjectSubmissions.defaultProps = {
  allSubmissionsPath: '',
  userId: null,
  userSubmission: null,
};

ProjectSubmissions.propTypes = {
  userId: PropTypes.number,
  submissions: PropTypes.array.isRequired,
  lesson: PropTypes.object.isRequired,
  course: PropTypes.object.isRequired,
  allSubmissionsPath: PropTypes.string,
  userSubmission: PropTypes.object,
};

export default ProjectSubmissions;
