require 'spec_helper'

describe Lesson do
  let(:attrs) { FactoryGirl.attributes_for(:lesson) }
  let(:section) { double("section") }
  subject(:lesson) { Lesson.new(attrs) }
  before do
    # section = double("section")
    section.stub("id"){ 1 }
    subject.section_id = section.id
  end

  it { should respond_to(:title) }
  it { should respond_to(:title_url) }
  it { should respond_to(:description) }
  it { should respond_to(:is_project) }
  it { should respond_to(:url) }
  it { should respond_to(:position) }
  it { should respond_to(:content) }
  it { should respond_to(:section_id) }

  # Associations
  it { should respond_to(:course) }
  it { should respond_to(:section) }
  it { should respond_to(:completing_users) }
  it { should respond_to(:lesson_completions) }
  
  it { should be_valid }

  it "shouldn't allow duplicate positions" do
    l2 = Lesson.new(attrs)
    l2.section_id = section.id
    l2.save
    subject.should_not be_valid
  end
  
  it "should have no completing users yet" do
    expect(subject.completing_users).to be_empty
  end

end
