require 'rails_helper'

RSpec.describe PathPrerequisite do
  subject { create(:path_prerequisite) }

  it { is_expected.to belong_to(:path) }
  it { is_expected.to belong_to(:prerequisite).class_name('Path') }

  it { is_expected.to validate_uniqueness_of(:prerequisite_id).scoped_to(:path_id) }
end
