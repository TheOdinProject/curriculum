import React from 'react';
import PropTypes from 'prop-types';
import UserProjectSubmissionsContainer from './containers/user-project-submissions-container';
import ProjectSubmissionContext from './ProjectSubmissionContext';

const UserProjectSubmissions = ({ submissions, userId }) => (
  <ProjectSubmissionContext.Provider value={{ userId }}>
    <UserProjectSubmissionsContainer submissions={submissions} />
  </ProjectSubmissionContext.Provider>
);

UserProjectSubmissions.propTypes = {
  userId: PropTypes.number.isRequired,
  submissions: PropTypes.array.isRequired,
};

export default UserProjectSubmissions;
