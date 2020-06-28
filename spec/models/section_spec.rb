require 'rails_helper'

RSpec.describe Section do
  subject { described_class.new }

  it { is_expected.to belong_to(:course) }
  it { is_expected.to have_many(:lessons).order(:position) }

  it {is_expected.to validate_presence_of(:position) }
end
