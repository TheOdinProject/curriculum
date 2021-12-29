import React from 'react';
import { object, bool } from 'prop-types';

const SubmissionTitle = ({ submission, isDashboardView, isCurrentUsersSubmission }) => {
  if (isDashboardView) {
    return <a href={submission.lesson_path}>{ submission.lesson_title }</a>;
  }
  if (isCurrentUsersSubmission) {
    return <a href="/">{submission.user_name}</a>;
  }
  return submission.user_name;
};

SubmissionTitle.defaultProps = {
  isDashboardView: false,
  isCurrentUsersSubmission: false,
};

SubmissionTitle.propTypes = {
  submission: object.isRequired,
  isDashboardView: bool,
  isCurrentUsersSubmission: bool,
};

export default SubmissionTitle;
