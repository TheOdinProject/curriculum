import React, { useState } from 'react';

import { SubmissionsList } from '../components';
import axios from '../../../src/js/axiosWithCsrf';

const ProjectSubmissions = (props) => {
  const [submissions, setSubmissions] = useState(props.submissions);

  const handleUpdate = async (data) => {
    const { repo_url, live_preview_url, is_public, project_submission_id, lesson_id } = data;

    event.preventDefault();

    const response = await axios.put(
      `/project_submissions/${project_submission_id}`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson_id,
        }
      }
    );
    if (response.status === 200) {
      const updatedSubmission = response.data;

      setSubmissions(prevSubmissions => {
        return prevSubmissions.map(previousSubmission => {
          if (previousSubmission.id === updatedSubmission.id) return updatedSubmission;          

          return previousSubmission;
        });
      });
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
  };

  return (
    <div className="submissions">
      <SubmissionsList
        submissions={submissions}
        handleUpdate={handleUpdate}
        handleDelete={handleDelete}
        handleLikeToggle={toggleLikeSubmission}
        isDashboardView
      />
    </div>
  )
}

export default ProjectSubmissions;
