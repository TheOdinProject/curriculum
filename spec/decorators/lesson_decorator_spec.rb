require 'rails_helper'

RSpec.describe LessonDecorator do
  subject(:lesson_decorator) { described_class.new(lesson) }

  let(:lesson) do
    instance_double(
      Lesson,
      is_project?: is_project?,
      title: 'Ruby Basics',
      course: course
    )
  end

  let(:is_project?) { true }
  let(:course) { instance_double(Course) }

  describe '#title' do
    it 'returns the project title' do
      expect(lesson_decorator.title).to eql('Project: Ruby Basics')
    end

    context 'when lesson is not a project' do
      let(:is_project?) { false }

      it 'returns the normal lesson title' do
        expect(lesson_decorator.title).to eql('Ruby Basics')
      end
    end
  end

  describe '#next_lesson' do
    let(:find_lesson) { instance_double(FindLesson, next_lesson: next_lesson) }
    let(:next_lesson) { instance_double(Lesson) }

    before do
      allow(FindLesson).to receive(:new).with(lesson, course).and_return(find_lesson)
    end

    it 'returns the next lesson' do
      expect(lesson_decorator.next_lesson).to eql(next_lesson)
    end
  end

  describe '#course' do
    let(:decorated_course) { instance_double(CourseDecorator) }

    before do
      allow(CourseDecorator).to receive(:new).with(course).and_return(decorated_course)
    end

    it 'returns a decorated course' do
      expect(lesson_decorator.course).to eql(decorated_course)
    end
  end
end
