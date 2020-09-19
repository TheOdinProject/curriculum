import React from 'react';
import { object, func, arrayOf, string } from 'prop-types';

import Submission from './submission'

const SubmissionsList = ({ submissions, handleDelete, onFlag, handleUpdate, allSubmissionsPath }) => {
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

SubmissionsList.allSubmissionsPath = {
  allSubmissionsPath: '',
}

SubmissionsList.propTypes = {
  submissions: arrayOf(object).isRequired,
  handleDelete: func.isRequired,
  onFlag: func.isRequired,
  handleUpdate: func.isRequired,
  allSubmissionsPath: string,
}

export default SubmissionsList;
