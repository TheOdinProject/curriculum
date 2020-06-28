require 'rails_helper'

RSpec.describe TrackCourse do
  subject { described_class.new }

  it { is_expected.to belong_to(:track) }
  it { is_expected.to belong_to(:course) }

  it {is_expected.to validate_presence_of(:position) }
  it {is_expected.to validate_presence_of(:track_id) }
  it {is_expected.to validate_presence_of(:course_id) }

end
