require 'spec_helper'
 
describe "Syntax-highlights" do 
  subject { page } 
  context "on a lesson with properly fenced and identified ruby code" do
    
    let!(:course) { FactoryGirl.create(:course)}
    let!(:section) { FactoryGirl.create(:section, :course_id => course.id)}
    let!(:lesson) { FactoryGirl.create(:lesson, :section_id => section.id, :content => "```lang-ruby\n # I am a ruby comment\nputs \"Hi and stuff\"\n```")}
    
    before do
      visit lesson_path(course.title_url, lesson.title_url)
    end
    
    it "should have the proper prism.js ruby class", :js => true do
      expect(page).to have_css('.language-ruby')
    end
  end
end
