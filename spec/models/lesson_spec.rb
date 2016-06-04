require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) {
    Lesson.new(
      title: 'test_lesson',
      position: 1,
      section_id: 2,
      is_project: false
    )
  }
  let(:find_lesson) { double('FindLesson') }
  let(:section) { double('Section', lessons: lessons) }
  let(:lessons) { [] }

  before do
    allow(lesson).to receive(:section).and_return(section)
    allow(FindLesson).to receive(:new).with(lesson).and_return(find_lesson)
  end


  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users) }
  it { is_expected.to validate_uniqueness_of(:position) }


  describe '#next_lesson' do

    it 'finds the next lesson' do
      expect(find_lesson).to receive(:next_lesson)
      lesson.next_lesson
    end
  end

  describe '#prev_lesson' do

    it 'find the previous lesson' do
      expect(find_lesson).to receive(:prev_lesson)
      lesson.prev_lesson
    end
  end

  describe '#position_in_section' do
    let(:lessons) { [lesson, lesson2, lesson3] }
    let(:lesson2) { double('Lesson', is_project: false, position: 2) }
    let(:lesson3) { double('Lesson', is_project: true, position: 3) }
    let(:appropiate_lessons) { [lesson, lesson2] }

    before do
      allow(lesson).to receive(:position).and_return(3)
      allow(lessons).to receive(:where).
        with("is_project = ? AND position <= ?", false, 3).
        and_return(appropiate_lessons)
    end

    it 'returns the position of the lesson in the section' do
      expect(lesson.position_in_section).to eql(2)
    end
  end
end
