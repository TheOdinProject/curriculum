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

end