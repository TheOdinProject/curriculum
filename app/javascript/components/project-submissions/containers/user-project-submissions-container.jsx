/* eslint camelcase: ["error", {ignoreDestructuring: true, properties: "never"}] */
import React, { useState } from 'react';
import PropTypes from 'prop-types';

import { SubmissionsList } from '../components';
import axios from '../../../src/js/axiosWithCsrf';

const UserProjectSubmissions = ({ submissions }) => {
  const [userSubmissions, setUserSubmissions] = useState(submissions);

  const handleUpdate = async (data) => {
    const {
      repo_url,
      live_preview_url,
      is_public,
      lesson_id,
    } = data;

    const response = await axios.put(
      `/project_submissions/${data.id}`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id,
        },
      },
    );
    if (response.status === 200) {
      const updatedSubmission = response.data;

      setUserSubmissions((prevSubmissions) => prevSubmissions.map((previousSubmission) => {
        if (previousSubmission.id === updatedSubmission.id) {
          return updatedSubmission;
        }

        return previousSubmission;
      }));
    }
  };

  const handleDelete = async (id) => {
    const response = await axios.delete(`/project_submissions/${id}`, {});

    if (response.status === 200) {
      setUserSubmissions((prevSubmissions) => (
        prevSubmissions.filter((submission) => submission.id !== id)
      ));
    }
  };

  const toggleLikeSubmission = async ({ id, is_liked_by_current_user }) => {
    const response = await axios.post(
      `/project_submissions/${id}/likes`,
      {
        submission_id: id,
        is_liked_by_current_user,
      },
    );

    if (response.status === 200) {
      const updatedSubmission = response.data;

      setUserSubmissions((prevSubmissions) => {
        const newSubmissions = prevSubmissions.map((submission) => {
          if (updatedSubmission.id === submission.id) {
            return updatedSubmission;
          }

          return submission;
        });

        return newSubmissions;
      });
    }
  };

  return (
    <div className="submissions">
      <SubmissionsList
        submissions={userSubmissions}
        handleUpdate={handleUpdate}
        handleDelete={handleDelete}
        handleLikeToggle={toggleLikeSubmission}
        isDashboardView
      />
    </div>
  );
};

UserProjectSubmissions.propTypes = {
  submissions: PropTypes.array.isRequired,
};

export default UserProjectSubmissions;
