import React, { useState } from 'react';

import Modal from './modal';
import FlagForm from './flag-form';
import EditForm from './edit-form';

const Submission = ({submission, userId, handleUpdate, handleFlag, handleDelete}) => {
  const [showFlagModal, setShowFlagModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);

  const isCurrentUsersSubmission = () => (
    userId === submission.user_id
  )

  return (
    <div className="submissions__item">
      <p className="submissions__user">{submission.user_name}</p>

      <div className="submissions__actions">

        { isCurrentUsersSubmission() &&
          <button
            className="submissions__button submissions__button--green"
            onClick={() => setShowEditModal(true)}
          >
            Edit Solution
          </button>
        }

        <a href={submission.repo_url} target="_blank" className="submissions__button">View Code</a>
        <a href={submission.live_preview_url} target="_blank" className="submissions__button">Live Preview</a>
        <a className="submissions__flag" onClick={(event) => { event.preventDefault(); setShowFlagModal(true)}}>
          <i className="fas fa-flag "></i>
        </a>
      </div>

      <Modal show={showEditModal} handleClose={() => setShowEditModal(false)}>
        <EditForm
          submission={submission}
          onSubmit={handleUpdate}
          onDelete={handleDelete}
          onClose={() => setShowEditModal(false)}
        />
      </Modal>

      <Modal show={showFlagModal} handleClose={() => setShowFlagModal(false)}>
        <FlagForm
          submission={submission}
          onSubmit={handleFlag}
          onClose={() => setShowFlagModal(false)}
        />
      </Modal>
    </div>
  )
}

export default Submission
