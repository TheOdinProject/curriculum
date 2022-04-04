require 'rails_helper'

class LessonCompletions
  def initialize(completed_lessons)
    @completed_lessons = completed_lessons
  end

  def where(lesson_id:)
    @completed_lessons.find_all { |lesson| lesson_id.include?(lesson) }
  end
end

RSpec.describe CourseProgress do
  subject { described_class.new(course, user) }

  let(:lessons) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  let(:course) { double('Course', lesson_ids: lessons) }
  let(:user) { double('User', lesson_completions: LessonCompletions.new(completed_lessons)) }

  context 'when user has not started the course' do
    let(:completed_lessons) { [] }

    it { is_expected.not_to be_started }
    it { is_expected.not_to be_completed }

    describe '#percentage' do
      it 'should be at 0%' do
        expect(subject.percentage).to eq(0)
      end
    end
  end

  context 'when user has started the course' do
    let(:completed_lessons) { [1, 2, 3] }

    it { is_expected.to be_started }
    it { is_expected.not_to be_completed }

    describe '#percentage' do
      it 'should be at 30%' do
        expect(subject.percentage).to eq(30)
      end
    end
  end

  context 'when user has completed the course' do
    let(:completed_lessons) { lessons }

    it { is_expected.to be_started }
    it { is_expected.to be_completed }

    describe '#percentage' do
      it 'should be at 100%' do
        expect(subject.percentage).to eq(100)
      end
    end
  end
end
