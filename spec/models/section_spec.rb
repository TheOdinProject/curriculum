require 'spec_helper'

describe Section do
  let(:attrs) { FactoryGirl.attributes_for(:section) }
  let(:course) { double("course") }
  subject(:section) { Section.new(attrs) }
  before do
    allow(course).to receive("id"){ 1 }
    subject.course_id = course.id
  end

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:title_url) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:position) }
  it { is_expected.to respond_to(:course_id) }

  # Associations
  it { is_expected.to respond_to(:course) }
  it { is_expected.to respond_to(:lessons) }

  it { is_expected.to be_valid }

  it "shouldn't allow duplicate positions" do
    s2 = Section.new(attrs)
    s2.course_id = course.id
    s2.save
    expect(subject).not_to be_valid
  end

end