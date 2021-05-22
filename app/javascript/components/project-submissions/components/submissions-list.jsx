import React, { useContext } from 'react';
import {
  object, func, arrayOf, bool,
} from 'prop-types';
import FlipMove from 'react-flip-move';

import Submission from './submission';
import ProjectSubmissionContext from '../ProjectSubmissionContext';

const noop = () => { };

const SubmissionsList = ({
  submissions,
  handleDelete,
  onFlag,
  handleUpdate,
  isDashboardView,
  handleLikeToggle,
  userSubmission,
}) => {
  const { allSubmissionsPath } = useContext(ProjectSubmissionContext);
  const hasSubmissions = submissions.length > 0;

  return (
    <div data-test-id="submissions-list">
      { userSubmission
        ? (
          <Submission
            key={userSubmission.id}
            submission={userSubmission}
            handleUpdate={handleUpdate}
            onFlag={onFlag}
            handleDelete={handleDelete}
            isDashboardView={isDashboardView}
            handleLikeToggle={handleLikeToggle}
          />
        )
        : ''}
      { hasSubmissions
        ? (
          <FlipMove>
            {submissions.sort((a, b) => b.likes - a.likes).map((submission) => (
              <Submission
                key={submission.id}
                submission={submission}
                handleUpdate={handleUpdate}
                onFlag={onFlag}
                handleDelete={handleDelete}
                isDashboardView={isDashboardView}
                handleLikeToggle={handleLikeToggle}
              />
            ))}
          </FlipMove>
        )
        : <h2 className="submissions__blank-slate">No Submissions yet, be the first!</h2>}

      { allSubmissionsPath
        && (
          <p className="submissions__view-more">
            <span>
              Showing
              {' '}
              {submissions.length}
              {' '}
              most liked submissions -
              {' '}
            </span>
            <a data-test-id="view-all-projects-link" href={allSubmissionsPath}> View full list of solutions</a>
          </p>
        )}
    </div>
  );
};

SubmissionsList.defaultProps = {
  userSubmission: null,
  onFlag: noop,
  isDashboardView: false,
};

SubmissionsList.propTypes = {
  submissions: arrayOf(object).isRequired,
  userSubmission: object,
  handleDelete: func.isRequired,
  onFlag: func,
  handleUpdate: func.isRequired,
  handleLikeToggle: func.isRequired,
  isDashboardView: bool,
};

export default SubmissionsList;
