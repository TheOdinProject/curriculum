import React from 'react';
import { useForm } from "react-hook-form";

const CreateSubmissionForm = (props) => {
  const { register, errors, handleSubmit, formState, reset } = useForm();

  const handleClose = () => {
    reset({
      isSubmitted: false,
    })

    props.onClose()
  }

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

      <form className="form" onSubmit={handleSubmit(props.onSubmit)}>
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

        <div className="form__section">
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

        <div className="form__section form__section--right-aligned">
          <span className="bold">MAKE SOLUTION PUBLIC</span>
          <label className="toggle-switch toggle-switch--space-around">
            <input type="checkbox" name="is_public" ref={register}  />
            <span className="toggle-switch__slider round"></span>
          </label>
          <button type="submit" className="button button--primary">Submit</button>
        </div>

      </form>
    </div>
  )
}


export default CreateSubmissionForm
