require 'rails_helper'

RSpec.describe LessonsHelper do

  describe '#next_lesson_button_state' do
    let(:lesson) { double('Lesson') }
    let(:user) { double('User') }
    let(:user_completed_lesson) { true }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(user).to receive(:has_completed?).with(lesson).
        and_return(user_completed_lesson)
    end

    it 'returns button primary class' do
      expect(helper.next_lesson_button_state(lesson)).to eql('button--primary')
    end

    context 'when user has not completed the lesson' do
      let(:user_completed_lesson) { false }

      it 'returns button secondary class' do
        expect(helper.next_lesson_button_state(lesson)).to eql('button--secondary')
      end
    end
  end
end
