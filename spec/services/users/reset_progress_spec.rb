require 'rails_helper'

RSpec.describe Users::ResetProgress do
  subject(:service) { described_class.call(user) }
  let!(:user) { create(:user, path: foundations_path) }
  let!(:foundations_path) { create(:path, default_path: true) }
  let!(:first_completion) { create(:lesson_completion, lesson: create(:lesson), user: user) }
  let!(:second_completion) { create(:lesson_completion, lesson: create(:lesson), user: user) }

  describe '#call' do
    it 'deletes all lesson completions' do
      expect { service }.to change { user.lesson_completions.count }.from(2).to(0)
    end

    context 'when path is default path' do
      it 'does not change path' do
        expect { service }.not_to(change { user.path })
      end
    end

    context 'when path is not the default path' do
      let(:rails_path) { create(:path, default_path: false) }

      it 'changes path to the default path' do
        user.update(path: rails_path)
        expect { service }.to change { user.path.default_path? }.from(false).to(true)
      end
    end
  end

  describe '#success?' do
    it 'returns true' do
      expect(service.success?).to be(true)
    end
  end
end
