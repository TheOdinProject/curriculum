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
  it { is_expected.to validate_presence_of(:position) }
end
