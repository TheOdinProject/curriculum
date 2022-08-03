module Kramdown
  class ContentSection
    HEADER_LINE = 1
    HEADER_AND_NEWLINE = 2

    attr_reader :title, :header_location

    def initialize(title:, header_location: nil, content: nil)
      @title = title
      @header_location = header_location
      @content = content
    end

    def content
      "<section id='#{title.parameterize}' markdown='1'>#{formatted_content}</section>"
    end

    def start
      return if header_location.nil?

      header_location - HEADER_LINE
    end

    def end_of_previous_section
      return if header_location.nil?

      header_location - HEADER_AND_NEWLINE
    end

    def start_of_document?
      start.zero?
    end

    private

    def formatted_content
      return @content if @content.ends_with?("\n")

      "#{@content}\n"
    end
  end
end
