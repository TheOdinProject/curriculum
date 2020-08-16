import React from 'react';

import Submission from './submission'

const SubmissionsList = ({ submissions, ...otherProps }) =>
  <div>
    {submissions.map(submission => (
      <Submission
        submission={submission}
        key={submission.id}
        { ...otherProps }
      />
    ))}
  </div>

  export default SubmissionsList
