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

const submissionItemClassnames = `
  relative py-4
  border-solid border-t border-gray-300
  flex flex-col md:flex-row justify-between items-center
`;

const submissionButtonClassnames = `
  button button--gray font-semibold
`;

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
    <div className={submissionItemClassnames} ref={ref} data-test-id="submission-item">
      <div className="flex items-center mb-4 md:mb-0">
        <Like submission={submission} handleLikeToggle={handleLikeToggle} />
        <p className="font-semibold text-xl break-words">
          <SubmissionTitle
            submission={submission}
            isCurrentUsersSubmission={isCurrentUsersSubmission}
            isDashboardView={isDashboardView}
          />
        </p>
      </div>

      <div className="flex flex-col md:flex-row md:items-center">
        <a
          href={submission.repo_url}
          target="_blank"
          rel="noreferrer"
          className={`${submissionButtonClassnames} md:mr-4`}
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
            className={`${submissionButtonClassnames} mt-5 md:mt-0 md:mr-4`}
            data-test-id="live-preview-btn"
          >
            Live Preview
          </a>
          )}

        {isCurrentUsersSubmission
          ? (
            <div
              className="submissions-flag text-gray-500 hover:text-black"
              onMouseDown={toggleShowEditModal}
              role="button"
              tabIndex={0}
              aria-label="edit-button"
              data-test-id="edit-submission-btn"
            >
              <i className="fas fa-edit" />
            </div>
          )
          : (
            <button
              className="submissions-flag text-gray-300 hint--top"
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
