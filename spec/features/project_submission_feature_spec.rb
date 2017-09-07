require 'rails_helper'

RSpec.describe ProjectSubmissionFeature do
  describe '.enabled?' do
    it 'returns false' do
      expect(ProjectSubmissionFeature.enabled?).to be(false)
    end
  end
end
