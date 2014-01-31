require 'spec_helper'
require 'rake'

describe 'curriculum task' do
  
  before :all do
    Rake.application.rake_require "tasks/curriculum"
    Rake::Task.define_task(:environment)
  
  end
  
  context 'for good response' do :pending 
    before :each do
      # add a lesson with a github URL and `nil` content
      
    end
    
    it 'should add lesson content to the DB' do
      # run the rake task
      # give it fake happy lesson content back from fake Github
      # should be happy
    end
  end
  
  context 'for empty lessons' do :pending
    before :each do
      # add a lesson with a github URL and actual content
    end
    it 'should throw an exception' do
      # run the rake task
      # give it fake empty lesson content back from fake Github
      # should be sad
    end
  end
  
  
end

# Double up the Github::repos.new so that it has a method .contents.get 
# that should return a stringified JSON object for that markdown file

# preconditions:
# we'll need to create a lesson

# $ heroku run --app theodinproject rake curriculum:update_content