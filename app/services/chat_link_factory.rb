class ChatLinkFactory

  attr_reader :course

  def initialize(course)
    @course = course
  end

  def build
    base_chat_url + url_finder.fetch(course.title, fallback)
  end

  private

  def url_finder
    {
      'Introduction to Web Development'   => 'Introduction-to-web-development',
      'Web Development 101'               => 'Web-development-101',
      'Ruby Programming'                  => 'Ruby',
      'Ruby on Rails'                     => 'Rails',
      'HTML5 and CSS3'                    => 'HTML-CSS',
      'Javascript and jQuery'             => 'Javascript',
      'Getting Hired as a Web Developer'  => 'Getting-hired'
    }
  end

  def base_chat_url
    'https://gitter.im/TheOdinProject/'
  end

  def fallback
    'theodinproject'
  end
end
