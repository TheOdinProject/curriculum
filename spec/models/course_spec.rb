require 'rails_helper'

RSpec.describe Course do
  subject(:course) { Course.new(position: 1) }

  let(:lessons)  { [lesson1, lesson2] }
  let(:lesson1)  { double('Lesson', position: 1) }
  let(:lesson2)  { double('Lesson', position: 2) }

  before do
    allow(course).to receive(:lessons).and_return(lessons)
  end

  it { is_expected.to have_many(:sections) }
  it { is_expected.to have_many(:lessons) }
  it { is_expected.to validate_uniqueness_of(:position) }

  describe '#percent_completed_by' do
    let(:current_user) { double('User') }
    let(:lesson) { double('Lesson') }

    before do
      allow(course).to receive(:lessons).and_return(lessons)
      allow(current_user).to receive(:completed_lessons).and_return([])
    end

    context 'when a user has completed no lessons' do
      it 'returns 0' do
        expect(course.percent_completed_by(current_user)).to eq(0)
      end
    end

    context 'when a user has completed the only lesson' do
      before do
        allow(course).to receive(:lessons).and_return([lesson])
        allow(current_user).to receive(:completed_lessons).and_return([lesson])
      end

      it 'returns 100' do
        expect(course.percent_completed_by(current_user)).to eq(100)
      end
    end

    context 'when a user has completed one of four lessons' do
      let(:lesson1) { double('Lesson') }
      let(:lesson2) { double('Lesson') }
      let(:lesson3) { double('Lesson') }
      let(:lesson4) { double('Lesson') }
      let(:lessons) { [lesson1, lesson2, lesson3, lesson4] }

      before do
        allow(course).to receive(:lessons).and_return(lessons)
        allow(current_user).to receive(:completed_lessons).and_return([lesson1])
      end

      it 'returns 25' do
        expect(course.percent_completed_by(current_user)).to eq(25)
      end
    end
  end
end
