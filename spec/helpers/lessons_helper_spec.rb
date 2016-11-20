require 'rails_helper'

RSpec.describe LessonsHelper do
  describe '#lesson_on_github' do
    let(:root) { 'https://github.com/TheOdinProject/curriculum/tree/master' }
    let(:lesson_url) { '/web_development_101/jquery_basics.md' }

    it 'returns a url to the lesson on github' do
      expect(lesson_on_github(lesson_url)).to eql(root + lesson_url)
    end
  end

  describe '#url_format' do
    it 'returns url with multiple words' do
      expect(url_format('What a Web Developer Does'))
        .to eq 'What+a+Web+Developer+Does'
    end

    it 'returns url with one word' do
      expect(url_format('Conclusion')).to eq 'Conclusion'
    end

    it 'keeps punctuation in place' do
      expect(url_format('Why Study Code?')).to eq 'Why+Study+Code?'
    end
  end
end
