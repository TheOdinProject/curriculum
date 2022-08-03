require 'rails_helper'

require './lib/kramdown/document_sections'

RSpec.describe Kramdown::DocumentSections do
  describe '#all_sections' do
    context "when content has sectionable headings(h3's)" do
      let(:markdown) do
        <<~MARKDOWN
          ### First header
          Test first header

          ### Second header
          Test second header
            ### nested header

          ### Third header
          Test third header
        MARKDOWN
      end

      it 'creates a section for each heading' do
        expect(described_class.new(markdown).all_sections.map(&:title)).to contain_exactly(
          'first-header', 'second-header', 'third-header'
        )
      end

      it 'creates sections that contain the source content' do
        result = <<~SECTIONS.strip
          <section id='first-header' markdown='1'>### First header
          Test first header

          </section><section id='second-header' markdown='1'>### Second header
          Test second header
            ### nested header

          </section><section id='third-header' markdown='1'>### Third header
          Test third header
          </section>
        SECTIONS

        expect(described_class.new(markdown).all_sections.map(&:content).join).to eq(result)
      end
    end

    context "when document starts with headings that can't be turned into sections" do
      it 'creates a generic section for the beginning content in the document' do
        markdown = <<~MARKDOWN
          # First header
          Test first header

          ### Second header
          Test second header

          # Third header
          Test third header
        MARKDOWN

        expect(described_class.new(markdown).all_sections.map(&:title)).to contain_exactly(
          'content', 'second-header'
        )
      end
    end

    context "when markdown does not contain any sectionable headings(h3's)" do
      it 'returns nothing' do
        markdown = <<~MARKDOWN
          # First header
          Test first header

          # Second header
          Test second header

          # Third header
          Test third header
        MARKDOWN

        expect(described_class.new(markdown).all_sections).to eq([])
      end
    end
  end
end
