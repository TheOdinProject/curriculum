require 'rails_helper'

RSpec.describe NextLesson do
  subject(:next_lesson) { NextLesson.new(course, lesson_completions) }

  let(:course) { create(:course) }
  let!(:lesson_one) { create(:lesson, course: course) }
  let!(:lesson_two) { create(:lesson, course: course) }
  let!(:lesson_three) { create(:lesson, course: course) }

  describe '#to_complete' do
    context 'when there are incomplete lessons after the most recently completed lesson' do
      let(:lesson_completions) { [create(:lesson_completion, lesson: lesson_one)] }

      it 'returns the next incomplete lesson in the course' do
        expect(next_lesson.to_complete).to eq(lesson_two)
      end
    end

    context 'when there are no incomplete lessons after the most recently completed lesson' do
      let(:lesson_completions) { [create(:lesson_completion, lesson: lesson_three)] }

      it 'returns the first incomplete lesson remaining in the course' do
        expect(next_lesson.to_complete).to eq(lesson_one)
      end
    end

    context 'when there are no remaining incomplete lessons in the course' do
      let(:lesson_completions) do
        [
          create(:lesson_completion, lesson: lesson_one),
          create(:lesson_completion, lesson: lesson_two),
          create(:lesson_completion, lesson: lesson_three)
        ]
      end

      it 'returns nil' do
        expect(next_lesson.to_complete).to eq(nil)
      end
    end
  end
end
