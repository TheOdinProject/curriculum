require 'rails_helper'

RSpec.describe NextLesson, :type => :service do
  subject { NextLesson.new(course, lesson_completions) }

  let(:course) { double('Course', lessons: lessons, id: 1) }
  let(:lessons) { [lesson, next_lesson] }
  let(:lesson) { double('Lesson', position: 1) }
  let(:next_lesson) { double('Lesson', position: 2) }
  let(:lesson_completions) { [lesson_completion] }
  let(:lesson_completion) {
    double(
      'LessonCompletion',
      lesson: lesson,
      created_at: '10-11-2017'
    )
  }

  before do
    allow(lesson).to receive(:course).and_return(course)
  end


  describe '#lesson' do
    it 'returns the next lesson to complete' do
      expect(subject.to_complete).to eql(next_lesson)
    end
  end
end
