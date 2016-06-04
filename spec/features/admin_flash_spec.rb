require 'rails_helper'

describe "Admin Flash" do
  let!(:admin_flash) { FactoryGirl.create(:admin_flash) }

  context "on the courses page" do
    before { visit courses_path }
    it { expect(page).to have_content(admin_flash.message) }

    context "shouldn't display expired message(s)" do
      let(:expired_flash) { FactoryGirl.create(:expired_admin_flash) }
      before { visit courses_path }
      it { expect(page).to_not have_content(expired_flash.message) }
    end
  end

  context "on the home page" do
    before { visit root_path }

    it { expect(page).to_not have_content(admin_flash.message) }
  end

  context "for signed in user" do

    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
      visit courses_path
    end
    it "should display messages" do
      expect(page).to have_content(admin_flash.message)
    end
    it "should not display messages" do
      expect(page).to_not have_content("Asdf Qwerty")
    end

  end

end
