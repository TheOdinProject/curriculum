import React, { useContext } from 'react';
import { useForm } from 'react-hook-form';
import PropTypes from 'prop-types';
import { yupResolver } from '@hookform/resolvers/yup';

import schema from '../schemas/project-submission-schema';
import ProjectSubmissionContext from '../ProjectSubmissionContext';

const CreateForm = ({ onClose, onSubmit, userId }) => {
  const { lesson } = useContext(ProjectSubmissionContext);
  const {
    register,
    handleSubmit,
    formState,
  } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {
      is_public: true,
    },
  });

  const {
    errors,
  } = formState;

  if (userId === null) {
    return (
      <div className="text-center">
        <h1 className="bold">Please Sign in</h1>
        <p data-test-id="sign-in-instructions">
          Please
          {' '}
          <a href="/login">sign in</a>
          {' '}
          to add a project submission.
        </p>
      </div>
    );
  }

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center">
        <h1 className="accent" data-test-id="success-message">Thanks for Submitting Your Solution!</h1>
        <button type="button" className="button button--primary" onClick={onClose} data-test-id="close-btn">Close</button>
      </div>
    );
  }

  /* eslint-disable react/jsx-props-no-spreading */
  return (
    <div>
      <h1 className="text-center accent">Upload Your Project</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <div className="form__section">
          <span className="form__icon fab fa-github" />
          <input
            autoFocus
            className="form__element form__element--with-icon"
            type="url"
            {...register('repo_url')}
            placeholder="Repository URL"
            data-test-id="repo-url-field"
          />
        </div>
        {errors.repo_url && (
        <div className="form__error-message push-down" data-test-id="error-message">
          {' '}
          {errors.repo_url.message}
        </div>
        )}

        { lesson.has_live_preview
          && (
          <>
            <div className="form__section">
              <span className="form__icon fas fa-link" />
              <input
                className="form__element form__element--with-icon"
                type="url"
                placeholder="Live Preview URL"
                {...register('live_preview_url')}
                data-test-id="live-preview-url-field"
              />
            </div>
            { errors.live_preview_url && (
            <div className="form__error-message push-down" data-test-id="error-message">
              {' '}
              {errors.live_preview_url.message}
            </div>
            ) }
          </>
          )}

        <div className="form__section form__section--center-aligned form__section--bottom">
          <div className="form__toggle-checkbox">
            <p className="bold">MAKE SOLUTION PUBLIC</p>
            <label htmlFor="is_public" className="toggle form__public-checkbox" data-test-id="is-public-toggle-slider">
              <input
                id="is_public"
                className="toggle__input"
                type="checkbox"
                {...register('is_public')}
              />
              <div className="toggle__fill" />
            </label>
          </div>

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
