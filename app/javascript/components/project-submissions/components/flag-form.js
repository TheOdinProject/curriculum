import React from 'react';
import { useForm } from "react-hook-form";
import { func, object } from 'prop-types';

const FlagForm = ({ onSubmit, submission }) => {
  const { register, handleSubmit, errors, formState } = useForm();

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center" style={{ width: '80%', margin: '0 auto' }}>
        <h1 className="bold">Thanks for helping us keep our community safe!</h1>
        <p>Our Moderators will review this issue shortly.</p>
      </div>
    )
  }

  return (
    <div>
      <h1 className="text-center accent">What's the reason for flagging?</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <input type="hidden" name="project_submission_id" value={submission.id}  ref={register()} />
        <div className="form__section">
          <textarea
            placeholder="Please be as detailed as possible"
            className="form__element"
            rows="5"
            name="reason"
            ref={
              register({
                minLength: { value: 4, message: "Must be at least 4 characters" },
                required: "Required"
              })
            }
          />
        </div>
        {errors.reason && <div className="form__error-message push-down"> {errors.reason.message}</div>}

        <div className="form__section form__section--right-aligned">
          <button disabled={formState.isSubmitting} className="button button--primary" type="submit">Flag</button>
        </div>
      </form>
    </div>
  );
};

FlagForm.propTypes = {
  onSubmit: func.isRequired,
  submission: object,
}

export default FlagForm
