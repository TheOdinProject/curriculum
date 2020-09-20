import React from 'react';
import { number, array } from 'prop-types';
import UserProjectSubmissionsContainer from './containers/user-project-submissions-container';
import ProjectSubmissionContext from "./ProjectSubmissionContext";

const UserProjectSubmissions = ({ submissions, userId }) => (
  <ProjectSubmissionContext.Provider value={{ userId }}>
    <UserProjectSubmissionsContainer submissions={submissions} />
  </ProjectSubmissionContext.Provider>
);

UserProjectSubmissions.propTypes = {
  userId: number,
  submissions: array.isRequired,
};

export default UserProjectSubmissions;