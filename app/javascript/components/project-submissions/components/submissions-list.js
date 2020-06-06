import React from 'react';

import Submission from './submission'

const SubmissionsList = ({submissions, userId, openEditModal}) =>
  <div>
    {submissions.map(submission => (
      <Submission submission={submission} key={submission.id} userId={userId} openEditModal={openEditModal} />
    ))}
  </div>

  export default SubmissionsList
