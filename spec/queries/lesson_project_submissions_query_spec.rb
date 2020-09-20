require 'rails_helper'

RSpec.describe LessonProjectSubmissionsQuery do
  subject(:query) { described_class.new(lesson, limit: limit) }

  let(:lesson) { create(:lesson) }
  let(:limit) { nil }

  describe '#with_current_user_submission_first' do
    context 'when the current user is nil' do
      let!(:project_submission_one) { create(:project_submission, lesson: lesson, created_at: 1.hour.ago) }
      let!(:project_submission_two) { create(:project_submission, lesson: lesson, created_at: 2.hours.ago) }

      it 'returns the lesson project submissions without the users submission at the top' do
        expect(query.with_current_user_submission_first(nil)).to eq(
          [
            project_submission_one,
            project_submission_two
          ]
        )
      end
    end

    context 'when the current user is not nil' do
      let(:user) { create(:user) }
      let!(:users_submission) { create(:project_submission, lesson: lesson, user: user) }
      let!(:project_submission_one) { create(:project_submission, lesson: lesson, created_at: 3.hours.ago) }
      let!(:project_submission_two) { create(:project_submission, lesson: lesson, created_at: 1.day.ago) }

      it 'returns the lesson project submissions with the users submission first' do
        expect(query.with_current_user_submission_first(user)).to eq(
          [
            users_submission,
            project_submission_one,
            project_submission_two
          ]
        )
      end
    end
  end
end
