import React, { Fragment } from 'react';
import { useForm } from 'react-hook-form';
import { func, object } from 'prop-types';
import { yupResolver } from '@hookform/resolvers';

import schema from '../schemas/project-submission-schema';

const EditForm = ({
  submission, onSubmit, onClose, onDelete,
}) => {
  const {
    register, errors, handleSubmit, formState,
  } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {
      repo_url: submission.repo_url,
      live_preview_url: submission.live_preview_url,
      is_public: submission.is_public,
    },
  });

  const handleDelete = () => {
    onDelete(submission.id);
    onClose();
  };

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center">
        <h1 className="accent">Thanks for Updating Your Solution!</h1>
        <button type="button" className="button button--primary" onClick={onClose} data-test-id="close-btn">Close</button>
      </div>
    );
  }

  return (
    <div>
      <h1 className="text-center accent">Edit Your Project</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <input type="hidden" name="id" value={submission.id} ref={register()} />
        <input type="hidden" name="lesson_id" value={submission.lesson_id} ref={register()} />
        <div className="form__section">
          <span className="form__icon fab fa-github" />
          <input
            autoFocus
            className="form__element form__element--with-icon"
            type="text"
            name="repo_url"
            placeholder="Repository URL"
            data-test-id="repo-url-field"
            ref={register()}
          />
        </div>
        {errors.repo_url && (
        <div className="form__error-message push-down">
          {' '}
          {errors.repo_url.message}
        </div>
        )}
        { submission.lesson_has_live_preview
          && (
          <>
            <div className="form__section">
              <span className="form__icon fas fa-link" />
              <input
                className="form__element form__element--with-icon"
                type="text"
                placeholder="Live Preview URL"
                name="live_preview_url"
                data-test-id="live-preview-url-field"
                ref={register()}
              />
            </div>
            {errors.live_preview_url && (
            <div className="form__error-message push-down">
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
              <input id="is_public" className="toggle__input" type="checkbox" name="is_public" ref={register()} />
              <div className="toggle__fill round" />
            </label>
          </div>

          <div className="form__button-group">
            <button type="submit" className="button button--danger" onClick={handleDelete} data-test-id="delete-btn">Delete</button>
            &nbsp;
            &nbsp;
            <button disabled={formState.isSubmitting} type="submit" className="button button--primary" data-test-id="submit-btn">Update</button>
          </div>
        </div>
      </form>
    </div>
  );
};

EditForm.propTypes = {
  submission: object.isRequired,
  onSubmit: func.isRequired,
  onClose: func.isRequired,
  onDelete: func.isRequired,
};

export default EditForm;
