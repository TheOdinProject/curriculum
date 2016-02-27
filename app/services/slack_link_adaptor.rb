class SlackLinkAdaptor

  attr_reader :course

  def initialize(course)
    @course = course
  end

  def adapt
    base_slack_url + url_finder.fetch(@course.title, fallback)
  end

  private

  def url_finder
    {
      'Introduction to Web Development'   => '/1-intro-to-web-dev/',
      'Web Development 101'               => '/2-web-dev-101',
      'Ruby Programming'                  => '/3-ruby/',
      'Ruby on Rails'                      => '/4-rails/',
      'HTML5 and CSS3'                    => '/5-html-css/',
      'Javascript and jQuery'             => '/6-javascript/',
      'Getting Hired as a Web Developer'  => '/7-getting-hired/'

    }
  end

  def base_slack_url
    'https://theodinproject.slack.com/messages'
  end

  def fallback
    '/general/'
  end
end