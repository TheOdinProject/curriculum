require 'spec_helper'

describe Lesson do
  let(:attrs) { FactoryGirl.attributes_for(:lesson) }
  let(:section) { double("section") }
  subject(:lesson) { Lesson.new(attrs) }
  before do
    # section = double("section")
    allow(section).to receive("id"){ 1 }
    subject.section_id = section.id
  end

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:title_url) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:is_project) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:position) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:section_id) }

  # Associations
  it { is_expected.to respond_to(:course) }
  it { is_expected.to respond_to(:section) }
  it { is_expected.to respond_to(:completing_users) }
  it { is_expected.to respond_to(:lesson_completions) }
  
  it { is_expected.to be_valid }

  it "shouldn't allow duplicate positions" do
    l2 = Lesson.new(attrs)
    l2.section_id = section.id
    l2.save
    expect(subject).not_to be_valid
  end
  
  it "should have no completing users yet" do
    expect(subject.completing_users).to be_empty
  end

end
