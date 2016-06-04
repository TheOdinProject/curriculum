require 'rails_helper'

describe Course do
  subject(:course) { Course.new(position: 1) }
  let(:sections) { [section1, section2] }
  let(:section1) { double('Section', position: 1, lessons: lessons) }
  let(:section2) { double('Section', position: 2, lessons: lessons) }
  let(:lessons) { [lesson1, lesson2] }
  let(:lesson1) { double('Lesson', position: 1) }
  let(:lesson2) { double('Lesson', position: 2) }

  before do
    allow(course).to receive(:sections).and_return(sections)
  end

  it { is_expected.to have_many(:sections) }
  it { is_expected.to have_many(:lessons) }
  it { is_expected.to validate_uniqueness_of(:position) }

  describe "#percent_completed_by" do

    let(:current_user) { double("User") }
    let(:lesson) { double("Lesson") }
    let(:lessons_in_course) { [lesson] }

    before do
      allow(course).to receive(:lessons).and_return(lessons)
      allow(current_user).to receive(:completed_lessons).and_return([])
    end

    context "for a user who completed no lessons" do
      it "should return 0" do
        expect(course.percent_completed_by(current_user)).to eq(0)
      end
    end

    context "for a user who completed the only lesson" do

      before do
        allow(course).to receive(:lessons).and_return([lesson])
        allow(current_user).to receive(:completed_lessons).and_return([lesson])
      end

      it "should return 100" do
        expect(course.percent_completed_by(current_user)).to eq(100)
      end
    end

    context "for a user who completed one of four lessons" do
      let(:lesson1) { double("Lesson") }
      let(:lesson2) { double("Lesson") }
      let(:lesson3) { double("Lesson") }
      let(:lesson4) { double("Lesson") }
      let(:lessons) { [lesson1, lesson2, lesson3, lesson4] }
      before do
        allow(course).to receive(:lessons).and_return(lessons)
        allow(current_user).to receive(:completed_lessons).and_return([lesson1])
      end

      it "should return 25" do
        expect(course.percent_completed_by(current_user)).to eq(25)
      end
    end
  end

  describe 'sections_in_course' do
    let(:sectionsAsc) { double('SectionAsc') }

    before do
      allow(sections).to receive(:order).with('position asc').
        and_return(sections)
        allow(sections).to receive(:includes).with(:lessons).
          and_return(sectionsAsc)
    end

    it 'returns sections in course' do
      expect(course.sections_in_course).to eql(sectionsAsc)
    end
  end
end
