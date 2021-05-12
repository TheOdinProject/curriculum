require 'rails_helper'

RSpec.describe LessonsHelper do
  describe '#next_lesson_button_state' do
    let(:current_user) { create(:user) }
    let(:lesson) { create(:lesson) }

    before do
      allow(helper).to receive(:current_user).and_return(current_user)
    end

    context 'when the current user has completed the lesson' do
      before do
        create(:lesson_completion, user: current_user, lesson: lesson)
      end

      it 'returns button primary class' do
        expect(helper.next_lesson_button_state(lesson)).to eql('button--primary')
      end
    end

    context 'when current user has not completed the lesson' do
      it 'returns button secondary class' do
        expect(helper.next_lesson_button_state(lesson)).to eql('button--secondary')
      end
    end
  end

  describe '#github_edit_url' do
    let(:lesson) { create(:lesson) }

    it 'returns the github edit url for the lesson' do
      expect(helper.github_edit_url(lesson)).to eql(
        'https://github.com/TheOdinProject/curriculum/edit/master/lesson_course/lesson_title.md'
      )
    end
  end

  describe '#user_submission' do
    let(:current_user) { create(:user) }
    let(:lesson) { create(:lesson) }

    context 'when the user has a project submission for the lesson' do
      let!(:project_submission) { create(:project_submission, user: current_user, lesson: lesson) }

      before do
        allow(ProjectSubmissionSerializer).to receive(:as_json)
      end

      it 'returns the users submission in json format' do
        helper.user_submission(current_user, lesson)
        expect(ProjectSubmissionSerializer).to have_received(:as_json).with(project_submission, current_user)
      end
    end

    context 'when the user is not logged in' do
      let(:current_user) { nil }

      it 'returns nil' do
        expect(helper.user_submission(current_user, lesson)).to be_nil
      end
    end

    context 'when the user does not have a project submission for the lesson' do
      it 'returns nil' do
        expect(helper.user_submission(current_user, lesson)).to be_nil
      end
    end

    context 'when the user has had their submission soft deleted' do
      let!(:soft_deleted_project_submission) do
        create(:project_submission, user: current_user, lesson: lesson, discarded_at: Time.zone.today)
      end

      it 'returns nil' do
        expect(helper.user_submission(current_user, lesson)).to be_nil
      end
    end
  end
end
