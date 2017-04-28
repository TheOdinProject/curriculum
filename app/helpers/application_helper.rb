module ApplicationHelper
  def chat_link
    'https://gitter.im/TheOdinProject/theodinproject'
  end

  def github_link(extension='')
    "https://github.com/TheOdinProject/#{extension}"
  end

  def title(input = nil)
    if input
      content_for(:title) { input + ' | The Odin Project' }
    end
  end

  def convert_markdown_to_html(markdown)
    MarkdownConverter.new(markdown).as_html
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes.fetch(flash_type, custom_flash(flash_type))
  end

  def faq_items
    [
      {
        question: 'Who Is TheOdinProject For?',
        answer: <<~HERE
          <p>The Odin Project is for absolute beginners and those who have tried other resources without success.  In reality, The Odin Project is for anyone who wants to work as a web developer, do freelancing work, build a startup, or just hack together a homepage for yourself.  All the tools you need are here.</p>
          <p>We’ve built an in-depth curriculum designed to take you 100% of the way to becoming a web developer. Many other resources out there teach you just the basics of programming.  With The Odin Project you’ll create your own websites, games, and social media sites.</p>
          <p>The curriculum has also been designed in a modular fashion, making skimming through lessons a breeze.</p>
        HERE
      },
      {
        question: 'What\'s the Goal of the Project?',
        answer: "<p>The goal of The Odin Project is to provide a complete path for students to go from zero to employed as web developers while working with other students along the way.</p>"
      },
      {
        question: 'How Long Does it Take?',
        answer: <<~HERE
          <p>We won't have any of this "Learn it all in two days!" BS.  You can't start from scratch and learn true web development in such a short period of time and you know it.  It's highly unlikely that you'll be employable after a weekend workshop or a one-month part-time course.</p>
          <p>On the other hand, you don't necessarily need to put in 4 years getting a CS degree.  80% of what they cover won't be used during a typical web developer's early career and it's not necessary to get hired.  So why not learn the 20% and learn the rest while you're getting paid on the job?</p>
          <p>We've essentially distilled down what you most need to learn to hit that employable level, but it's still a healthy dose of learning.  Depending how fast you learn, it will take roughly 1000 hours of work to hit that sweet spot.  If you're naturally more technical or come from a technical background, it may be a bit faster.  If you're less technical or brand new to all this, it will take longer.  Don't despair!  When you think about it, that's pretty much the same learning curve you had to climb to learn anything worthwhile so far in life.</p>
        HERE
      },
      {
        question: 'What Are You Actually Teaching?',
        answer: <<~HERE
          <p>The Odin Project assumes you’re new to web development, so we start out by going over what exactly a web developer does in our <a href="https://www.theodinproject.com/courses/introduction-to-web-development">Introduction to Web Development</a> course.</p>
          <p>The <a href="https://www.theodinproject.com/courses/web-development-101">Web Development 101 course</a> will give you a chance to explore several of the languages and technologies you’ll need to know on your journey to becoming a web developer.  Web Development 101 introduces HTML, CSS, Javascript, Ruby, Rails, Git, databases and more. We’ve also created mini-projects that give you a chance to test your new knowledge by building your own applications and websites!</p>
          <p>The Odin Project takes a back-to-front approach to learning Ruby on Rails.  We start with a <a href="https://www.theodinproject.com/courses/ruby-programming">strong foundation in Ruby</a> and an understanding of databases before migrating into <a href="https://www.theodinproject.com/courses/ruby-on-rails">Ruby on Rails (which is a framework built using Ruby).</p>
          <p>The Odin Project then takes you deep into <a href="https://www.theodinproject.com/courses/html5-and-css3">HTML and CSS</a>, along with <a href="https://www.theodinproject.com/courses/javascript-and-jquery">Javascript and JQuery</a> to give you all the tools necessary to make websites flow, load quickly, and look great.  Along the way you’ll learn Git and deployment so you can build your own portfolio, collaborate with others, and see your work on the web.</p>
          <p>Finally, The Odin Project will teach you to work with legacy codebases and open-source projects. We’ll also cover areas specifically intended to help when you’re <a href="https://www.theodinproject.com/courses/getting-hired-as-a-web-developer">looking for employment</a>.</p>
        HERE
      },
      {
        question: 'Why Ruby on Rails?',
        answer: <<~HERE
          <p>There are dozens of frameworks and technology stacks to choose from and, frankly, they do pretty much the same thing. Ruby on Rails is attractive because it’s straightforward and well documented.  It’s also used by many tech companies and has a strong community of developers who support it.</p>
          <p>Rails lets you deploy a functioning website in hours instead of weeks.  Rails also provides a great platform to build the skills you need to carry you to the next phase.</p>
        HERE
      },
      {
        question: 'Who is "Odin"?',
        answer: <<~HERE
          <p>Odin is a figure from Norse mythology, the allfather of the gods. He is portrayed as powerful and fickle (as they often are) but also wise and cunning. His search for knowledge is a thing of legends - he <a href="http://norse-mythology.org/tales/why-odin-is-one-eyed/">gave his eye for the wisdom of ages</a> and hung from the world tree, pierced by his own spear, for nine days and nights to <a href="http://norse-mythology.org/tales/odins-discovery-of-the-runes/">gain the knowledge of runes</a></p>
          <p>Learning development is not an easy task and the tools laid out here are merely the path; you must walk it yourself. Should you possess a thirst for knowledge and persistence of spirit akin to that storied in Odin's mythos, you will find success on your journey.</p>
        HERE
      },
      {
        question: 'Where do I sign up for a course?',
        answer: <<~HERE
          <p>You don’t have to!  Dive right in, the content is free and available.  It’d be best if you started at the beginning and went through in order but everyone’s goals are different so we made the full curriculum available if you want to cherry-pick lessons or projects.</p>
          <p>However, by <a href="https://www.theodinproject.com/users/sign_up">signing up</a> you are able to check off completed projects and lessons, easily keeping track of your progress.  We don't collect any user data and keep emails to a minimum.</p>
        HERE
      },
      {
        question: 'But when do I have to pay for stuff?',
        answer: '<p>The only payment we ask for is your time when you can afford it. Give back to the Odin community by offering up your new found knowledge to those just starting out or put your skills to use and work on a new feature for the site, which will also give you great insight into working on an open source project as large as Odin. How cool is that?</p>'
      },
      {
        question: 'How is the project funded?',
        answer: '<p>Goodwill and infinite patience.  Seriously, if you want to help, please <a href="/contact">reach out</a>.</p>'
      },
      {
        question: "But how will you become sustainable?",
        answer: "<p>Cloning! But until the science is perfected we'll keep our current model of getting users involved.</p>"
      },
      {
        question: 'Can I use this curriculum to teach?',
        answer: <<~HERE
          <p>The Odin Project is licensed under two pieces: the curriculum and the main website.  The main website is a fully open-source project <a href="https://github.com/TheOdinProject/theodinproject/blob/master/license.txt">under an MIT license</a>, so you can use the code for whatever you want.  The curriculum is currently licensed under a <a href="https://github.com/TheOdinProject/curriculum/blob/master/license.md">Creative Commons license</a> which restricts it to noncommercial use without prior authorization.</p>
          <p>This means you can use The Odin Project’s curriculum to teach at your club, meetup, or with your friends (In fact, we’d love it if you did that and told us how it went!). You can’t, however, use it to start a bootcamp without having a conversation first.  Please reach out with any questions to <a href="mailto: contact@theodinproject.com">contact@theodinproject.com</a></p>
        HERE
      },
      {
        question: 'How can I get in touch?',
        answer: "<p>If you have questions about The Odin Project itself please use our <a href='https://gitter.im/TheOdinProject/theodinproject'>chat rooms on gitter</a></p>"
      }
    ]
  end

  def how_it_works_tiles
    [
      {
        image: 'img-learn.svg',
        subtitle: 'Learn',
        description: 'Learn from a curriculum with the best curated online tutorials, blogs, and courses.'
      },
      {
        image: 'img-build.svg',
        subtitle: 'Build',
        description: 'Build dozens of portfolio-worthy projects along the way, from simple scripts to full programs and deployed websites.'
      },
      {
        image: 'img-connect.svg',
        subtitle: 'Connect',
        description: 'You’re not alone. Learn together by pairing up on projects with other students.'
      }
    ]
  end

  def courses
    [
      {
        badge_image_url: 'badge-html-css.svg',
        badge_alt_text: 'html css badge',
        title: 'HTML + CSS3'
      },
      {
        badge_image_url: 'badge-javascript.svg',
        badge_alt_text: 'javascript badge',
        title: 'JavaScript'
      },
      { badge_image_url: 'badge-git.svg',
        badge_alt_text: 'git badge',
        title: 'Git'
      },
      { badge_image_url: 'badge-database.svg',
        badge_alt_text: 'databases badge',
        title: 'Databases'
      },
      { badge_image_url: 'badge-ruby.svg',
        badge_alt_text: 'ruby badge',
        title: 'Ruby'
      },
      { badge_image_url: 'badge-ruby-on-rails.svg',
        badge_alt_text: 'ruby on rails badge',
        title: 'Ruby on Rails'
      },
      { badge_image_url: 'badge-getting-hired.svg',
        badge_alt_text: 'getting hired badge',
        title: 'Getting Hired'
      }
    ]
  end

  private

  def custom_flash(flash_type)
    "alert-#{flash_type}"
  end

  def bootstrap_classes
    { 'notice' => 'alert-success', 'alert' => 'alert-error' }
  end

   def medium_blog_path
    'https://medium.com/the-odin-project'
  end
end
