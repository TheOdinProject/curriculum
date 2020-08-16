import React from 'react';
import { useForm } from "react-hook-form";

const EditForm = (props) => {
  const { register, errors, handleSubmit, formState, reset } = useForm({
    defaultValues: {
      repo_url: props.submission.repo_url,
      live_preview_url: props.submission.live_preview_url,
      is_public: props.submission.is_public,
    }
  });

  const handleClose = () => {
    reset({
      repo_url: props.submission.repo_url,
      live_preview_url: props.submission.live_preview_url,
      is_public: props.submission.is_public,
    },
    {
      isSubmitted: false,
    });

    props.onClose();
  }

  const handleDelete = () => {
    props.onDelete(props.submission.id);
    props.onClose();
  }

  if (formState.isSubmitted) {
    return (
      <div className="text-center">
        <h1 className="accent">Thanks for Updating Your Solution!</h1>
        <button className="button button--primary" onClick={handleClose}>Close</button>
      </div>
    )
  }

  return (
    <div>
      <h1 className="text-center accent">Edit Your Project</h1>

      <form className="form" onSubmit={handleSubmit(props.onSubmit)}>
        <input type="hidden" name="project_id" value={props.submission.id}  ref={register()} />
        <div className="form__section">
          <span className="form__icon fab fa-github"></span>
          <input
            className="form__element form__element--with-icon"
            type="text"
            name="repo_url"
            placeholder="Repository URL"
            ref={register({
              required: 'Required',
              pattern: {
                value: /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/,
                message: "Must be a URL"
              }

            })}
          />
        </div>
        {errors.repo_url && <div className="form__error-message push-down"> {errors.repo_url.message}</div> }

        <div className="form__section push-down-3x">
          <span className="form__icon fas fa-link"></span>
          <input
            className="form__element form__element--with-icon"
            type="text"
            placeholder="Live Preview URL"
            name="live_preview_url"
            ref={register({
              required: "Required",
              pattern: {
                value: /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/,
                message: "Must be a URL"
              }
            })}
          />
        </div>
        {errors.live_preview_url && <div className="form__error-message push-down"> {errors.live_preview_url.message}</div> }

        <div className="form__section form__section--right-aligned form__section--bottom">
          <p className="bold">MAKE SOLUTION PUBLIC</p>
          <label className="toggle form__public-checkbox">
            <input className="toggle__input" type="checkbox" name="is_public" ref={register}  />
            <div className="toggle__fill round"></div>
          </label>

          <button className="button button--danger" onClick={handleDelete}>Delete</button>
          &nbsp;
          &nbsp;
          <button type="submit" className="button button--primary">Update</button>
        </div>

      </form>
    </div>
  )
}

export default EditForm
