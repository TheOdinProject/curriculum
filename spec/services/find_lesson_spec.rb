require 'rails_helper'

RSpec.describe FindLesson do
  subject(:find_lesson) { FindLesson.new(lesson) }

  let(:lesson)   { double('Lesson', position: position) }
  let(:position) { 1 }
  let(:course)   { double('Course', lessons: lessons) }
  let(:lessons)  { [lesson, lesson_2, lesson_3] }
  let(:lesson_2) { double('Lesson', position: 2) }
  let(:lesson_3) { double('Lesson', position: 3) }

  before do
    allow(lesson).to receive(:course).and_return(course)

    allow(lessons).to receive(:order).with(position: :asc)
      .and_return(lessons)

    allow(lessons).to receive(:find_by_position).with(2)
      .and_return(lesson_2)
  end

  describe '#new' do
    it 'will return a new find lesson object' do
      expect(find_lesson).to be_an_instance_of(FindLesson)
    end
  end

  describe '#next_lesson' do
    it 'will return the next lesson' do
      expect(find_lesson.next_lesson).to eql(lesson_2)
    end

    context 'when the current lesson is the last lesson' do
      before do
        allow(lesson).to receive(:position).and_return(2)
        allow(lessons).to receive(:find_by_position).with(3).and_return(nil)
      end

      it 'will return nil' do
        expect(find_lesson.next_lesson).to eql(nil)
      end
    end
  end

  describe '#prev_lesson' do
    before do
      allow(lesson).to receive(:position).and_return(3)
      allow(lessons).to receive(:find_by_position).with(2).and_return(lesson_2)
    end

    it 'will return the previous lesson' do
      expect(find_lesson.prev_lesson).to eql(lesson_2)
    end

    context 'when the current lesson is the first lesson' do
      before do
        allow(lesson).to receive(:position).and_return(1)
        allow(lessons).to receive(:find_by_position).with(0).and_return(nil)
      end

      it 'will return nil' do
        expect(find_lesson.prev_lesson).to eql(nil)
      end
    end
  end
end
