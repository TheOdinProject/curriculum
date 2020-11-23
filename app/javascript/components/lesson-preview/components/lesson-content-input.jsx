import React from 'react';

const LessonContentInput = ({onChange, content}) => {
  const handleOnChange = (event) => {
    onChange(event.target.value)
  }

  return (
    <textarea
      className="lesson-preview__input form__element"
      placeholder="Lesson content..."
      onChange={handleOnChange}
      value={content}
    >

    </textarea>
  )

};

export default LessonContentInput;
