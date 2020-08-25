import React from 'react';
import { number, array, object } from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';
import ProjectSubmissionContext from "./ProjectSubmissionContext";

const ProjectSubmissions = ({ submissions, course, lesson, userId }) => (
  <ProjectSubmissionContext.Provider value={{ userId, lesson, course }}>
    <ProjectSubmissionsContainer submissions={submissions} />
  </ProjectSubmissionContext.Provider>
);

ProjectSubmissions.propTypes = {
  userId: number,
  submissions: array.isRequired,
  lesson: object.isRequired,
  course: object.isRequired,
};

export default ProjectSubmissions;
