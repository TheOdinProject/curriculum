import React, { useState, useMemo, useContext } from 'react';
import { object, func } from 'prop-types';

import Modal from './modal';
import FlagForm from './flag-form';
import EditForm from './edit-form';
import ProjectSubmissionContext from '../ProjectSubmissionContext';
import SubmissionsList from './submissions-list';

const Submission = ({ submission, handleUpdate, handleFlag, handleDelete }) => {
  const { userId } = useContext(ProjectSubmissionContext);
  const [showFlagModal, setShowFlagModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const isCurrentUsersSubmission = useMemo(() =>
    userId === submission.user_id, [userId, submission.user_id]);

  const toggleShowFlagModal = () => setShowFlagModal(prevShowFlagModal => !prevShowFlagModal);
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
        {!isCurrentUsersSubmission && (
          <a className="submissions__flag" onClick={(event) => { event.preventDefault(); toggleShowFlagModal()}}>
            <i className="fas fa-flag "></i>
          </a>
        )}
      </div>

      <Modal show={showEditModal} handleClose={toggleShowEditModal}>
        <EditForm
          submission={submission}
          onSubmit={handleUpdate}
          onDelete={handleDelete}
          onClose={toggleShowEditModal}
        />
      </Modal>

      <Modal show={showFlagModal} handleClose={toggleShowFlagModal}>
        <FlagForm
          submission={submission}
          onSubmit={handleFlag}
          onClose={toggleShowFlagModal}
        />
      </Modal>
    </div>
  );
};

Submission.propTypes = {
  submission: object.isRequired,
  handleUpdate: func.isRequired,
  handleFlag: func.isRequired,
  handleDelete: func.isRequired,
};

export default Submission;
