require 'spec_helper'

RSpec.describe Lesson do
  subject(:lesson) { Lesson.new(title: 'test_lesson', position: 1, section_id: 2) }
  let(:course) { double('course', lessons: lessons) }
  let(:lessons) { [lesson, lesson_2] }
  let(:lesson_2) { double('Lesson', position: 2) }
  let(:lesson_3) { double('Lesson', position: 3) }

  before do
    allow(lesson).to receive(:course).and_return(course)
    allow(lessons).to receive(:order).with('position asc').and_return(lessons)
    allow(lessons).to receive(:find_by_position).with(2).and_return(lesson_2)
  end


  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users) }
  it { is_expected.to validate_uniqueness_of(:position) }
  

  describe '#next_lesson' do

    it 'will return the next lesson' do
      expect(lesson.next_lesson).to eql(lesson_2)
    end

    context 'when the current lesson is the last lesson' do
      before do
        allow(lesson).to receive(:position).and_return(2)
        allow(lessons).to receive(:find_by_position).with(3).and_return(nil)
      end

      it 'will return nil' do
        expect(lesson.next_lesson).to eql(nil)
      end
    end
  end

  describe '#prev_lesson' do
    before do
      allow(lesson).to receive(:position).and_return(3)
      allow(lessons).to receive(:find_by_position).with(2).and_return(lesson_2)
    end

    it 'will return the previous lesson' do
      expect(lesson.prev_lesson).to eql(lesson_2)
    end

    context 'when the current lesson is the first lesson' do
      before do
        allow(lesson).to receive(:position).and_return(1)
        allow(lessons).to receive(:find_by_position).with(0).and_return(nil)
      end

      it 'will return nil' do
        expect(lesson.prev_lesson).to eql(nil)
      end
    end
  end
end
