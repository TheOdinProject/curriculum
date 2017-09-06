require 'rails_helper'

RSpec.describe CourseHelper do
  let(:lesson) { double('Lesson', title: 'Ruby Basics', id: lesson_id) }
  let(:lesson_id) { 1 }
  let(:user) { double('User', completed_lessons: completed_lessons) }
  let(:completed_lessons) { [completion_lesson] }
  let(:completion_lesson) { double('Lesson', id: 1)}

  before do
    allow(helper).to receive(:current_user).
      and_return(user)
  end

  describe '#lesson_completed?' do
    subject { helper.lesson_completed?(user, lesson) }

    it 'returns the completed lesson class' do
      expect(subject).to eql('section-lessons__item__icon--completed')
    end

    context 'when user has not completed the lesson' do
      let(:lesson_id) { 2 }

      it 'returns nil' do
        expect(subject).to eql(nil)
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
