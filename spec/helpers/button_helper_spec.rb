require 'rails_helper'

RSpec.describe ButtonHelper do
  describe '#sign_up_button' do
    let(:sign_up_button) {
      '<a class="button button--primary" href="/sign_up">Sign Up</a>'
    }

    it 'returns a sign up button' do
      expect(helper.sign_up_button).to eq(sign_up_button)
    end
  end

  describe '#gitter_button' do
    let(:gitter_button) {
      '<a class="button button--secondary" target="_blank" href="https://gitter.im/TheOdinProject/theodinproject">Open Gitter</a>'
    }

    before do
      allow(helper).to receive(:chat_link).and_return('https://gitter.im/TheOdinProject/theodinproject')
    end

    it 'returns a gitter button' do
      expect(helper.gitter_button).to eql(gitter_button)
    end
  end

  describe '#contribute_button' do
    let(:contribute_button) {
      '<a class="button button--primary" href="/contributing">Learn how to contribute</a>'
    }

    it 'returns a contribute button' do
      expect(helper.contribute_button).to eql(contribute_button)
    end
  end
end
