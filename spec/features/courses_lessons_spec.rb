require 'spec_helper'

describe "Courses and Lessons Pages" do

  subject {page}

  before do
    courses = FactoryGirl.create_list(:course, 7, :is_active => true)
    sections = []
    courses.each do |course|
      5.times do
        sections << FactoryGirl.create(:section, :course_id => course.id)
      end
    end
    sections.each do |section|
      4.times{FactoryGirl.create(:lesson, :section_id => section.id)}
    end
  end

  context "on the courses page" do

    before do
      visit courses_path
    end

    it { should have_selector("h1", :text => "This is Your Path to Learning Web Development") }

    describe "it should include every course" do

      it "by title" do
        Course.all.each do |course|
          subject.should have_selector("h2", :text => course.description)
        end
      end

    end


  end


end