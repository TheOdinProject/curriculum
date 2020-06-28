require 'rails_helper'

RSpec.describe Track do
  subject { described_class.new }

  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:track_courses) }
  it { is_expected.to have_many(:courses) }

  it {is_expected.to validate_presence_of(:title) }
  it {is_expected.to validate_presence_of(:description) }
  it {is_expected.to validate_presence_of(:position) }

end
