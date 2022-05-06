import React, { useContext, useMemo } from 'react';
import { object, func } from 'prop-types';
import ProjectSubmissionContext from '../ProjectSubmissionContext';

const Like = ({ submission, handleLikeToggle }) => {
  const { userId } = useContext(ProjectSubmissionContext);

  const spanClassnames = submission.is_liked_by_current_user ? 'fa fa-heart text-odin-green' : 'fa fa-heart';

  const toolTipLabel = () => {
    if (!userId) { return 'Log in to like!'; }

    return submission.is_liked_by_current_user ? 'Unlike submission' : 'Like submission';
  };

  const isCurrentUsersSubmission = useMemo(() => (
    userId === submission.user_id
  ), [userId, submission.user_id]);

  return (
    <button
      className="text-gray-300 mr-4 hint--top"
      type="button"
      aria-label={toolTipLabel()}
      data-test-id="like-btn"
      onClick={(event) => {
        event.preventDefault();
        handleLikeToggle(submission, isCurrentUsersSubmission);
      }}
    >
      <span
        data-test-id="number-of-likes"
        className="mr-0.5"
      >
        {submission.likes}
      </span>
      {' '}
      <i className={spanClassnames} aria-label="Like icon" />
    </button>
  );
};

Like.propTypes = {
  submission: object.isRequired,
  handleLikeToggle: func.isRequired,
};

export default Like;
