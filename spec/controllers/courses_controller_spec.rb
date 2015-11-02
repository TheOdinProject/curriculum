require 'spec_helper'


describe CoursesController do

  let(:courses){ FactoryGirl.create_list(:course, 3, :is_active => true) }

  context "requesting the courses index" do

    describe "GET index" do

      context "by default" do
        
        it "courses should be sorted by position" do
          get :index
          assigns(:courses).should == courses.sort{|a,b| a.position <=> b.position }
        end
      end

      context "with courses at out-of-order positions" do

        before do
          courses.first.position = courses.last.position + 1
          courses.first.save
        end

        it "should still be sorted by position" do
          get :index
          assigns(:courses).should == courses.sort{|a,b| a.position <=> b.position }
        end
      end
    end
  end

  context "requesting the lessons index for a course" do

    # courses/:course_name/lessons
    it "sections should be sorted by position"
      # get :course, :course_name => courses.first.title_url
      # puts response.inspect
      # puts "\n\n\n#{assigns(:sections)}!!!\n\n\n"
      # # BROKEN!!! See the lessons controller spec... this stupid complex route should be testable somehow.
      # assigns(:sections).should_not be_empty 


  end
end