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

  return (
    <div className="submissions">
      <SubmissionsList
        submissions={submissions}
        handleUpdate={handleUpdate}
        handleDelete={handleDelete}
        isDashboardView
      />
    </div>
  )
}

export default ProjectSubmissions;
