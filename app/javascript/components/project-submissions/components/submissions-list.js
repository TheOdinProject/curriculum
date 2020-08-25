import React from 'react';
import { object, func, arrayOf } from 'prop-types';

import Submission from './submission'

const SubmissionsList = ({ submissions, handleDelete, handleFlag, handleUpdate }) => {
  return (
    <div>
      {submissions.map(submission => (
        <Submission
          key={submission.id}
          submission={submission}
          handleUpdate={handleUpdate}
          handleFlag={handleFlag}
          handleDelete={handleDelete}
        />
      ))}
    </div>
  )
};

SubmissionsList.propTypes = {
  submissions: arrayOf(object).isRequired,
  handleDelete: func.isRequired,
  handleFlag: func.isRequired,
  handleUpdate: func.isRequired,
}

export default SubmissionsList;
