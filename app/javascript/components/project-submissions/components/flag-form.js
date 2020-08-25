import React from 'react';
import { useForm } from "react-hook-form";
import { func, object } from 'prop-types';

const FLAG_REASONS = [
  "It's sexually inappropriate",
  "It's spam",
  "I find it offensive",
  "It's violent or prohibited content",
];

const FlagForm = ({ onSubmit, submission }) => {
  const { register, handleSubmit, formState } = useForm();

  if (formState.isSubmitted) {
    return (
      <div className="text-center" style={{ width: '80%', margin: '0 auto' }}>
        <h1 className="bold">Thanks for helping us keep our community safe!</h1>
        <p>We will temporarily hide this solution and our moderators will review this issue.</p>
      </div>
    )
  }

  const renderFlaggingReasons = () => {
    return FLAG_REASONS.map((flagReason, index) => {
      return (
        <div key={`flag-reason-${index + 1}`} className="flag-form__option">
          <p>{flagReason}</p>
          <label className="toggle">
            <input
              className="toggle__input"
              type="checkbox"
              name="reasons"
              value={flagReason}
              ref={register}
            />
            <div className="toggle__fill"></div>
          </label>
        </div>
      )
    })
  }

  return (
    <div>
      <h1 className="text-center accent">What's the reason for flagging?</h1>

      <form className="form flag-form__container" onSubmit={handleSubmit(onSubmit)}>
        <input type="hidden" name="project_submission_id" value={submission.id}  ref={register()} />

        <div className="flag-form__icon-container">
          <i className="fas fa-exclamation-triangle" style={{ color: '#bd4147'}}></i>
        </div>

        <div className="flag-form__options">
          {renderFlaggingReasons()}
        </div>

        <div className="flag-form__submit-button">
          <button className="button button--primary" type="submit">Flag</button>
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
