require 'rails_helper'

describe Section do
  subject(:section) { Section.new(
    :title => "test section",
    :title_url => "testsection.url.com",
    :description => "some test description",
    :position => 2,
    :course_id => course.id 
  )}
  let(:course) { double("Course", :id => 1) }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:title_url) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:position) }
  it { is_expected.to respond_to(:course_id) }

  it { is_expected.to respond_to(:course) }
  it { is_expected.to respond_to(:lessons) }

  # Associations
  it { is_expected.to belong_to(:course) }
  it { is_expected.to have_many(:lessons) }

  # Validations
  it { is_expected.to validate_uniqueness_of(:position).with_message('Section position has already been taken') }
  it { is_expected.to be_valid }
end
