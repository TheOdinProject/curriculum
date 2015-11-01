require 'spec_helper'

describe 'forums' do

  let(:user){ FactoryGirl.create(:user) }

  context "without a signed in user" do
    before do
      visit forum_path
    end

    it "should not allow access to forums" do
      expect(current_path).not_to eq(forum_path)
    end

  end

  context "with a signed in user" do

    before do
      sign_in(user)
      visit forum_path
    end

    it "should allow access to forums" do
      expect(current_path).to eq(forum_path)
    end
  end

end