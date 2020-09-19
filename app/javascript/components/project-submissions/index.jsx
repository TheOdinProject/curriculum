import React from 'react';
import { number, array, object, string } from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';
import ProjectSubmissionContext from "./ProjectSubmissionContext";

const ProjectSubmissions = ({ submissions, course, lesson, userId, allSubmissionsPath }) => (
  <ProjectSubmissionContext.Provider value={{ userId, lesson, course, allSubmissionsPath }}>
    <ProjectSubmissionsContainer submissions={submissions} />
  </ProjectSubmissionContext.Provider>
);

ProjectSubmissions.defaultProps = {
  allSubmissionsPath: '',
}

ProjectSubmissions.propTypes = {
  userId: number,
  submissions: array.isRequired,
  lesson: object.isRequired,
  course: object.isRequired,
  allSubmissionsPath: string,
};

export default ProjectSubmissions;
