require 'rails_helper'

RSpec.describe GithubPushEventAdaptor do
  subject(:adaptor) { described_class.new(payload) }

  let(:payload) do
    {
      ref: ref,
      head_commit: {
        modified: ['url/one', 'url/two'],
      }
    }
  end
  let(:ref) { 'refs/heads/main' }

  describe '#merged_to_main?' do
    context 'when the ref is main' do
      it 'returns true' do
        expect(adaptor.merged_to_main?).to be(true)
      end
    end

    context 'when the ref is not main' do
      let(:ref) { 'some/other/branch' }

      it 'returns false' do
        expect(adaptor.merged_to_main?).to be(false)
      end
    end
  end

  describe '#modified_urls' do
    it 'returns the modified urls formatted correctly' do
      result = ['/url/one', '/url/two']

      expect(adaptor.modified_urls).to eq(result)
    end
  end
end
