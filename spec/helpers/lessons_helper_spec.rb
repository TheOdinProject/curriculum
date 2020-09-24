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
        create(:lesson_completion, student: current_user, lesson: lesson)
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

  describe '#legacy_submissions_url' do
    let(:lesson) { create(:lesson) }

    it 'returns the legacy submissions url for the lesson' do
      expect(helper.legacy_submissions_url(lesson)).to eql(
        'https://github.com/TheOdinProject/curriculum/blob/master/legacy_submissions/lesson_course/lesson_title.md'
      )
    end
  end
end
