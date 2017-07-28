require 'rails_helper'

RSpec.describe LessonDecorator do
  subject(:lesson_decorator) { LessonDecorator.new(lesson) }

  let(:lesson) { double('Lesson', url: lesson_url) }
  let(:lesson_url) { '/web_development_101/jquery_basics.md' }

  describe '#github_url' do
    let(:root) { 'https://github.com/TheOdinProject/curriculum/tree/master' }

    it 'returns a url to the lesson on github' do
      expect(lesson_decorator.github_url).to eql(root + lesson_url)
    end
  end
end
