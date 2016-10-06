require 'spec_helper'

describe GravatarUrlBuilder do
  subject(:gravatar_url_builder) {
    GravatarUrlBuilder.new(user, size)
  }

  let(:user) { double('User', email: 'student@odin.com') }
  let(:size) { 4 }
  let(:gravatar_hash) { 'foo123' }

  before do
    allow(Digest::MD5).to receive(:hexdigest).
      with('student@odin.com').and_return(gravatar_hash)
  end

  describe '#url' do

    it 'returns the users gravatar url' do
      expect(gravatar_url_builder.url).
        to eql('http://www.gravatar.com/avatar/foo123?s=4&d=http://www.gravatar.com/avatar/436053b3e050d4156773bc04cfb167fe?s=4')
    end
  end
end
