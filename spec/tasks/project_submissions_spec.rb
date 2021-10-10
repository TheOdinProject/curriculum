require 'rails_helper'
require 'rake'

describe ':project_submissions' do
  before :all do
    Rake.application.rake_require 'tasks/project_submissions'
    Rake::Task.define_task(:environment)
  end

  let(:project_submissions_discard) do
    Rake::Task['project_submissions:discard'].reenable

    Rake.application.invoke_task 'project_submissions:discard'
  end

  describe 'project_submissions:discard' do
    context 'with a discardable project submission' do
      let(:project_submission) do
        FactoryBot.create(
          :project_submission,
          discard_at: 1.day.ago
        )
      end

      it 'discards it' do
        project_submissions_discard
        expect(project_submission.reload.discard_at).not_to be_nil
      end
    end

    context 'with a non discardable project submission' do
      let(:project_submission) do
        FactoryBot.create(:project_submission)
      end

      it 'does not discard it' do
        project_submissions_discard
        expect(project_submission.reload.discard_at).to be_nil
      end
    end
  end
end
