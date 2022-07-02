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

  describe '.fullstack_paths' do
    it 'returns the fullstack paths' do
      foundations_path = create(:path, default_path: true, title: 'Foundations')
      rails_fullstack_path = create(:path, title: 'Rails Fullstack')
      javascript_fullstack_path = create(:path, title: 'Javascript Fullstack Path')

      expect(described_class.fullstack_paths).to contain_exactly(
        rails_fullstack_path, javascript_fullstack_path
      )
    end
  end

  describe '.default_path' do
    it 'returns the default path users should be enrolled in when they sign up' do
      default_path = create(:path, default_path: true)
      non_default_path = create(:path)

      expect(described_class.default_path).to eq(default_path)
    end
  end
end
