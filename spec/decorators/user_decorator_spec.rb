require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:user_decorator) { UserDecorator.new(user) }

  let(:user) {
    instance_double(
      User,
      project_submissions: project_submissions
    )
  }

  let(:project_submissions) { [project_submission] }
  let(:project_submission) { instance_double(ProjectSubmission) }

  describe '#has_project_submissions?' do
    it 'returns true' do
      expect(user_decorator.has_project_submissions?).to eql(true)
    end

    context 'when the user does not have any project submissions' do
      let(:project_submissions) { [] }

      it 'returns false' do
        expect(user_decorator.has_project_submissions?).to eql(false)
      end
    end
  end
end
