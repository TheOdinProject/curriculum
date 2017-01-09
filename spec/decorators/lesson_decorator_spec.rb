require 'rails_helper'

RSpec.describe LessonDecorator do
  subject(:lesson_decorator) { LessonDecorator.new(lesson) }

  let(:lesson) { double('Lesson', url: url, title: title ) }
  let(:url) { '/web_development_101/jquery_basics.md' }
  let(:title) { 'What a Web Developer Does' }

  describe '#github_url' do
    let(:root) { 'https://github.com/TheOdinProject/curriculum/tree/master' }


    it 'returns a url to the lesson on github' do
      expect(lesson_decorator.github_url).to eql(root + url)
    end
  end

  describe '#title_url_format' do
    it 'returns url with multiple words' do
      expect(lesson_decorator.title_url_format).to eq 'What+a+Web+Developer+Does'
    end
  end
end
