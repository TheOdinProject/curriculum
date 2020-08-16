import React from 'react';

import SubmissionsList from '../components/submissions-list'
import Modal from '../components/modal'
import CreateForm from '../components/create-form'
import axios from '../../../src/js/axiosWithCsrf';

class ProjectSubmissions extends React.Component {

  state = {
    showCreateModal: false,
    submissions: this.props.submissions
  }

  setShowCreateModal = (value) => {
    this.setState({ showCreateModal: value })
  }

  handleCreate = (data) => {
    const { lesson } = this.props;
    const { repo_url, live_preview_url, is_public } = data

    event.preventDefault()

    axios.post(
      `/lessons/${lesson.id}/project_submissions`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        }
      }
    ).then(response => {
      this.setState({
        submissions: [response.data.project_submission, ...this.state.submissions],
      })
    })
  }

  handleUpdate = (data) => {
    const { lesson } = this.props;
    const { repo_url, live_preview_url, is_public, project_submission_id } = data

    event.preventDefault()

    axios.put(
      `/lessons/${lesson.id}/project_submissions/${project_submission_id}`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        }
      }
    ).then(response => {
      this.setState({
        submissions: Object.assign([], this.state.submissions, {[0]: response.data.project_submission})
      })
    })
  }

  handleDelete = (id) => {
    const { lesson } = this.props;

    event.preventDefault()

    axios.delete(`/lessons/${lesson.id}/project_submissions/${id}`, {}).then(() => {
      this.setState({
        submissions: this.state.submissions.filter((submission) => submission.id !== id)
      })
    })
  }

  handleReport = (data) => {
    const { project_submission_id, reasons } = data

    axios.post(
      `/project_submissions/${project_submission_id}/reports`,
      { reason: reasons.join(', ') }
    ).then( () => {
      this.setState({
        submissions: this.state.submissions.filter((submission) => (
          submission.id !== parseInt(project_submission_id)
        ))
      })
    })
  }

  userSubmission = () => {
    const { submissions } = this.state;
    const { userId } = this.props;

    return submissions.find(submission => submission.user_id === userId);
  }

  render() {
    const { course, lesson, userId } = this.props;
    const { submissions, showCreateModal } = this.state;

    return (
      <div className="submissions">
        <div className="submissions__header">

          <div className="submissions__course">
            <h3 className="submissions__title">Solutions:</h3>
            <h4 className="submissions__project-title">{course.title}: ({lesson.title})</h4>
          </div>

          <Modal show={showCreateModal} handleClose={() => this.setShowCreateModal(false)}>
            <CreateForm
              lessonId={lesson.id}
              onSubmit={this.handleCreate}
              onClose={() => this.setShowCreateModal(false)}
            />
          </Modal>

          <div>
            { !this.userSubmission() &&
              <button className="submissions__add button button--primary" onClick={() => this.setShowCreateModal(true)}>
                Add Solution
              </button>
            }
          </div>
        </div>

        <SubmissionsList
          submissions={submissions}
          userId={userId}
          handleUpdate={this.handleUpdate}
          handleReport={this.handleReport}
          handleDelete={this.handleDelete}
        />
      </div>
    )
  }
}

export default ProjectSubmissions
