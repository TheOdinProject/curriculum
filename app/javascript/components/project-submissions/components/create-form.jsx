import React, { useContext, useState } from 'react';
import { useForm } from 'react-hook-form';
import PropTypes from 'prop-types';
import { yupResolver } from '@hookform/resolvers/yup';

import schema from '../schemas/project-submission-schema';
import ProjectSubmissionContext from '../ProjectSubmissionContext';
import Toggle from './toggle';

const CreateForm = ({ onClose, onSubmit }) => {
  const [isToggled, setIsToggled] = useState(true);
  const { lesson } = useContext(ProjectSubmissionContext);
  const {
    register,
    handleSubmit,
    formState,
  } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {
      is_public: isToggled,
    },
  });

  const handleOnClickToggle = () => {
    setIsToggled(!isToggled);
  };

  const handleSubmitCallback = async (data) => (
    onSubmit({ ...data, is_public: isToggled })
  );

  const {
    errors,
  } = formState;

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center">
        <h1 className="page-heading-title" data-test-id="success-message">Thanks for Submitting Your Solution!</h1>
        <button
          type="button"
          className="button button--primary"
          onClick={onClose}
          data-test-id="close-btn"
        >
          Close
        </button>
      </div>
    );
  }

  /* eslint-disable react/jsx-props-no-spreading */
  return (
    <div>
      <h1 className="text-center page-heading-title">Upload Your Project</h1>

      <form className="form" onSubmit={handleSubmit(handleSubmitCallback)}>
        <div className="form-section">
          <span className="form-icon fab fa-github" />
          <input
            autoFocus
            className="form-element-with-icon"
            type="url"
            {...register('repo_url')}
            placeholder="Repository URL"
            data-test-id="repo-url-field"
          />
        </div>
        {errors.repo_url && (
        <div className="form-error" data-test-id="error-message">
          {' '}
          {errors.repo_url.message}
        </div>
        )}

        { lesson.has_live_preview
          && (
          <>
            <div className="form-section">
              <span className="form-icon fas fa-link" />
              <input
                className="form-element-with-icon"
                type="url"
                placeholder="Live Preview URL"
                {...register('live_preview_url')}
                data-test-id="live-preview-url-field"
              />
            </div>
            { errors.live_preview_url && (
            <div className="form-error" data-test-id="error-message">
              {' '}
              {errors.live_preview_url.message}
            </div>
            ) }
          </>
          )}

        <div className="form-section form-section-center lg:flex-row lg:justify-center mb-0">
          <Toggle
            label="MAKE SOLUTION PUBLIC"
            onClick={handleOnClickToggle}
            isToggled={isToggled}
          />

          <button
            disabled={formState.isSubmitting}
            type="submit"
            className="button button--primary"
            data-test-id="submit-btn"
          >
            Submit
          </button>
        </div>
      </form>
    </div>
  );
  /* eslint-enable react/jsx-props-no-spreading */
};

CreateForm.defaultProps = {
  userId: null,
};

CreateForm.propTypes = {
  onClose: PropTypes.func.isRequired,
  onSubmit: PropTypes.func.isRequired,
  userId: PropTypes.number,
};

export default CreateForm;
