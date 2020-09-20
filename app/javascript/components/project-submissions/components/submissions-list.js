import React from 'react';
import { object, func, arrayOf, string, bool } from 'prop-types';

import Submission from './submission'

const noop = () => {}

const SubmissionsList = ({ submissions, handleDelete, onFlag, handleUpdate, allSubmissionsPath, isDashboardView }) => {
  console.log("all submissions path", allSubmissionsPath)
  return (
    <div>
      <div>
        {submissions.map(submission => (
          <Submission
            key={submission.id}
            submission={submission}
            handleUpdate={handleUpdate}
            onFlag={onFlag}
            handleDelete={handleDelete}
            isDashboardView={isDashboardView}
          />
        ))}
      </div>

      { allSubmissionsPath.length > 0 &&
        <p className="submissions__view-more">
          Showing {submissions.length} most recent submissions.
          <a href={allSubmissionsPath}> View full list of solutions here.</a>
        </p>
      }
    </div>
  )
};

SubmissionsList.defaultProps = {
  allSubmissionsPath: '',
  onFlag: noop,
  isDashboardView: false,
}

SubmissionsList.propTypes = {
  submissions: arrayOf(object).isRequired,
  handleDelete: func.isRequired,
  onFlag: func,
  handleUpdate: func.isRequired,
  allSubmissionsPath: string,
  isDashboardView: bool,
}

export default SubmissionsList;
