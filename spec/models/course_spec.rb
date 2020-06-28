require 'rails_helper'

RSpec.describe Course do
  subject(:course) { described_class.new }

  it { is_expected.to have_many(:tracks) }
  it { is_expected.to have_many(:sections) }
  it { is_expected.to have_many(:lessons) }

  it { is_expected.to validate_presence_of(:position) }
end
