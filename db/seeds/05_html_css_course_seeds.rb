# ************************************************
# CREATE HTML5/CSS3 COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: HTML/CSS *****"

# Set Course and section position here. Update file name appropriately.
course_position = 5
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'HTML and CSS',
  description: "Good web design doesn't happen by accident. This course takes a deeper look at front-end design and development, expanding on what is covered in Foundations. You'll learn how to design and develop websites that look great in any device and you'll be equipped to deeply understand and create your own responsive design framework!",
  position: course_position,
  identifier_uuid: '9f2e358a-50ad-42ea-8f64-8d1e613d74ce',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Basic HTML Page Structure',
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll cover the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a page.",
  identifier_uuid: 'dc04b57f-9e90-43f7-b8f4-a6598e10ea90',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How This Course Will Work',
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/introduction.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'HTML Basics',
  description: 'A brief refresher on the very basics of HTML.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/html5_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Linking Internal and External Pages',
  description: 'When do you link to the relative URL versus the absolute?  How do you set up internal links?',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/links.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Working with Images, Video and Other Media',
  description: "Rich media experiences make your pages come alive but there are some things you'll need to know to avoid slow load times.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/images.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Embedding Images and Video',
  description: "To get some practice with everything you've picked up so far, you'll rebuild YouTube's video page.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_media.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: "What's New in HTML5",
  description: 'The transition to HTML5 has opened up several new elements and best practices which will make your life easier.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/new_html5.md',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Displaying and Inputting Data',
  course_id: course.id,
  position: section_position,
  description: "Displaying and inputting data are two of your chief duties as a web developer. We'll cover the tools at your disposal, including tables and lists for display and forms for input.",
  identifier_uuid: '79ed6ec0-7711-48c0-bf75-920192ab432f',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Tables in HTML',
  description: "Tables aren't used as much as they once were but can still be a great way to display structured content.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/tables.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Ordered and Unordered Lists',
  description: 'Lists are used everywhere and even in some unexpected places like navigation bars.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/lists.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Forms for Collecting Data',
  description: 'Forms allow the user to submit data to your application and represent one of the trickiest parts of setting up your HTML structure.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/html_forms.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'HTML Forms',
  description: "Get some practice working with different form elements by building Mint.com's signup.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_html_forms.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'CSS',
  course_id: course.id,
  position: section_position,
  description: "Here we'll cover each of the foundational CSS concepts in greater depth than you probably have before.",
  identifier_uuid: 'ac4174f2-c2a4-4e11-be00-52d8abfaaf1d',
)

lesson_position += 1
create_or_update_lesson(
  title: 'CSS Basics',
  description: "Even though you're already comfortable with CSS, it's worth revisiting the basics.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/css_basics.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'The Box Model',
  description: 'Even experienced developers often have trouble with the details of the box model, which governs how elements are displayed on the page.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/box_model.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Floats and Positioning',
  description: 'Positioning elements on the page can give you fits, so learning how elements play together is well worth your time.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/floats_positioning.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Flexbox',
  description: 'Flexbox layout distributes space along a single column or row. Like float layouts, but more versatile.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/flexbox_layout.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Grid',
  description: 'Grid divides elements into columns & rows. A modern, powerful way to setout your layout.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/grid_layout.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Positioning and Floating Elements',
  description: 'Long content pieces of yesteryear are being replaced with rich multimedia experiences and the Times has led the charge.  See if you can apply what you learned about positioning by cloning one of their articles.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_positioning.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Best Practices',
  description: "It's one thing to have the toolbox and a whole other to understand the best way to use it.  We'll explore some of these best practices in this section.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/best_practices.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Backgrounds and Gradients',
  description: "Here you'll learn about placing and positioning background images and working with gradients.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/backgrounds.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building with Backgrounds and Gradients',
  description: 'Apple is a design leader and their homepage can teach you a lot about working with images and gradients.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_backgrounds.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Design and UX',
  course_id: course.id,
  position: section_position,
  description: "If you want to make your websites stop looking like they came from the 1990's, you'll need to gain an understanding for at least the best practices of design and User Experience (UX).  Not knowing this stuff is like charging over the next hill without any idea of why you're doing it.",
  identifier_uuid: '721dbec7-fb68-4c28-aad9-044ae6d0c032',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Introduction to Design and UX',
  description: 'A grounding in some fundamental design definitions and tenets will go a long way.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/design_ux.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Fonts and Typography',
  description: "Understanding fonts and typography is far from a design geek's domain -- they greatly affect the ease of use for your pages.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/typography.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Design Teardown',
  description: "The first step to understanding design is to train yourself to *see* design, so you'll get a chance to break down one of the hallmark Design publications, Smashing Magazine.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_design.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Responsive Design and CSS Frameworks',
  course_id: course.id,
  position: section_position,
  description: 'These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries. Luckily there are CSS frameworks like Twitter Bootstrap that can save you a ton of time developing standard pages and which come with responsive functionality for free.',
  identifier_uuid: 'b99f6f56-1f50-4ba2-8a8a-f2e08bee0499',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Responsive Design',
  description: "Your websites will need to degrade gracefully as your users move from a full browser to an iPad to a mobile phone, and here you'll learn how.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/responsive_design.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building with Responsive Design',
  description: "It's time to put your newfound responsive superpowers to use by building The Next Web's responsive homepage.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_responsive.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'CSS Frameworks like Bootstrap and Foundation',
  description: "Now that you've mastered the fundamentals of HTML and CSS, it's time to make your workflow a whole lot easier with CSS frameworks.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/css_frameworks.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using Bootstrap',
  description: 'Test out working with the Bootstrap framework.  It may feel a bit odd at first but it makes your life MUCH easier once you figure out the gist of it. ',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_bootstrap.md',
  accepts_submission: true,
  has_live_preview: true
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Advanced CSS',
  course_id: course.id,
  position: section_position,
  description: "We'll take you beyond the basics of CSS and into a variety of additional topics from how to add some stylistic flair to your elements to using tools like preprocessors to save time and reduce repetition in your code.",
  identifier_uuid: '31c08007-c670-4a7d-bb89-fa9c0a06f539',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Animations, Subtle Effects and Compatibility',
  description: 'Dive into some of the more interesting stylistic tools at your disposal like transitions and animations that use only CSS3.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/stylings.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Using CSS Preprocessors to Save Time',
  description: "Learn about preprocessors like SASS which can make your CSS act more like real code... which is a good thing because it'll save you time and gray hairs.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/preprocessors.md',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Design Your Own Grid-Based Framework',
  description: "This final project will require you to apply almost everything you've learned up until now since you'll be building your own version of a grid-based CSS framework.  Luckily you can use it on your projects from here on out!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/html_css/project_css_frameworks.md',
  accepts_submission: true,
  has_live_preview: true
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: "You've found the light at the end of the tunnel.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/html_css/conclusion.md',
)
