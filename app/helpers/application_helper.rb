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
        question: 'Who Is TheOdinProject For?', answer: '<p>This course is geared to absolute beginners and people who have maybe tried out different resources along the way but never really found anything worth sticking with long enough to become an expert in it.  Whether your ultimate goal is to work as a web developer, do freelancing, build a startup, or just hack together a homepage for yourself, you\'ll have the tools you need here. </p><p> We\'ve built the curriculum with the most difficult of these cases in mind so it goes into a lot of depth.  This is on purpose -- a lot of existing "complete" resources actually only get you 10% of the way there and that\'s a problem.  They just aren\'t thorough.  That said, anyone who doesn\'t want to get quite so deep will have no problem skimming through lessons to pick up what they need to. </p>'
      },
      {
        question: 'What\'s the Goal of the Project?', answer: '<p>The goal is to provide a complete path for students to go from zero to employed as web developers while working with other students along the way.  And that\'s just the beginning.</p>'
      },
      {
        question: 'How Long Does it Take?', answer: '<p>We won\'t have any of this "Learn it all in two days!" BS.  You can\'t start from scratch and learn true web development in such a short period of time and you know it.  It\'s *highly* unlikely that you\'ll be employable after a weekend workshop or a one-month part-time course.</p><p>On the other hand, you don\'t necessarily need to put in 4 years getting a CS degree. 80% of what they cover won\'t be used during a typical web developer\'s early career and it\'s not necessary to know it to get hired. So why not learn the 20% and learn the rest while you\'re getting paid on the job?</p><p>We\'ve essentially distilled down what you most need to learn to hit that employable level, but it\'s still a healthy dose of learning. Depending how fast you are, it will still take roughly 1000 hours of work to hit that sweet spot. If you\'re naturally more technical or come from a technical background, it may be a bit faster. If you\'re less technical or brand new to all this, it will take longer. Don\'t despair! When you think about it, that\'s pretty much the same learning curve you had to climb to learn anything worthwhile so far in life.</p><p>If you\'re doing it 40 hours a week, that\'s about 6 months.  If you\'re super intense, you can do it in 3.  If you\'re part-timing or less, you\'ll need to space it out over about a year.  That\'s just the reality of it.</p><p>To make the best use of your time, try to set aside long blocks at once.  It can be difficult to find the time in your life, but you are significantly more productive when you can "get in the zone" and flow, which typically means setting aside 4-6 hours at a time, especially when building the projects.  You lose a significant portion of your efficiency if you try to do all your work in tiny chunks, where most of that time is spent just getting back in the right mindset.</p>'
      },
      {
        question: 'What Are You Actually Teaching?', answer: '<p>We assume that you\'re at square one, so we start out by going over what exactly a web developer does <a href="/courses/introduction-to-web-development">Introduction to Web Development</a>.</p><p>The <a href="/courses/web-development-101">Web Development 101 course</a> will give you a chance to explore several of the languages and technologies you\'ll need to know on your journey so you have a good sense of context when you push forward into the real meaty stuff. It gives you a taste of HTML, CSS, Javascript, Ruby, Rails, databases, Git, testing and more. We\'ve also created "mini-projects" that will give you a chance to test your new knowledge by actually building something (ideally with another student!).</p><p>The curriculum takes a back-to-front approach to learning a Ruby on Rails workflow. That means starting with a <a href="/courses/ruby-programming">strong foundation in Ruby</a> and an understanding of databases before migrating into Ruby on Rails (which is a framework built using Ruby).</p><p>Next we move into in-depth understanding of HTML and CSS, Javascript, JQuery, and Backbone to give you the tools necessary to make them come alive by looking good, flowing well, and loading quickly. Along the way, you\'ll learn Git and deployment so you can build your portfolio, collaborate with others, and see your work on the web.</p><p>Finally, we\'ll tackle more substantial project work and learn how to deal with legacy codebases and open-source projects. We\'ll also do some topical deep dives and cover areas specifically intended to help you when you\'re looking for jobs. Most of the back end of the curriculum is still under construction, so let us know if you\'d like to help!</p>'
      },
      {
        question: 'Why Ruby on Rails?', answer: '<p>Why not? There are dozens of possible frameworks and technology stacks out there to choose from and, frankly, they do pretty much the same things. Rails is attractive because it\'s a relatively straightforward and very well documented framework that\'s used by tons of great startups and tech companies today and it has a very strong community of developers and students who support it.</p><p>Rails lets you put up a functioning website in hours not days or weeks. The "in" tech will probably be something completely different in a few years, but Rails presents a great platform on which to build the skills you need to carry you to that next phase.</p>'
      },
      {
        question: 'Who is "Odin"?', answer: '<p>Odin is a figure from Norse mythology, the allfather of the gods. He is portrayed as powerful and fickle (as they often are) but also wise and cunning. His search for knowledge is a thing of legends -- he <a href="http://norse-mythology.org/tales/why-odin-is-one-eyed/">gave his eye for the wisdom of ages</a> and hung from the world tree, pierced by his own spear, for nine days and nights to<a href="http://norse-mythology.org/tales/odins-discovery-of-the-runes/"> gain the knowledge of runes</a>.</p><p>Learning development is not an easy task and the tools laid out here are merely the path; you must walk it yourself. Should you possess a thirst for knowledge and persistence of spirit akin to that storied in Odin\'s mythos, you will find success on your journey.</p>'
      },
      {
        question: 'Where do I sign up for a course?', answer: '<p>You don\'t have to!  Just dive right in, the content is free and available.  It\'d be best if you started from the beginning and went through in order, but everyone\'s goals are different so we made the full curriculum available if you want to cherry-pick lessons or projects. That\'s not to say we will never have any sort of signup program (though if we do the core content here will remain free).  But right now what you see is what you get.</p>'
      },
      {
        question: 'But when do I have to pay for stuff?', answer: '<p>The only payment we ask for is your time when you can afford it. Give back to the Odin community by offering up your new found knowledge to those just starting out or put your skills to use and work on a new feature for the site, which will also give you great insight into working on an open source project as large as Odin. How cool is that?</p>'
      },
      {
        question: 'How is the project funded?', answer: '<p>Goodwill and infinite patience.  Seriously, if you want to help, please <a href="/contact">reach out</a>.</p>'
      },
      {
        question: "But how will you become sustainable?', answer: '<p>Cloning! But until the science is perfected we'll keep our current model of getting users involved.</p>"
      },
      {
        question: 'Can I use this curriculum to teach?', answer: '<p>This project is in two pieces -- the Curriculum and the Main Website which pulls it in. The Main Website is a fully open-source project <a href="https://github.com/TheOdinProject/theodinproject/blob/master/license.txt">under an MIT license, so you can use any code you see there for whatever you want.</a> The curriculum is currently licensed under a <a href="https://github.com/TheOdinProject/curriculum/blob/master/license.md">Creative Commons license</a> that restricts it to noncommercial use without prior authorization.</p><p>That means you can use it to teach at your club, at your meetup, or with your friends.  In fact, we\'d love it if you did that (and told us how it went!).  But you can\'t go out and use it to start a bootcamp without having a conversation first.  We\'re friendly and believe in widespread education -- reach out with any questions to <a href="mailto: contact@theodinproject.com">contact@theodinproject.com</a>.</p>'
      },
      {
        question: 'How can I get in touch?', answer: '<p>If you have questions about The Odin Project itself, check out our <a href="/contact">Contact Page</a>.</p>'
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
