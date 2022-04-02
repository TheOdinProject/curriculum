require 'rails_helper'

RSpec.describe FindLesson do
  subject(:find_lesson) { FindLesson.new(current_lesson, course) }

  let(:current_lesson)  { middle_lesson }
  let(:course) { instance_double(Course, lessons: [first_lesson, middle_lesson, last_lesson]) }
  let(:first_lesson) { instance_double(Lesson, position: 1) }
  let(:middle_lesson) { instance_double(Lesson, position: 2) }
  let(:last_lesson) { instance_double(Lesson, position: 3) }

  describe '#next_lesson' do
    it 'returns the next lesson' do
      expect(find_lesson.next_lesson).to eql(last_lesson)
    end

    context 'when the current lesson is the last lesson' do
      let(:current_lesson) { last_lesson }

      it 'returns nil' do
        expect(find_lesson.next_lesson).to be_nil
      end
    end
  end

  describe '#previous_lesson' do
    it 'returns the previous lesson' do
      expect(find_lesson.previous_lesson).to eql(first_lesson)
    end

    context 'when the current lesson is the first lesson' do
      let(:current_lesson) { first_lesson }

      it 'returns nil' do
        expect(find_lesson.previous_lesson).to be_nil
      end
    end
  end
end
