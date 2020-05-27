import React from 'react';

import SubmissionsList from '../components/submissions-list'
import Modal from '../components/modal'
import CreateSubmissionForm from '../components/create-submission-form'
import axios from '../../../src/js/axiosWithCsrf';

class ProjectSubmissions extends React.Component {

    state = {
      showCreateModal: false,
      submissions: this.props.submissions
    }

  hideModal = () => {
    this.setState({ showCreateModal: false })
  }

  openModal = () => {
    this.setState({ showCreateModal: true, submitted: false })
  }

  handleCreateSubmission = (data) => {
    const { lesson } = this.props;
    const { repo_url, live_preview_url, is_public } = data

    event.preventDefault()

    axios.post(
      `/lessons/${lesson.id}/projects`,
      {
        project: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        }
      }
    ).then(response => {
      this.setState({
        submissions: [response.data.project, ...this.state.submissions],
      })
    })
  }

  render() {
    const { course, lesson } = this.props;
    const { submissions } = this.state;

    return (
      <div className="submissions">
        <div className="submissions__header">

          <div className="submissions__course">
            <h3 className="submissions__title">Solutions:</h3>
            <h4 className="submissions__project-title">{course.title}: ({lesson.title})</h4>
          </div>
          <Modal show={this.state.showCreateModal} handleClose={this.hideModal}>
            <CreateSubmissionForm lessonId={lesson.id} onSubmit={this.handleCreateSubmission} onClose={this.hideModal}/>
          </Modal>

          <div>
            <button
              className="submissions__add button button--primary"
              onClick={this.openModal}
            >
              Add Solution
            </button>
          </div>
        </div>

        <SubmissionsList submissions={submissions} />
      </div>
    )
  }
}

export default ProjectSubmissions
