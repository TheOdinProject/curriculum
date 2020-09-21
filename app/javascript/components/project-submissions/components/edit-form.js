import React from 'react';
import { useForm } from 'react-hook-form';
import { func, object } from 'prop-types';
import { yupResolver } from '@hookform/resolvers';

import schema from '../schemas/project-submission-schema'

const EditForm = ({ submission, onSubmit, onClose, onDelete }) => {
  const { register, errors, handleSubmit, formState } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {
      repo_url: submission.repo_url,
      live_preview_url: submission.live_preview_url,
      is_public: submission.is_public,
    }
  });

  const handleDelete = () => {
    onDelete(submission.id);
    onClose();
  };

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center">
        <h1 className="accent">Thanks for Updating Your Solution!</h1>
        <button className="button button--primary" onClick={onClose}>Close</button>
      </div>
    );
  }

  return (
    <div>
      <h1 className="text-center accent">Edit Your Project</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <input type="hidden" name="project_submission_id" value={submission.id} ref={register()} />
        <input type="hidden" name="lesson_id" value={submission.lesson_id} ref={register()} />
        <div className="form__section">
          <span className="form__icon fab fa-github"></span>
          <input
            autoFocus
            className="form__element form__element--with-icon"
            type="text"
            name="repo_url"
            placeholder="Repository URL"
            ref={register()}
          />
        </div>
        {errors.repo_url && <div className="form__error-message push-down"> {errors.repo_url.message}</div>}

        <div className="form__section">
          <span className="form__icon fas fa-link"></span>
          <input
            className="form__element form__element--with-icon"
            type="text"
            placeholder="Live Preview URL"
            name="live_preview_url"
            ref={register()}
          />
        </div>
        {errors.live_preview_url && <div className="form__error-message push-down"> {errors.live_preview_url.message}</div> }

        <div className="form__section form__section--right-aligned form__section--bottom">

          <div className="form__toggle-checkbox">
            <p className="bold">MAKE SOLUTION PUBLIC</p>
            <label className="toggle form__public-checkbox">
              <input className="toggle__input" type="checkbox" name="is_public" ref={register()}  />
              <div className="toggle__fill round"></div>
            </label>
          </div>

          <button className="button button--danger" onClick={handleDelete}>Delete</button>
          &nbsp;
          &nbsp;
          <button disabled={formState.isSubmitting} type="submit" className="button button--primary">Update</button>
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
}

export default EditForm;
