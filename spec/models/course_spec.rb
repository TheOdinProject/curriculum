require 'rails_helper'

RSpec.describe Course do
  subject(:course) { described_class.new }

  it { is_expected.to have_many(:path_courses) }
  it { is_expected.to have_many(:paths).through(:path_courses) }
  it { is_expected.to have_many(:sections).order(:position) }
  it { is_expected.to have_many(:lessons).through(:sections) }

  it { is_expected.to validate_presence_of(:position) }

  describe '#progress_for' do
    let(:course) { build_stubbed(:course) }
    let(:user) { build_stubbed(:user) }

    before do
      allow(user).to receive(:progress_for)
    end

    it 'returns the users progress for the course' do
      course.progress_for(user)
      expect(user).to have_received(:progress_for).with(course)
    end
  end
end
