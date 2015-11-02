require 'spec_helper'

describe "Admin Flash" do
  let!(:admin_flash) { FactoryGirl.create(:admin_flash) }
  
  context "on the courses page" do    
    before { visit courses_path }
    it { expect(page).to have_content(admin_flash.message) }
    
    context "shouldn't display expired message(s)" do 
      let!(:expired_flash) { FactoryGirl.create(:expired_admin_flash) }
      before { visit courses_path }
      it { expect(page).to_not have_content(expired_flash.message) }
    end
    
    # This is a very tricky test because Selenium opens the browser
    # in a different thread so it doesn't have access to any of the
    # database stuff we've done, since RSpec wraps all database
    # operations in transactions which are rolled back after the
    # test is complete.  In this case, any database work is invisible
    # to the selenium test (selenium is used from :js => true).
    # For those new to selenium, it actually opens a firefox browser.
    context "after clicking the flash 'close' button and reloading page" do
      
      before do
        click_button("close_admin_flash_#{admin_flash.id}")
        visit courses_path
      end
        
      it "won't display previously closed message (JS test)", :js => true do
        expect(page).to_not have_content(admin_flash.message)
      end
        
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