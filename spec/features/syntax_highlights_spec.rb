require 'spec_helper'

describe "Syntax-highlights" do 
  subject { page } 
  context "on a lesson with properly fenced and identified ruby code" do
    
    # Create a lesson to be displayed
    # Fill that lesson with proper fenced code identification
    # Test for classes via JS
    let!(:course) { FactoryGirl.create(:course)}
    let!(:section) { FactoryGirl.create(:section)}
    let!(:lesson) { FactoryGirl.create(:lesson, :content => "```lang-ruby\n I am ruby code```")}
    
    # pending "- Prism.js classes seem to be added after capybara runs test!"
    
    # Change next line to go to a page with code and marked up with ```language
    before { visit lesson_path(course.title_url, lesson.title_url) }
    
    # Checks for 'token' class on span, which gets added by Prism.js,
    # doesn't check for 'class.lang-xxx' because that's Red Carpets job and lang specific.
    it "should have the proper prism.js ruby class" do :js => true
      expect(page).to have_css('span.token')
    end
  end
end
