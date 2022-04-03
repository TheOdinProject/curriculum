require 'rails_helper'
require 'rake'

describe ':curriculum' do
  before do
    Rake.application.rake_require 'tasks/curriculum'
    Rake::Task.define_task(:environment)
  end

  describe 'curriculum:update_content' do
    let!(:lesson) do
      FactoryBot.create(
        :lesson,
        url: '/README.md',
        content: nil,
      )
    end

    let(:curriculum_update_content) do
      Rake::Task['curriculum:update_content'].reenable

      VCR.use_cassette('lesson_content') do
        Rake.application.invoke_task 'curriculum:update_content'
      end
    end

    it 'updates the lesson with content' do
      curriculum_update_content
      expect(lesson.reload.content).not_to be_nil
    end
  end
end
