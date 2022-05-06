/* eslint react/no-danger: 0 */
import React from 'react';
import PropTypes from 'prop-types';

const LessonContentInput = ({ content }) => (
  <div className="lesson-content min-h-screen"><div dangerouslySetInnerHTML={{ __html: content }} /></div>
);

LessonContentInput.defaultProps = {
  content: '',
};

LessonContentInput.propTypes = {
  content: PropTypes.string,
};

export default LessonContentInput;
