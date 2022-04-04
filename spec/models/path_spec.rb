require 'rails_helper'

RSpec.describe Path do
  subject { described_class.new }

  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:courses).order(:position) }
  it { is_expected.to have_many(:path_prerequisites).dependent(:destroy) }
  it { is_expected.to have_many(:prerequisites).through(:path_prerequisites).source(:prerequisite) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:position) }

  describe '.default_path' do
    let!(:default_path) { create(:path, default_path: true) }
    let!(:non_default_path) { create(:path) }

    it 'returns the default path users should be enrolled in when they sign up' do
      expect(described_class.default_path).to eq(default_path)
    end
  end
end
