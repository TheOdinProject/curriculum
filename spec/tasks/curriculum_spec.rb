require 'spec_helper'
require 'rake'

describe 'curriculum task' do

  before :all do
    Rake.application.rake_require "tasks/curriculum"
    Rake::Task.define_task(:environment)

  end

  # Notes: 5:55pm 1/30/14 by ERIK TRAUTMAN:
  # We can't actually reproduce the bug with the content being saved as nil or blank ("")
  # Everything we tried got the rake task to throw an error, which is good because the real problem was that
  # it SILENTLY saved nil or blank content to the DB.  We can't reproduce the bug, so I'm willing to say
  # it may have been fixed by me before and I'm just being paranoid now.  We tried:
  # Tried modifying the Github API call to return nil, and the task throws an error which is good
  # Tried changing the response["content"] to be nil, and the task throws an error which is good
  # Tried changing the decoded_file to nil, error thrown
  # Tried changing the decoded_file to "", error thrown
  # Tried: intentionally saving one of the lesson.url's to an invalid URL so github returns
  #     a "file not found" type message.
  # ... it seems that no matter how we tweak the inputs, we can't get the task to save "" or nil to the database
  # SO.. now the scope of this story is changed: no longer is it about fixing a bug, it's just about writing
  # normal happy path / sad path tests for the rake task.  The cases above should be good guides for what to test.

  # Useful development tidbits (keep these around for later people who want to test out this stuff):
  # **************************************************************************************************
  # Base64 content line: "IyBSdWJ5IEJ1aWxkaW5nIEJsb2NrcwoKKkVzdGltYXRlZCBUaW1lOiA2LTgg"
  # Test github API line to curl (so you can see the response):
  # $ curl https://api.github.com/repos/TheOdinProject/Curriculum/contents/ruby/building_blocks.md
  # The structure of the returned object is a JSON object with, among others, a "content" attribute which is Base64
  # running the task (in production): $ heroku run --app theodinproject rake curriculum:update_content
  # running the task (in dev): # $ rake curriculum:update_content

  # Test to make sure that the task will actually save the lesson down.
  context 'for good response' do
    # add a lesson with a github URL and `nil` content
    let!(:lesson_without_content) { FactoryGirl.create(:lesson, :url => "/test_lesson", :content => nil) }

    before :each do
      # Set up a fake Github endpoint.  The Regex is needed so the URL is matched regardless of the API key used in the query string
      FakeWeb.register_uri( :get, %r|https://api.github.com/repos/theodinproject/curriculum/contents/test_lesson*|,
        :body => {:content => "IyBSdWJ5IEJ1aWxkaW5nIEJsb2NrcwoKKkVzdGltYXRlZCBUaW1lOiA2LTgg"}.to_json,
        :parameters => :any)
      # We actually have to re-enable the task before running it because otherwise it only runs once (for some reason)
      Rake::Task["curriculum:update_content"].reenable
      Rake.application.invoke_task "curriculum:update_content"
      lesson_without_content.reload
    end

    it 'should add lesson content to the DB' do
      expect(lesson_without_content.content).not_to be_nil
    end
  end

  context 'for empty lessons' do
    let!(:lesson_with_content) { FactoryGirl.create(:lesson, :url => "/test_lesson", :content => "some content") }
    before :each do
      # Set up a fake Github endpoint.  The Regex is needed so the URL is matched regardless of the API key used in the query string
      FakeWeb.register_uri( :get, %r|https://api.github.com/repos/theodinproject/curriculum/contents/test_lesson*|,
        :body => {:content => ""}.to_json,
        :parameters => :any)
      # We actually have to re-enable the task before running it because otherwise it only runs once (for some reason)
      Rake::Task["curriculum:update_content"].reenable
      #Rake.application.invoke_task "curriculum:update_content"
      #lesson_with_content.reload
    end
    it 'should throw an exception' do
      # Why we need to wrap the task in a lambda is beyond me.  It actually doesn't even work like in the example
      # at https://www.relishapp.com/rspec/rspec-expectations/v/2-6/docs/built-in-matchers/raise-error-matcher
      # where you're supposed to be able to say expect { raise StandardError }.to raise_error
      expect(lambda{ Rake.application.invoke_task "curriculum:update_content" }).to raise_error(NoMethodError)
    end
  end


end

# Double up the Github::repos.new so that it has a method .contents.get
# that should return a stringified JSON object for that markdown file
