require 'spec_helper'

describe LessonsHelper do
  
  describe "url_format" do

    it "converts title with multiple words" do
      expect(url_format("What a Web Developer Does")).to eq "What+a+Web+Developer+Does"
    end

    it "doesn't change a title with one word" do
      expect(url_format("Conclusion")).to eq "Conclusion"
    end

    it "keeps punctuation in place" do
      expect(url_format("Why Study Code?")).to eq "Why+Study+Code?"
    end

  end

end