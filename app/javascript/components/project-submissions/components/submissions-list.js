import React from 'react';

import Submission from './submission'

const SubmissionsList = ({submissions}) =>
  <div>
    {submissions.map(submission => (
      <Submission submission={submission} key={submission.id}/>
    ))}
  </div>

  export default SubmissionsList
