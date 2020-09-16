import React, { useState, useMemo, useContext } from 'react';
import { object, func } from 'prop-types';

import Modal from './modal';
import EditForm from './edit-form';
import ProjectSubmissionContext from '../ProjectSubmissionContext';

const Submission = ({ submission, handleUpdate, onFlag, handleDelete }) => {
  const { userId } = useContext(ProjectSubmissionContext);
  const [showEditModal, setShowEditModal] = useState(false);
  const isCurrentUsersSubmission = useMemo(() =>
    userId === submission.user_id, [userId, submission.user_id]);


  const toggleShowEditModal = () => setShowEditModal(prevShowEditModal => !prevShowEditModal);

  return (
    <div className="submissions__item">
      <p className="submissions__user">{submission.user_name}</p>

      <div className="submissions__actions">
        {isCurrentUsersSubmission && (
          <button
            className="submissions__button submissions__button--green"
            onClick={toggleShowEditModal}
          >
            Edit Solution
          </button>
        )}
        <a href={submission.repo_url} target="_blank" className="submissions__button">View Code</a>
        <a href={submission.live_preview_url} target="_blank" className="submissions__button">Live Preview</a>

        {isCurrentUsersSubmission
          ? <span className={`submissions__public-icon submissions__public-icon${submission.is_public ? '--visible' : ''}`}><i className="fas fa-eye"></i></span>
          : <a className="submissions__flag" onClick={(event) => { event.preventDefault(); onFlag(submission)}}>
              <i className="fas fa-flag "></i>
            </a>
        }
      </div>

      <Modal show={showEditModal} handleClose={toggleShowEditModal}>
        <EditForm
          submission={submission}
          onSubmit={handleUpdate}
          onDelete={handleDelete}
          onClose={toggleShowEditModal}
        />
      </Modal>
    </div>
  );
};

Submission.propTypes = {
  submission: object.isRequired,
  handleUpdate: func.isRequired,
  onFlag: func.isRequired,
  handleDelete: func.isRequired,
};

export default Submission;
