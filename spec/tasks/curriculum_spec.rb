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
  # HAVE NOT TRIED: intentionally saving one of the lesson.url's to an invalid URL so github returns
  #     a "file not found" type message.  Maybe somehow that lets a `nil` or "" sneak by our checks??????? doubtful.
  # ... it seems that no matter how we tweak the inputs, we can't get the task to save "" or nil to the database
  # SO.. now the scope of this story is changed: no longer is it about fixing a bug, it's just about writing
  # normal happy path / sad path tests for the rake task.  The cases above should be good guides for what to test.
  
  # Ideal code:
  # Runs the rake task, as soon as it hits a `nil` or "" trying to enter the DB, it'll blow up 
  # and give a status-so-far update
  # If it's successful, it should provide a happy status after finishing with details.
  # Right now, the code is basically doing that (though not as verbose as it could be, so spruce up the PUTS statements!)

  # Useful development tidbits (keep these around for later people who want to test out this stuff):
  # Base64 content line: "IyBSdWJ5IEJ1aWxkaW5nIEJsb2NrcwoKKkVzdGltYXRlZCBUaW1lOiA2LTgg"
  # Test github API line to curl (so you can see the response): 
  # $ curl https://api.github.com/repos/TheOdinProject/Curriculum/contents/ruby/building_blocks.md 
  # The structure of the returned object is a JSON object with, among others, a "content" attribute which is Base64
  # running the task (in production): $ heroku run --app theodinproject rake curriculum:update_content
  # running the task (in dev): # $ rake curriculum:update_content
  
  context 'for good response' do 
    let(:lesson_without_content) = FactoryGirl.create(:lesson, :url => "/test_lesson", :content => nil)
    before :each do
      # add a lesson with a github URL and `nil` content
    end
    
    it 'should add lesson content to the DB' do 
      pending 
      # run the rake task
      # give it fake happy lesson content back from fake Github
      # API call returns: { content: "IyBSdWJ5IEJ1aWxkaW5nIEJsb2NrcwoKKkVzdGltYXRlZCBUaW1lOiA2LTgg"}
      # should be happy
    end
  end
  
  context 'for empty lessons' do 
    let(:lesson_with_content) = FactoryGirl.create(:lesson, :url => "/test_lesson", :content => "some content")
    before :each do
      # add a lesson with a github URL and actual content
    end
    it 'should throw an exception' do 
      pending
      # run the rake task
      # give it fake empty lesson content back from fake Github
      # API call returns: { content: ""}
      # should be sad
    end
  end
  
  
end

# Double up the Github::repos.new so that it has a method .contents.get 
# that should return a stringified JSON object for that markdown file


