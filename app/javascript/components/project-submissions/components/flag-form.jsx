import React from 'react';
import { useForm } from 'react-hook-form';
import { func, object, number } from 'prop-types';

const FlagForm = ({ onSubmit, submission, userId }) => {
  const {
    register, handleSubmit, formState,
  } = useForm();

  const { errors } = formState;

  if (formState.isSubmitSuccessful) {
    return (
      <div className="text-center text-3xl">
        <h2 className="bold">Thanks for helping us keep our community safe!</h2>
        <p>Our Moderators will review this issue shortly.</p>
      </div>
    );
  }

  /* eslint-disable react/jsx-props-no-spreading */
  return (
    <div>
      <h1 className="text-center page-heading-title">Flag Submission</h1>

      <form className="form" onSubmit={handleSubmit(onSubmit)}>
        <input
          type="hidden"
          {...register('project_submission_id')}
          value={submission.id}
        />
        <div className="form__section">
          <textarea
            autoFocus
            placeholder="Please be as detailed as possible"
            className="form__element dark-form-input"
            rows="5"
            {...register('reason', {
              minLength: { value: 4, message: 'Must be at least 4 characters' },
              required: 'Required',
            })}
            data-test-id="flag-description-field"
          />
        </div>
        {errors.reason && (
        <div className="form__error-message push-down">
          {' '}
          {errors.reason.message}
        </div>
        )}

        <div className="form__section form__section--center-aligned">
          <button disabled={formState.isSubmitting} className="button button--primary" type="submit" data-test-id="submit-flag-btn">Flag</button>
        </div>
      </form>
    </div>
  );
  /* eslint-enable react/jsx-props-no-spreading */
};

FlagForm.defaultProps = {
  userId: null,
};

FlagForm.propTypes = {
  onSubmit: func.isRequired,
  submission: object.isRequired,
  userId: number,
};

export default FlagForm;
