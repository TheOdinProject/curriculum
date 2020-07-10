require 'rails_helper'

RSpec.describe LessonStyles do
  subject { described_class.new(path) }

  let(:path) do
    '/TheOdinProject/curriculum/blob/28bb7681ed8a1a7b6933925a8d17c386e4b75cde/rails_programming/forms_and_authentication/form_basics.md'
  end

  describe '#render' do
    let(:markdown_converter) { instance_double(MarkdownConverter) }

    before do
      allow(Octokit).to receive(:contents)
        .with(
          'theodinproject/curriculum',
          path: 'rails_programming/forms_and_authentication/form_basics.md?ref=28bb7681ed8a1a7b6933925a8d17c386e4b75cde'
        ).and_return({ content: 'CONTENT FROM GITHUB' })

      allow(MarkdownConverter).to receive(:new).with("\b\xE3S\u0010\xD4\xC5D\xE3\u0006!1\xD4").and_return(markdown_converter)
      allow(markdown_converter).to receive(:as_html)
    end

    it "renders the markdown content in html" do
      subject.render
      expect(markdown_converter).to have_received(:as_html)
    end
  end

end
