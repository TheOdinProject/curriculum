require 'spec_helper'

describe "Courses and Lessons Pages" do

  subject {page}

  before do
    courses = FactoryGirl.create_list(:course, 3, :is_active => true)
    courses += FactoryGirl.create_list(:course, 4, :is_active => false)
    sections = []
    courses.each do |course|
      5.times do
        sections << FactoryGirl.create(:section, :course_id => course.id)
      end
    end
    sections.each do |section|
      2.times{FactoryGirl.create(:lesson, :section_id => section.id)}
      2.times{FactoryGirl.create(:lesson, :section_id => section.id, :is_project => true)}
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
          subject.should have_selector("h2", :text => course.title)
        end
      end
      # make it a controller test for the orderings
    end
    context "for inactive courses" do
      it "should say 'coming soon'" do
        course = Course.where(:is_active => false).first
        subject.should have_selector("h2", :text => "#{course.title} ...Coming Soon!")
      end
    end
    context "for regular lessons" do
      it "should not say Coming Soon" do
        course = Course.where(:is_active => true).first
        subject.should_not have_selector("h2", :text => "#{course.title} ...Coming Soon!")
      end
    end
  end

  context "on the lessons index page" do

    let(:course1) { Course.first }

    before do
      visit course_path(course1.title_url)
    end

    it "should include every lesson for that course" do
      course1.lessons.each do |lesson|
        subject.should have_selector("h3", :text => lesson.title)
      end
    end

    it "should not include lessons for any other course" do
      not_included_lesson = Course.where("id != #{course1.id}").first.lessons.first
      # puts not_included_lesson.inspect
      subject.should_not have_selector("h3", :text => not_included_lesson.title)
    end

    it "should include all sections for that course" do
      course1.sections.each do |section|
        subject.should have_selector("h2", :text => section.title)
      end
    end

    it "should not include all sections for another course" do
      not_included_section = Course.where("id != #{course1.id}").first.sections.first
      # puts not_included_section.inspect
      subject.should_not have_selector("h3", :text => not_included_section.title)
    end

    context "for projects" do

      let(:project1) { course1.lessons.where(:is_project => :true).first }

      it "should have a special project class" do
        project1.title.should_not be_blank
        url = lesson_path(course1.title_url, project1.title_url)
        # save_and_open_page
        xpath = "//a[@href=\'#{url}\']//*[@class='lesson project']"
        subject.should have_xpath(xpath)
        # subject.find(:xpath, xpath).text.should == "Project:"
      end
    end

    context "for regular lessons" do
      
      let(:non_project1) { course1.lessons.where(:is_project => :false).first }

      it "should not have a special project class" do
        non_project1.title.should_not be_blank
        url = lesson_path(course1.title_url, non_project1.title_url)
        xpath = "//a[@href=\'#{url}\']//*[@class='lesson project']"
        subject.should_not have_xpath(xpath)
      end
    end
  end

  context "in the individual lesson page" do

    let!(:course1) { Course.first }
    let!(:lesson1) { course1.lessons.where(:is_project => false).first }
    let!(:project1) { course1.lessons.where(:is_project => :true).first }
    let!(:non_project1) { course1.lessons.where(:is_project => :false).first }

    before do
      visit lesson_path(course1.title_url, lesson1.title_url)
    end

    it "should show the lesson name in the title" do
      subject.source.should have_selector('title', text: lesson1.title)
    end

    it "should show something in the lesson body container" do
      subject.find(:xpath,"//*[@class='individual-lesson ']//*[@class='container']").text.should_not be_empty
    end

    context "for projects" do
      before do
        visit lesson_path(course1.title_url, project1.title_url)
      end

      it "should have a special project class" do
        xpath = "//*[@class='individual-lesson project-lesson']"
        subject.should have_xpath(xpath)
      end
    end

    context "for regular lessons" do
      before do
        visit lesson_path(course1.title_url, non_project1.title_url)
      end

      it "should not have a special project class" do
        xpath = "//*[@class='individual-lesson project-lesson']"
        subject.should_not have_xpath(xpath)
      end
    end

    describe "navigation buttons and links" do
      
      # use the second section so we don't overlap with the 
      # whole curriculum tests
      let(:second_section) { Section.all[1] }
      let(:first_sec_lesson){ second_section.lessons.order("position asc").first }
      let(:second_sec_lesson){ second_section.lessons.order("position asc")[1] }
      let(:last_sec_lesson){ second_section.lessons.order("position asc").last }
      let(:next_last_sec_lesson){ second_section.lessons.order("position asc")[-1] }
      let(:next_sec_first_lesson) { Section.all[2].lessons.order("position asc").first}

      # very first lesson of a course
      let(:first_lesson){ Lesson.order("position asc").first }
      # very last lesson of a course
      let(:last_lesson){ first_lesson.course.lessons.order("position asc").last }

      it "should be a valid section size" do
        second_section.lessons.count.should >= 4
      end

      it "should have a backlink to the lessons list" do
        subject.should have_xpath("//*[@href = \'#{lessons_path(course1.title_url)}\']")
      end
      
      context "in the middle of a section" do
        before do
          visit lesson_path(first_sec_lesson.course.title_url, first_sec_lesson.title_url)
        end
        it "should show a next button for the next course" do
          # save_and_open_page
          subject.should have_xpath("//*[@href = \'#{lesson_path(second_sec_lesson.course.title_url, second_sec_lesson.title_url)}\']")
        end
        it "should have backlinks to the courses directory" do
          subject.should have_link("Course List", :href => courses_path)
        end
      end

      context "at the end of a section" do
        before do
          visit lesson_path(last_sec_lesson.course.title_url, last_sec_lesson.title_url)
        end
        it "should show a next button to next section's first course" do
          subject.should have_xpath("//*[@href = \'#{lesson_path(next_sec_first_lesson.course.title_url, next_sec_first_lesson.title_url)}\']")
        end
      end

      context "at the beginning of a course" do
        before do
          visit lesson_path(first_lesson.course.title_url, first_lesson.title_url)
        end
        it "should not show a backlink to the previous lesson" do 
          subject.should_not have_link("Previous")
        end
      end

      context "at the end of a course" do
        before do
          visit lesson_path(last_lesson.course.title_url, last_lesson.title_url)
        end

        it "should show the modified next button" do
          subject.should have_selector("button", :text => "View the Courses Index")
        end
      end
    end
  end
end