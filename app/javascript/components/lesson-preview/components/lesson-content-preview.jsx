import React from 'react';

const LessonContentInput = ({content}) => (
  <div className="lesson-content"><div dangerouslySetInnerHTML={{ __html: content }} /></div>
);

export default LessonContentInput;
