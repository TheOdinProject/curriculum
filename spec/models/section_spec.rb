require 'spec_helper'

describe Section do
  let(:attrs) { FactoryGirl.attributes_for(:section) }
  let(:course) { double("course") }
  subject(:section) { Section.new(attrs) }
  before do
    course.stub("id"){ 1 }
    subject.course_id = course.id
  end

  it { should respond_to(:title) }
  it { should respond_to(:title_url) }
  it { should respond_to(:description) }
  it { should respond_to(:position) }
  it { should respond_to(:course_id) }

  # Associations
  it { should respond_to(:course) }
  it { should respond_to(:lessons) }

  it { should be_valid }

  it "shouldn't allow duplicate positions" do
    s2 = Section.new(attrs)
    s2.course_id = course.id
    s2.save
    subject.should_not be_valid
  end

end