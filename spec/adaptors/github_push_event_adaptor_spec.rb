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
  let(:ref) { 'refs/heads/master' }

  describe '#merged_to_master?' do
    context 'when the ref is master' do
      it 'returns true' do
        expect(adaptor.merged_to_master?).to be(true)
      end
    end

    context 'when the ref is not master' do
      let(:ref) { 'some/other/branch' }

      it 'returns false' do
        expect(adaptor.merged_to_master?).to be(false)
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
