import React from 'react';
import { object, bool } from 'prop-types';

const SubmissionTitle = ({ submission, isDashboardView }) => {
  if (isDashboardView) {
    return <a href={submission.lesson_path}>{ submission.lesson_title }</a>;
  }
  return submission.user_name;
};

SubmissionTitle.defaultProps = {
  isDashboardView: false,
};

SubmissionTitle.propTypes = {
  submission: object.isRequired,
  isDashboardView: bool,
};

export default SubmissionTitle;
