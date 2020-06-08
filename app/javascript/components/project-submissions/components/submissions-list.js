import React from 'react';

import Submission from './submission'

const SubmissionsList = ({submissions, userId, openEditModal, handleReport}) =>
  <div>
    {submissions.map(submission => (
      <Submission
        submission={submission}
        key={submission.id}
        userId={userId}
        openEditModal={openEditModal}
        handleReport={handleReport}
      />
    ))}
  </div>

  export default SubmissionsList
