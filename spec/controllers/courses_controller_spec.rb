require 'rails_helper'


describe CoursesController do

  let(:courses){ FactoryGirl.create_list(:course, 3, :is_active => true) }

  context "requesting the courses index" do

    describe "GET index" do

      context "by default" do

        it "courses should be sorted by position" do
          get :index
          expect(assigns(:courses)).to eq(courses.sort{|a,b| a.position <=> b.position })
        end
      end

      context "with courses at out-of-order positions" do

        before do
          courses.first.position = courses.last.position + 1
          courses.first.save
        end

        it "should still be sorted by position" do
          get :index
          expect(assigns(:courses)).to eq(courses.sort{|a,b| a.position <=> b.position })
        end
      end
    end
  end
end
