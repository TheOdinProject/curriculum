import React from 'react';

const Submission = ({submission, userId, openEditModal}) =>
    <div className="submissions__item">
      <p className="submissions__user">{submission.user_name}</p>

      <div className="submissions__actions">

        { userId === submission.user_id &&
          <button className="submissions__button submissions__button--green" onClick={openEditModal}>Edit Solution</button>

        }
        <a href={submission.repo_url} target="_blank" className="submissions__button">View Code</a>
        <a href={submission.live_preview_url} target="_blank" className="submissions__button">Live Preview</a>
        <a href={""} className="submissions__report"><i className="fas fa-flag"></i></a>
      </div>
    </div>

export default Submission
