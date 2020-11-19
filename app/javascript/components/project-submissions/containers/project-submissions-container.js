import React, { useState, useContext } from 'react';

import { SubmissionsList, Modal, CreateForm, FlagForm } from '../components';
import axios from '../../../src/js/axiosWithCsrf';
import ProjectSubmissionContext from "../ProjectSubmissionContext";

const ProjectSubmissions = (props) => {
  const { userId, lesson, course } = useContext(ProjectSubmissionContext);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showFlagModal, setShowFlagModal] = useState(false);
  const [submissions, setSubmissions] = useState(props.submissions);
  const [flaggedSubmission, setFlaggedSubmission] = useState({});
  const [userSubmission, setUserSubmission] = useState(props.userSubmission);

  const toggleShowFlagModal = () => setShowFlagModal(prevShowFlagModal => !prevShowFlagModal);

  const toggleShowCreateModal = () => {
    setShowCreateModal(prevShowCreateModal => !prevShowCreateModal);
  };

  const handleCreate = async (data) => {
    const { repo_url, live_preview_url, is_public } = data;

    event.preventDefault();

    const response = await axios.post(
      `/project_submissions`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        }
      }
    );
    if (response.status === 200) {
      setUserSubmission(prevSubmission => response.data);
    }
  };

  const handleUpdate = async (data) => {
    const { repo_url, live_preview_url, is_public, project_submission_id } = data;

    event.preventDefault();

    const response = await axios.put(
      `/project_submissions/${project_submission_id}`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        }
      }
    );
    if (response.status === 200) {
      setUserSubmission(prevSubmission => response.data);
    }
  };

  const handleDelete = async (id) => {
    event.preventDefault();

    const response = await axios.delete(`/project_submissions/${id}`, {});
    if (response.status === 200) {
      setUserSubmission(prevSubmissions => null);
    }
  };

  const handleFlag = async (data) => {
    const { project_submission_id, reason } = data;

    const response = await axios.post(
      `/project_submissions/${project_submission_id}/flags`,
      { reason: reason }
    );
    if (response.status === 200) {
      setFlaggedSubmission({});
    }
  };

  const toggleLikeSubmission = async (submission, isUserSubmission = false) => {
    const response = await axios.post(
      `/project_submissions/${submission.id}/likes`,
      {
        submission_id: submission.id,
        is_liked_by_current_user: submission.is_liked_by_current_user
      }
    );

    if (response.status === 200) {
      const updatedSubmission = response.data;

      if (isUserSubmission) {
        setUserSubmission(prevSubmission => updatedSubmission);
      } else {
        setSubmissions(prevSubmissions => {
          const newSubmissions = prevSubmissions.map((submission) => {
            if (updatedSubmission.id === submission.id) {
              return updatedSubmission;
            }

            return submission;
          })

          return newSubmissions;
        });
      }
    }
  };

  const showAddSubmissionButton = () => !userSubmission

  return (
    <div className="submissions">
      <div className="submissions__header">
        <div className="submissions__course">
          <h3 className="submissions__title">Solutions:</h3>
          <h4 className="submissions__project-title">{course.title}: ({lesson.title})</h4>
        </div>

        <Modal show={showCreateModal} handleClose={toggleShowCreateModal}>
          <CreateForm
            lessonId={lesson.id}
            onSubmit={handleCreate}
            onClose={toggleShowCreateModal}
            userId={userId}
          />
        </Modal>

        <Modal show={showFlagModal} handleClose={toggleShowFlagModal}>
          <FlagForm
            submission={flaggedSubmission}
            onSubmit={handleFlag}
            onClose={toggleShowFlagModal}
            userId={userId}
          />
        </Modal>

        <div>
          {showAddSubmissionButton() && (
            <button className="submissions__add button button--primary" onClick={toggleShowCreateModal}>
              Add Solution
            </button>
          )}
        </div>
      </div>
      <p className="text-center">
        <span>This is a beta feature. If you have any feedback </span>
        <a href="https://discord.com/channels/505093832157691914/540903304046182425">please let us know</a>.
      </p>
      <SubmissionsList
        submissions={submissions}
        userSubmission={userSubmission}
        handleUpdate={handleUpdate}
        onFlag={(submission) => { setFlaggedSubmission(submission); toggleShowFlagModal() }}
        handleDelete={handleDelete}
        handleLikeToggle={toggleLikeSubmission}
      />
    </div>
  )
}

export default ProjectSubmissions;
