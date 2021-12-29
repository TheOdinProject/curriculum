require 'rails_helper'

RSpec.describe LessonProjectSubmissionsQuery do
  subject(:query) { described_class.new(lesson: lesson, current_user: current_user, limit: limit) }

  let(:lesson) { create(:lesson) }
  let(:current_user) { create(:user) }
  let(:limit) { nil }

  describe '#current_user_submission' do
    context 'when the current user is present and they have a submission' do
      it 'returns the current users submission' do
        current_user_submission = create(:project_submission, user: current_user, lesson: lesson)

        expect(query.current_user_submission).to eq(current_user_submission)
      end
    end

    context 'when the current user is present and they do not have a submission' do
      it 'returns nil' do
        expect(query.current_user_submission).to eq(nil)
      end
    end

    context 'when the current user is not present' do
      let(:current_user) { nil }

      it 'returns nil' do
        expect(query.current_user_submission).to eq(nil)
      end
    end
  end

  describe '#public_submissions' do
    it 'returns any public project submissions that do not belong to the user for the lesson' do
      project_submission_one = create(:project_submission, lesson: lesson, created_at: 1.hour.ago)
      project_submission_two = create(:project_submission, lesson: lesson, created_at: 2.hours.ago)
      create(:project_submission, lesson: lesson, created_at: 3.hours.ago, user: current_user)

      expect(query.public_submissions).to eq([project_submission_one, project_submission_two])
    end
  end
end
