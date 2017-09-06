require 'rails_helper'

RSpec.describe CourseProgress do
  subject { CourseProgress.new(course, user) }

  let(:course) { double('Course', lessons: lessons) }
  let(:lessons) { [lesson, other_lesson_in_course] }
  let(:lesson) { double('Lesson') }
  let(:other_lesson_in_course) { double('Lesson') }
  let(:user) { double('User', completed_lessons: completed_lessons) }
  let(:completed_lessons) { [lesson] }


  describe '#course_started?' do
    it 'returns true' do
      expect(subject.course_started?).to eql(true)
    end

    context 'when user has not started the course' do
      let(:lesson_from_other_course) { double('Lesson') }
      let(:completed_lessons) { [lesson_from_other_course] }

      it 'returns false' do
        expect(subject.course_started?).to eql(false)
      end
    end
  end

  describe '#percentage_completed_by_user' do
    it 'returns 50' do
      expect(subject.percentage_completed_by_user).to eql(50)
    end
  end

  describe '#course_completed?' do
    it 'returns false' do
      expect(subject.course_completed?).to eql(false)
    end

    context 'when user has completed all lessons in the course' do
      let(:completed_lessons) { [lesson, other_lesson_in_course] }

      it 'returns true' do
        expect(subject.course_completed?).to eql(true)
      end
    end
  end

end
