require 'spec_helper'

describe "Admin Flash" do
  let!(:admin_flash) { AdminFlash.create(message: "Some Message", expires: 2.days.from_now) }
  
  context "on the courses page" do    
    before { visit courses_path }
    it { expect(page).to have_content(admin_flash.message) }
    
    context "shouldn't display expired message(s)" do 
      let!(:expired_flash) { AdminFlash.create(message: "Expired message", expires: 1.day.ago) }
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
      visit login_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
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