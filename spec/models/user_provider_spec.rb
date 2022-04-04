require 'rails_helper'

RSpec.describe UserProvider do
  it { is_expected.to belong_to(:user) }

  describe '.find_user' do
    subject { described_class.find_user(auth) }

    let(:auth) { double('Auth') }
    let(:user_provider_finder) { double('UserProviderFinder', user: user) }
    let(:user) { double('User') }

    before do
      allow(OmniauthProviders::Finder).to receive(:find)
        .with(auth)
        .and_return(user_provider_finder)
    end

    it 'returns the user who owns the user provider' do
      expect(subject).to eql(user)
    end
  end
end
