import React from 'react';
import { useForm } from "react-hook-form";

const ReportForm = (props) => {
  const { register, handleSubmit, formState } = useForm();


  if (formState.isSubmitted) {
    return (
      <div className="text-center" style={ { width: '80%', margin: '0 auto' } }>
        <h1 className="bold">Thanks for helping us keep our community safe!</h1>
        <p>We will temporarily hide this solution and our moderators will review this issue.</p>
      </div>
    )
  }

  return (

    <div>
      <h1 className="text-center accent">What's the reason for flagging?</h1>

      <form className="form report-form__container" onSubmit={handleSubmit(props.onSubmit)}>
        <input type="hidden" name="project_id" value={props.submission.id}  ref={register()} />

        <div className="report-form__icon-container">
          <i className="fas fa-exclamation-triangle" style={ { color: '#bd4147'} }></i>
        </div>

        <div className="report-form__options">

          <div className="report-form__option">
            <p>It's sexually inappropriate</p>
            <label className="toggle">
              <input
                className="toggle__input"
                type="checkbox"
                name="reasons"
                value="It's sexually inappropriate"
                ref={register}
              />
              <div className="toggle__fill"></div>
            </label>
          </div>

          <div className="report-form__option">
            <p>It's spam</p>
            <label className="toggle">
              <input
                className="toggle__input"
                type="checkbox"
                name="reasons"
                value="It's spam"
                ref={register}
              />
              <div className="toggle__fill"></div>
            </label>
          </div>

          <div className="report-form__option">
            <p>I find it offensive</p>
            <label className="toggle">
              <input
                className="toggle__input"
                type="checkbox"
                name="reasons"
                value="I find it offensive"
                ref={register}
              />
              <div className="toggle__fill"></div>
            </label>
          </div>

          <div className="report-form__option">
            <p>It's violent or prohibited content</p>
            <label className="toggle">
              <input
                className="toggle__input"
                type="checkbox"
                name="reasons"
                value="It's violent or prohibited content"
                ref={register}
              />
              <div className="toggle__fill"></div>
            </label>
          </div>
        </div>

        <div className="report-form__submit-button">
          <button className="button button--primary" type="submit">Flag</button>
        </div>
      </form>
    </div>
  )
}


export default ReportForm
