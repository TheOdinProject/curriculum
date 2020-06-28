require 'rails_helper'

RSpec.describe Report do
  subject(:report) { described_class.new }

  it { is_expected.to belong_to(:reporter) }
  it { is_expected.to belong_to(:project) }

  it { is_expected.to validate_presence_of(:reason) }
  it { should define_enum_for(:status).with_values([:active, :resolved]) }
  it { should define_enum_for(:action_taken).with_values([:pending, :warning, :ban]) }
end
