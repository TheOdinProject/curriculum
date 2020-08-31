import React from 'react';
import { object, func, arrayOf } from 'prop-types';

import Submission from './submission'

const SubmissionsList = ({ submissions, handleDelete, onFlag, handleUpdate }) => {
  return (
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
  )
};

SubmissionsList.propTypes = {
  submissions: arrayOf(object).isRequired,
  handleDelete: func.isRequired,
  onFlag: func.isRequired,
  handleUpdate: func.isRequired,
}

export default SubmissionsList;
