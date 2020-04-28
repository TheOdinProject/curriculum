import React from 'react';
import SubmissionsList from '../components/submissions-list'

class ProjectSubmissions extends React.Component {
  render() {
    const { submissions, course, lesson } = this.props;

    return (
      <div className="submissions">
        <div className="submissions__header">

          <div className="submissions__course">
            <h3 className="submissions__title">Solutions:</h3>
            <h4 className="submissions__project-title">{course.title}: ({lesson.title})</h4>
          </div>

          <div>
            <button className="submissions__add button button--primary">Add Solution</button>
          </div>
        </div>

        <SubmissionsList submissions={submissions} />
      </div>
    )
  }
}

export default ProjectSubmissions
