import React, { useState, useMemo, useContext } from 'react';

import { SubmissionsList, Modal, CreateForm, FlagForm } from '../components';
import axios from '../../../src/js/axiosWithCsrf';
import ProjectSubmissionContext from "../ProjectSubmissionContext";

const ProjectSubmissions = (props) => {
  const { userId, lesson, course, allSubmissionsPath } = useContext(ProjectSubmissionContext);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showFlagModal, setShowFlagModal] = useState(false);
  const [submissions, setSubmissions] = useState(props.submissions);
  const [flaggedSubmission, setFlaggedSubmission] = useState({});


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
      setSubmissions(prevSubmissions => [response.data, ...prevSubmissions]);
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
      setSubmissions(prevSubmissions =>
        Object.assign([], prevSubmissions, {[0]: response.data})
      );
    }
  };

  const handleDelete = async (id) => {
    event.preventDefault();

    const response = await axios.delete(`/project_submissions/${id}`, {});
    if (response.status === 200) {
      setSubmissions(prevSubmissions =>
        prevSubmissions.filter((submission) => submission.id !== id)
      );
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

  const userSubmission = useMemo(() => {
    return submissions.find(submission => submission.user_id === userId);
  }, [userId, submissions.length]);

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
          />
        </Modal>

        <Modal show={showFlagModal} handleClose={toggleShowFlagModal}>
          <FlagForm
            submission={flaggedSubmission}
            onSubmit={handleFlag}
            onClose={toggleShowFlagModal}
          />
        </Modal>

        <div>
          {!userSubmission && (
            <button className="submissions__add button button--primary" onClick={toggleShowCreateModal}>
              Add Solution
            </button>
          )}
        </div>
      </div>

      <SubmissionsList
        submissions={submissions}
        handleUpdate={handleUpdate}
        onFlag={(submission) => { setFlaggedSubmission(submission); toggleShowFlagModal() }}
        handleDelete={handleDelete}
        allSubmissionsPath={allSubmissionsPath}
      />
    </div>
  )
}

export default ProjectSubmissions;
