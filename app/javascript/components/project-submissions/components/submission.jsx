import React, {
  useState, useMemo, useContext, forwardRef,
} from 'react';
import { object, func, bool } from 'prop-types';

import Modal from './modal';
import EditForm from './edit-form';
import ProjectSubmissionContext from '../ProjectSubmissionContext';
import SubmissionTitle from './submission-title';
import Like from './like';

const noop = () => { };

const Submission = forwardRef(({
  submission, handleUpdate, onFlag, handleDelete, isDashboardView, handleLikeToggle,
}, ref) => {
  const { userId } = useContext(ProjectSubmissionContext);
  const [showEditModal, setShowEditModal] = useState(false);
  const isCurrentUsersSubmission = useMemo(() => (
    userId === submission.user_id
  ), [userId, submission.user_id]);

  const toggleShowEditModal = () => setShowEditModal((prevShowEditModal) => !prevShowEditModal);
  const livePreview = submission.live_preview_url.length > 0;

  return (
    <div className="submissions__item" ref={ref} data-test-id="submission-item">
      <div className="submissions__left-container">
        <Like submission={submission} handleLikeToggle={handleLikeToggle} />
        <p className="submissions__submission-title">
          <SubmissionTitle
            submission={submission}
            isCurrentUsersSubmission={isCurrentUsersSubmission}
            isDashboardView={isDashboardView}
          />
        </p>
      </div>

      <div className="submissions__actions">
        <a
          href={submission.repo_url}
          target="_blank"
          rel="noreferrer"
          className="submissions__button"
          data-test-id="view-code-btn"
        >
          View Code
        </a>
        {livePreview
          && (
          <a
            href={submission.live_preview_url}
            target="_blank"
            rel="noreferrer"
            className="submissions__button"
            data-test-id="live-preview-btn"
          >
            Live Preview
          </a>
          )}

        {isCurrentUsersSubmission
          ? (
            <div
              className="submissions__button--edit"
              onMouseDown={toggleShowEditModal}
              role="button"
              tabIndex={0}
              aria-label="edit-button"
              data-test-id="edit-submission-btn"
            />
          )
          : (
            <button
              className="link-button submissions__flag hint--top"
              aria-label="Report submission"
              type="button"
              data-test-id="flag-btn"
              onClick={(e) => { e.preventDefault(); onFlag(submission); }}
            >
              <i className="fas fa-flag" />
            </button>
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
    </div>
  );
});

Submission.defaultProps = {
  onFlag: noop,
  isDashboardView: false,
};

Submission.propTypes = {
  submission: object.isRequired,
  handleUpdate: func.isRequired,
  onFlag: func,
  handleDelete: func.isRequired,
  handleLikeToggle: func.isRequired,
  isDashboardView: bool,
};

export default Submission;
