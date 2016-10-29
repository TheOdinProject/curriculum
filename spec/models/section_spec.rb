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
  
  # Associations
  it { is_expected.to belong_to(:course) }
  it { is_expected.to have_many(:lessons) }

  # Validations
  it { is_expected.to validate_uniqueness_of(:position).
    with_message('Section position has already been taken') }
end
