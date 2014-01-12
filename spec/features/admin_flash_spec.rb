require 'spec_helper'

describe "Admin Flash" do
  
  # subject {page}
  
  context "on the courses page" do  
    # shorter? before { visit help_path }
    # will let work for creating a message?
    # what selector will it have? it { should have_content('$selector') }
    before do
      AdminFlash.create(message: "Some Message", expires: 2.days.from_now)
      visit courses_path
    end
    
    subject { page }
    
    it "should have AdminFlash message" do
      expect(subject).to have_content("Some Message")
    end
    
  end   
    
end  