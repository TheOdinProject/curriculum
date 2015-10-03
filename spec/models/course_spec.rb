require 'spec_helper'

describe Course do
  let(:attrs) { FactoryGirl.attributes_for(:course) }
  subject(:course) { Course.new(attrs) }

  it { should respond_to(:title) }
  it { should respond_to(:title_url) }
  it { should respond_to(:description) }
  it { should respond_to(:position) }
  it { should respond_to(:you_learn) }
  it { should respond_to(:you_build) }
  it { should respond_to(:teaser) }
  it { should respond_to(:brief_desc) }
  it { should respond_to(:is_active) }

  # Associations
  it { should respond_to(:sections) }
  it { should respond_to(:lessons) }

  it { should be_valid }

  it "shouldn't allow duplicate positions" do
    c2 = Course.new(attrs)
    c2.save
    subject.should_not be_valid
  end

  context "after saving course" do

    before do
      course.save
    end

    describe "#percent_completed_by" do

      let(:current_user) { double("User") }
      let(:lesson1) { double("Lesson") }
      let(:lesson2) { double("Lesson") }
      let(:lesson3) { double("Lesson") }
      let(:lesson4) { double("Lesson") }

      before do
        allow(course).to receive(:lessons).and_return([lesson1])
        allow(current_user).to receive(:completed_lessons).and_return([])
      end 

      context "for a user who completed no lessons" do
        it "should return 0" do
          expect(course.percent_completed_by(current_user)).to eq(0)
        end

      end
      context "for a user who completed the only lesson" do

        before do
          allow(course).to receive(:lessons).and_return([lesson1])
          allow(current_user).to receive(:completed_lessons).and_return([lesson1])
        end

        it "should return 100" do
          expect(course.percent_completed_by(current_user)).to eq(100)
        end
      end

      context "for a user who completed one of four lessons" do

        before do
          allow(course).to receive(:lessons).and_return([lesson1,lesson2,lesson3,lesson4])
          allow(current_user).to receive(:completed_lessons).and_return([lesson1])
        end

        it "should return 25" do
          expect(course.percent_completed_by(current_user)).to eq(25)
        end
      end
    end
  end

end