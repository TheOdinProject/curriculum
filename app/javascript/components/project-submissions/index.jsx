import React from 'react';
import PropTypes from 'prop-types';
import ProjectSubmissionsContainer from './containers/project-submissions-container';


const ProjectSubmissions = ({ submissions, course, lesson, userId }) => (
  <ProjectSubmissionsContainer submissions={submissions} course={course} lesson={lesson} userId={userId} />
);

ProjectSubmissions.propTypes = {
  userId: PropTypes.number,
  submissions: PropTypes.array.isRequired,
  lesson: PropTypes.object.isRequired,
  course: PropTypes.object.isRequired,
};

export default ProjectSubmissions;
