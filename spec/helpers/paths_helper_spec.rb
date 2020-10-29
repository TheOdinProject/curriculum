require 'rails_helper'

RSpec.describe PathsHelper do
  # rubocop:disable Layout/LineLength
  describe '#prerequisites_list_for' do
    let(:path) { create(:path, title: 'THE CURRENT PATH') }

    context 'when the path only has one pprerequisite' do
      let(:prerequisite_path) { create(:path, title: 'prerequisite path') }
      let!(:prerequisite) { create(:path_prerequisite, path: path, prerequisite: prerequisite_path) }

      it 'returns prerequisites list with one item' do
        expect(helper.prerequisites_list_for(path)).to eql(
          '<a class="card-main__prerequisite-link" href="http://test.host/paths/prerequisite-path">prerequisite path</a>'
        )
      end
    end

    context 'when path has more than one prerequisite' do
      let(:prerequisite_path_one) { create(:path, title: 'prerequisite path one') }
      let(:prerequisite_path_two) { create(:path, title: 'prerequisite path two') }
      let!(:prerequisite_one) { create(:path_prerequisite, path: path, prerequisite: prerequisite_path_one) }
      let!(:prerequisite_two) { create(:path_prerequisite, path: path, prerequisite: prerequisite_path_two) }

      it 'returns prerequisites seperated by commas' do
        expect(helper.prerequisites_list_for(path)).to eql(
          '<a class="card-main__prerequisite-link" href="http://test.host/paths/prerequisite-path-one">prerequisite path one</a>, ' \
          '<a class="card-main__prerequisite-link" href="http://test.host/paths/prerequisite-path-two">prerequisite path two</a>'
        )
      end
    end
  end
  # rubocop:enable Layout/LineLength
end
