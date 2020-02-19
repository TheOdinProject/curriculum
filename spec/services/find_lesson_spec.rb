require 'rails_helper'

RSpec.describe FindLesson do
  subject(:find_lesson) { FindLesson.new(lesson, course) }

  let(:lesson)  { double('Lesson', position: position) }
  let(:position) { 1 }
  let(:course) { double('Course', lessons: lessons) }
  let(:lessons)  { [lesson, lesson_two, lesson_three] }
  let(:lesson_two) { double('Lesson', position: 2) }
  let(:lesson_three) { double('Lesson', position: 3) }
  let(:lesson_three_position) { 1 }

  describe '#next_lesson' do

    it 'will return the next lesson' do
      expect(find_lesson.next_lesson).to eql(lesson_two)
    end

    context 'when the current lesson is the last lesson' do
      let(:position) { 3 }

      it 'will return nil' do
        expect(find_lesson.next_lesson).to eql(nil)
      end
    end
  end
end
