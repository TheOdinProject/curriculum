import React from 'react';

import SubmissionsList from '../components/submissions-list'
import Modal from '../components/modal'
import CreateSubmissionForm from '../components/create-submission-form'
import EditSubmissionForm from '../components/edit-submission-form'
import axios from '../../../src/js/axiosWithCsrf';

class ProjectSubmissions extends React.Component {

    state = {
      showCreateModal: false,
      showEditModal: false,
      submissions: this.props.submissions
    }

  hideModal = (type) => {
    this.setState({ [`show${type}Modal`]: false })
  }

  openModal = (type) => {
    this.setState({ [`show${type}Modal`]: true })
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

  handleUpdateSubmission = (data) => {
    const { lesson } = this.props;
    const { repo_url, live_preview_url, is_public, project_id } = data

    event.preventDefault()

    axios.put(
      `/lessons/${lesson.id}/projects/${project_id}`,
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
        submissions: Object.assign([], this.state.submissions, {[0]: response.data.project})
      })
    })
  }

  userSubmission = () => {
    const { submissions } = this.state;
    const { userId } = this.props;

    return submissions.find( submission => submission.user_id === userId);
  }

  render() {
    const { course, lesson, userId } = this.props;
    const { submissions } = this.state;

    return (
      <div className="submissions">
        <div className="submissions__header">

          <div className="submissions__course">
            <h3 className="submissions__title">Solutions:</h3>
            <h4 className="submissions__project-title">{course.title}: ({lesson.title})</h4>
          </div>

          <Modal show={this.state.showCreateModal} handleClose={() => this.hideModal("Create")}>
            <CreateSubmissionForm
              lessonId={lesson.id}
              onSubmit={this.handleCreateSubmission}
              onClose={() => this.hideModal("Create")}
            />
          </Modal>

          { this.userSubmission() &&
            <Modal show={this.state.showEditModal} handleClose={() => this.hideModal("Edit")}>
              <EditSubmissionForm
                submission={this.userSubmission()}
                onSubmit={this.handleUpdateSubmission}
                onClose={() => this.hideModal("Edit")}
              />
            </Modal>
          }

          <div>
            <button
              className="submissions__add button button--primary"
              onClick={() => this.openModal("Create")}
            >
              Add Solution
            </button>
          </div>
        </div>

        <SubmissionsList submissions={submissions} userId={userId} openEditModal={() => this.openModal("Edit")} />
      </div>
    )
  }
}

export default ProjectSubmissions
