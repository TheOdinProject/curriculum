import React from 'react';
import PropTypes from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';


const ProjectSubmissions = ({ submissions, course, lesson }) => (
  <ProjectSubmissionsContainer submissions={submissions} course={course} lesson={lesson} />
);

ProjectSubmissions.propTypes = {
  submissions: PropTypes.array.isRequired,
  lesson: PropTypes.object.isRequired,
  course: PropTypes.object.isRequired,
};

export default ProjectSubmissions;
