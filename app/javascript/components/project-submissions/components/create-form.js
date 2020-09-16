import React from 'react';
import { useForm } from 'react-hook-form';
import { func } from 'prop-types';
import { yupResolver } from '@hookform/resolvers';

import schema from '../schemas/project-submission-schema'

const CreateForm = ({ onClose, onSubmit }) => {
  const { register, handleSubmit, formState, errors, reset } = useForm({
    resolver: yupResolver(schema),
    mode: 'onTouched',
    defaultValues: {
      is_public: true,
    }
  });

  const handleClose = () => {
    reset({ isSubmitted: false });
    onClose();
  };

  if (formState.isSubmitted) {
    return (
      <div className="text-center">
        <h1 className="accent">Thanks for Submitting Your Solution!</h1>
        <button className="button button--primary" onClick={handleClose}>Close</button>
      </div>
    )
  }

  return (
    <div>
      <h1 className="text-center accent">Upload Your Project</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <div className="form__section">
          <span className="form__icon fab fa-github"></span>
          <input
            className="form__element form__element--with-icon"
            type="url"
            name="repo_url"
            placeholder="Repository URL"
            ref={register}
          />
        </div>
        {errors.repo_url && <div className="form__error-message push-down"> {errors.repo_url.message}</div>}

        <div className="form__section">
          <span className="form__icon fas fa-link"></span>
          <input
            className="form__element form__element--with-icon"
            type="url"
            placeholder="Live Preview URL"
            name="live_preview_url"
            ref={register}
          />
        </div>
        {errors.live_preview_url && <div className="form__error-message push-down"> {errors.live_preview_url.message}</div>}

        <div className="form__section form__section--right-aligned form__section--bottom">
          <div className="form__toggle-checkbox">
            <p className="bold">MAKE SOLUTION PUBLIC</p>
            <label className="toggle form__public-checkbox">
              <input className="toggle__input" type="checkbox" name="is_public" ref={register} />
              <div className="toggle__fill"></div>
            </label>
          </div>

          <button disabled={!formState.isValid} type="submit" className="button button--primary">Submit</button>
        </div>
      </form>
    </div>
  );
};

CreateForm.propTypes = {
  onClose: func.isRequired,
  onSubmit: func.isRequired,
};

export default CreateForm;
