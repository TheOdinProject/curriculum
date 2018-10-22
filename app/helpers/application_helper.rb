module ApplicationHelper
  require 'kramdown'

  def chat_link
    'https://gitter.im/TheOdinProject/theodinproject'
  end

  def github_link(extension='')
    "https://github.com/TheOdinProject/#{extension}"
  end

  def forum_link
    'https://forum.theodinproject.com'
  end

  def title(input=nil)
    if input
      content_for(:title) { input + ' | The Odin Project' }
    end
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes.fetch(flash_type, custom_flash(flash_type))
  end

  def active_class(path)
    'active' if current_page?(path)
  end

  def first_four_success_stories
    SuccessStory.limit(4)
  end

  def faq_items
    [
      {
        question: 'Who is The Odin Project for?',
        answer:
          "<p>The Odin Project is for absolute beginners and those who have tried other resources without success.  In reality, The Odin Project is for anyone who wants to work as a web developer, do freelancing work, build a startup, or just hack together a homepage for yourself.  All the tools you need are here.</p>
          <br />
          <p>We’ve built an in-depth curriculum designed to take you 100% of the way to becoming a web developer. Many other resources out there teach you just the basics of programming.  With The Odin Project you’ll create your own websites, games, and social media sites.</p>
          <br />
          <p>The curriculum has also been designed in a modular fashion, making skimming through lessons a breeze.</p>"
      },
      {
        question: 'What is the goal of the The Odin Project?',
        answer:
          '<p>The goal of The Odin Project is to provide a complete path for students to go from zero to employed as web developers while working with other students along the way.</p>'
      },
      {
        question: 'How long does The Odin Project take?',
        answer:
          "<p>We won't have any of this 'Learn it all in two days!' BS.  You can't start from scratch and learn true web development in such a short period of time and you know it.  It's highly unlikely that you'll be employable after a weekend workshop or a one-month part-time course.</p>
          <br />
          <p>On the other hand, you don't necessarily need to put in 4 years getting a CS degree.  80% of what they cover won't be used during a typical web developer's early career and it's not necessary to get hired.  So why not learn the 20% and learn the rest while you're getting paid on the job?</p>
          <br />
          <p>We've essentially distilled down what you most need to learn to hit that employable level, but it's still a healthy dose of learning.  Depending how fast you learn, it will take roughly 1000 hours of work to hit that sweet spot.  If you're naturally more technical or come from a technical background, it may be a bit faster.  If you're less technical or brand new to all this, it will take longer.  Don't despair!  When you think about it, that's pretty much the same learning curve you had to climb to learn anything worthwhile so far in life.</p>"
      },
      {
        question: 'What technologies does The Odin Project teach?',
        answer:
          "<p>The <a href='courses/web-development-101'>Web Development 101 course</a> will give you a chance to explore several of the languages and technologies you’ll need to know on your journey to becoming a web developer.  Web Development 101 introduces HTML, CSS, Javascript, Ruby, Rails, Git, databases and more. We’ve also created mini-projects that give you a chance to test your new knowledge by building your own applications and websites!</p>
          <br />
          <p>The Odin Project takes a back-to-front approach to learning Ruby on Rails.  We start with a <a href='courses/ruby-programming'>strong foundation in Ruby</a> and an understanding of databases before migrating into <a href='courses/ruby-on-rails'>Ruby on Rails</a> (which is a framework built using Ruby).</p>
          <br />
          <p>The Odin Project then delves deep into <a href='courses/html5-and-css3'>HTML and CSS</a>, along with <a href='courses/javascript-and-jquery'>Javascript, JQuery and Backbone</a> to give you all the tools necessary to make websites flow, load quickly, and look great.  Along the way you’ll learn Git and deployment so you can build your own portfolio, collaborate with others, and see your work on the web.</p>
          <br />
          <p>Finally, The Odin Project will teach you to work with legacy codebases and open-source projects. We’ll also cover areas specifically intended to help when you’re <a href='courses/getting-hired'>looking for employment</a>.</p>"
      },
      {
        question: 'How is The Odin Project different from other programs?',
        answer:
          "<p>The Odin Project is different from other online programs in that it pulls the best resources from around the web and compiles them to create a complete curriculum.  In many other programs the material is formatted to meet their specific curriculum.  This means that not all of the lessons are top-notch. The Odin Project sidesteps this downfall by pulling various free resources from around the web and compiles them in one place.</p>
          <br />
          <p>The Odin Project also develops your problem solving skills when it requires you to install programs on your local computer.  As developers, programming errors frequently arise and knowing how to decipher error messages is critical.  These problem solving skills are frequently ignored by other programs.</p>
          <br />
          <p>Lastly, The Odin Project is project based.  Other programs require you to simply input the correct answer. It is difficult to retain any knowledge by learning the bare minimum syntax. The Odin Project is designed with projects built from the ground up giving you real-world experience that you can use to build your portfolio and get hired as a web developer!</p>"
      },
      {
        question: 'Why Ruby on Rails?',
        answer:
          "<p>There are dozens of frameworks and technology stacks to choose from and, frankly, they do pretty much the same thing. Ruby on Rails is attractive because it’s straightforward and well documented.  It’s also used by many tech companies and has a strong community of developers who support it.</p>
          <br />
          <p>Ruby on Rails lets you deploy a functioning website in hours instead of weeks.  Rails also provides a great platform to build the skills you need to carry you to the next phase.</p>"
      },
      {
        question: 'Who is "Odin"?',
        answer:
          "<p>Odin is a figure from Norse mythology, the allfather of the gods. He is portrayed as powerful and fickle (as they often are) but also wise and cunning. His search for knowledge is a thing of legends - he <a href='http://norse-mythology.org/tales/why-odin-is-one-eyed'>gave his eye for the wisdom of ages</a> and hung from the world tree, pierced by his own spear, for nine days and nights to <a href='http://norse-mythology.org/tales/odins-discovery-of-the-runes/'>gain the knowledge of runes</a>.</p>
          <br />
          <p>Learning web development is not an easy task and the tools laid out here are merely the path; you must walk it yourself. Should you possess a thirst for knowledge and persistence of spirit akin to that storied in Odin's mythos, you will find success on your journey.</p>"
      },
      {
        question: 'Where do I sign up?',
        answer:
          "<p>You don’t have to!  Dive right in, the content is free and available.  It’d be best if you started at the beginning and went through in order but everyone’s goals are different so we made the full curriculum available if you want to cherry-pick lessons or projects.</p>
          <br />
          <p>However, by <a href='/sign_up'>signing up</a> you are able to check off completed projects and lessons, easily keeping track of your progress.  We don't collect any user data and keep emails to a minimum.</p>"
      },
      {
        question: 'Is The Odin Project free?',
        answer:
          '<p>Yes! The Odin Project is an open-source project created and maintained by hard working volunteers. To find out how you can help us, please visit our how to <a href="/contributing">contribute page</a>.</p>'
      },
      {
        question: 'Will I get a certificate on completion of the course?',
        answer:
          '<p>We don\'t provide a certificate for course completion. Employers will be much more impressed with your amazing personal portfolio of projects, many of which you\'ll hopefully have built with inspiration from The Odin Project.</p>'
      },
      {
        question: 'Do you have a Code of Conduct?',
        answer:
          "Yes!  While interacting with other Odinites you agree to the following:<br />" + Kramdown::Document.new(File.read('doc/code_of_conduct.md')).to_html
        },
      {
        question: 'Can I use this curriculum to teach?',
        answer:
          "<p>The Odin Project is licensed under two pieces: the curriculum and the main website.  The main website is a fully open-source project <a href='https://github.com/TheOdinProject/theodinproject/blob/master/license.txt'>under an MIT license</a>, so you can use the code for whatever you want.  The curriculum is currently licensed under a <a href='https://github.com/TheOdinProject/curriculum/blob/master/license.md'>Creative Commons license</a> which restricts it to noncommercial use without prior authorization.</p>
          <br />
          <p>This means you can use The Odin Project’s curriculum to teach at your club, meetup, or with your friends (In fact, we’d love it if you did that and told us how it went!). You can’t, however, use it to start a bootcamp without having a conversation first.  Please reach out with any questions to <a href='mailto: contact@theodinproject.com'>contact@theodinproject.com</a></p>"
      },
      {
        question: 'How can I get in touch?',
        answer:
        "<p>If you have questions about The Odin Project itself, feel free to <a href='mailto:contact@theodinproject.com'>contact us</a>.  There is also a friendly Odin community in our <a href='https://gitter.im/TheOdinProject/theodinproject'>Gitter chat rooms</a></p>"
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
        description: 'You’re not alone. Learn and get help from our friendly community of beginner and experienced developers.'
      }
    ]
  end

  def available_courses
    [
      {
        badge_image_url: 'badge-html-css.svg',
        badge_alt_text: 'html css badge',
        title: 'HTML + CSS'
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

  def sign_in_or_view_curriculum_button
    if current_user
      curriculum_button
    else
      signup_button
    end
  end

  def percentage_completed_by_user(course, user)
    user.progress_for(course).percentage
  end

  def course_started_by_user?(course, user)
    user.progress_for(course).started?
  end

  def course_completed_by_user?(course, user)
    user.progress_for(course).completed?
  end

  def next_lesson_to_complete(course, completed_lessons)
    NextLesson.new(course, completed_lessons).to_complete
  end

  def modifier_for_badge(course, user)
    if course_completed_by_user?(course, user)
      'progress-circle--completed'
    else
      'progress-circle--show-progress'
    end
  end

  private

  def custom_flash(flash_type)
    "alert-#{flash_type}"
  end

  def bootstrap_classes
    { 'notice' => 'alert-success', 'alert' => 'alert-danger' }
  end

  def medium_blog_path
    'https://medium.com/the-odin-project'
  end
end
