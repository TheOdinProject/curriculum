require 'spec_helper'

describe LessonsController do

  # use the second section so we don't overlap with the 
  # whole curriculum tests
  let(:course){ FactoryGirl.create(:course, :is_active => true) }
  let(:sections){ FactoryGirl.create_list(:section, 7, :course_id => course.id) }
  let(:s1_lessons){ FactoryGirl.create_list(:lesson, 5, :section_id => sections.first.id) }

  describe "GET index" do

    context "with shuffled section positions" do
      before do
        sections.first.update_attributes!(:position => sections.last.position + 1)
      end
      
      it "sections should be sorted by position" #do
      #   pending
      #   get :index
      #   assigns(:sections).should == sections.sort{|a,b| a.position <=> b.position }
      # end
    end
  end

  describe "GET show" do

  end

end