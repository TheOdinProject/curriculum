import React, { useState } from 'react';

import Modal from './modal';
import ReportForm from './report-form';

const Submission = ({submission, userId, openEditModal, handleReport}) => {
  const [showReportModal, setShowReportModal] = useState(false);

  return (
    <div className="submissions__item">
      <p className="submissions__user">{submission.user_name}</p>

      <div className="submissions__actions">

        { userId === submission.user_id &&
          <button className="submissions__button submissions__button--green" onClick={openEditModal}>Edit Solution</button>
        }

        <a href={submission.repo_url} target="_blank" className="submissions__button">View Code</a>
        <a href={submission.live_preview_url} target="_blank" className="submissions__button">Live Preview</a>
        <a
          href="#"
          className="submissions__report"
          onClick={(event) => { event.preventDefault(); setShowReportModal(true)}}
        >
          <i className="fas fa-flag "></i>
        </a>
      </div>

      <Modal show={showReportModal} handleClose={() => setShowReportModal(false)}>
        <ReportForm
          submission={submission}
          onSubmit={handleReport}
          onClose={() => setShowReportModal(false)}
        />
      </Modal>
    </div>
  )
}

export default Submission
