require 'spec_helper'

describe "Admin Flash" do
  before { AdminFlash.create(message: "Some Message", expires: 2.days.from_now) }
  
  context "on the courses page" do    
    before { visit courses_path }
    it { expect(page).to have_content("Some Message") }
    
    context "shouldn't display expired message(s)" do
      before do 
        @new_admin_flash = AdminFlash.create(message: "Expired message", expires: 1.day.ago)
        visit courses_path
      end
    
      it { expect(page).to_not have_content("Expired message") }
    end
  end   

 
  
    
end  