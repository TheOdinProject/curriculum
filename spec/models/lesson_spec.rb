require 'spec_helper'

RSpec.describe Lesson do
  subject(:lesson) { Lesson.new(title: 'test_lesson', position: 1, section_id: 2) }
  let(:find_lesson) { double('FindLesson')}

  before do
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
end
