require 'rails_helper'

RSpec.describe CourseHelper do
  let(:lesson) { double('Lesson', title: 'Ruby Basics') }
  let(:user) { double('User') }

  before do
    allow(helper).to receive(:current_user).
      and_return(user)
  end

  describe '#lesson_completed' do
    subject { helper.lesson_completed?(lesson) }

    let(:lesson_completed?) { true }

    before do
      allow(user).to receive(:has_completed?).
        with(lesson).and_return(lesson_completed?)
    end

    it 'returns the completed lesson class' do
      expect(subject).to eql('section-lessons__item__icon--completed')
    end

    context 'when user has not completed the lesson' do
      let(:lesson_completed?) { false }

      it 'returns nil' do
        expect(helper.lesson_completed?(lesson)).to eql(nil)
      end
    end
  end

  describe 'numbered_lesson_title' do
    subject { helper.numbered_lesson_title(lesson, lesson_index) }

    let(:lesson_index) { 1 }

    it 'returns the lesson title prepended with its number' do
      expect(subject).to eql('2. Ruby Basics')
    end
  end
end
