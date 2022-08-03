require 'rails_helper'

require './lib/kramdown/content_section'

RSpec.describe Kramdown::ContentSection do
  describe '#content' do
    it 'returns content for the section' do
      section = described_class.new(title: 'section title', content: "some markdown\n")

      expect(section.content).to eq(
        "<section id='section-title' markdown='1'>some markdown\n</section>"
      )
    end

    context 'when section content does not end with a newline' do
      it 'adds a newline to the end of the content' do
        section = described_class.new(title: 'section title', content: 'some markdown')

        expect(section.content).to eq(
          "<section id='section-title' markdown='1'>some markdown\n</section>"
        )
      end
    end
  end

  describe '#start' do
    it 'returns start location of the section' do
      expect(described_class.new(title: 'New Section', header_location: 1).start).to eq(0)
    end

    context 'when there is not header location' do
      it 'returns nil' do
        expect(described_class.new(title: 'Section').start).to be_nil
      end
    end
  end

  describe '#end_of_previous_section' do
    it 'returns end location of the previous section' do
      expect(described_class.new(title: 'Section', header_location: 10)
        .end_of_previous_section).to eq(8)
    end

    context 'when there is not header location' do
      it 'returns nil' do
        expect(described_class.new(title: 'Section').end_of_previous_section).to be_nil
      end
    end
  end

  describe '#start_of_document?' do
    subject(:section) { described_class.new(title: 'Section', header_location: location) }

    context 'when section is at the start of the document' do
      let(:location) { 1 }

      it { is_expected.to be_start_of_document }
    end

    context 'when section is not at the start of document' do
      let(:location) { 10 }

      it { is_expected.not_to be_start_of_document }
    end
  end
end
