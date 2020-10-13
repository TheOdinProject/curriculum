require 'rails_helper'

RSpec.describe PathCourse do
  subject { described_class.new }

  it { is_expected.to belong_to(:path) }
  it { is_expected.to belong_to(:course) }

  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_presence_of(:path_id) }
  it { is_expected.to validate_presence_of(:course_id) }
end
