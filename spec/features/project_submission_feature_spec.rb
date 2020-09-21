require 'rails_helper'

RSpec.describe ProjectSubmissionFeature do
  describe '.enabled?' do
    context 'when on the tic tac toe lesson' do
      let(:lesson) { create(:lesson, description: 'Tic Tac Toe') }

      it 'returns true' do
        expect(ProjectSubmissionFeature.enabled?(lesson)).to be(true)
      end
    end

    context 'when not on the tic tac toe lesson' do
      let(:lesson) { create(:lesson, description: 'Another Lesson') }

      it 'returns false' do
        expect(ProjectSubmissionFeature.enabled?(lesson)).to be(false)
      end
    end
  end
end
