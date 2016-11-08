require 'rails_helper'

describe LessonsHelper do

  describe '#lesson_on_github' do
    it 'returns a url to the lesson on github' do
      expect(lesson_on_github('/web_development_101/jquery_basics.md')).
        to eql('https://github.com/TheOdinProject/curriculum/tree/master/web_development_101/jquery_basics.md')
    end
  end

  describe '#url_format' do
    it 'returns url with multiple words' do
      expect(url_format('What a Web Developer Does')).to eq 'What+a+Web+Developer+Does'
    end

    it 'returns url with one word' do
      expect(url_format('Conclusion')).to eq 'Conclusion'
    end

    it 'keeps punctuation in place' do
      expect(url_format('Why Study Code?')).to eq 'Why+Study+Code?'
    end
  end
end
