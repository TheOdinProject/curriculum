# ************************************************
# CREATE HTML5/CSS3 COURSE
# ************************************************

Rails.logger.info "\n\n***** STARTING COURSE: HTML/CSS *****"

# Set Course and section position here. Update file name appropriately.
course_position = 5
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "HTML and CSS",
  title_url: "HTML5 and CSS3".parameterize,
  description: "Good web design doesn't happen by accident. Learn how to make all that work you've done on the backend look great in a web browser! You'll be equipped to deeply understand and create your own design frameworks.",
  position: course_position
)


# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Basic HTML Page Structure",
  title_url: "Basic HTML Page Structure".parameterize,
  course_id: course.id,
  position: section_position,
  description: "In this section, we'll cover the whole range of HTML so you'll be completely comfortable with putting the right elements in the right places on a page."
)


lesson_position += 1
create_or_update_lesson(
  title: "How This Course Will Work",
  title_url: "How This Course Will Work".parameterize,
  description: "Let's get acquainted with what this will look like from here on out.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "HTML Basics",
  title_url: "HTML Basics".parameterize,
  description: "A brief refresher on the very basics of HTML.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html5_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Linking Internal and External Pages",
  title_url: "Linking Internal and External Pages".parameterize,
  description: "When do you link to the relative URL versus the absolute?  How do you set up internal links?",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/links.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Working with Images, Video and Other Media",
  title_url: "Working with Images, Video and Other Media".parameterize,
  description: "Rich media experiences make your pages come alive but there are some things you'll need to know to avoid slow load times.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/images.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Embedding Images and Video",
  title_url: "Embedding Images and Video".parameterize,
  description: "To get some practice with everything you've picked up so far, you'll rebuild YouTube's video page.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_media.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "What's New in HTML5",
  title_url: "What's New in HTML5".parameterize,
  description: "The transition to HTML5 has opened up several new elements and best practices which will make your life easier.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/new_html5.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Displaying and Inputting Data",
  title_url: "Displaying and Inputting Data".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Displaying and inputting data are two of your chief duties as a web developer. We'll cover the tools at your disposal, including tables and lists for display and forms for input."
)

lesson_position += 1
create_or_update_lesson(
  title: "Tables in HTML",
  title_url: "Tables in HTML".parameterize,
  description: "Tables aren't used as much as they once were but can still be a great way to display structured content.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/tables.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Ordered and Unordered Lists",
  title_url: "Ordered and Unordered Lists".parameterize,
  description: "Lists are used everywhere and even in some unexpected places like navigation bars.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/lists.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Forms for Collecting Data",
  title_url: "Forms for Collecting Data".parameterize,
  description: "Forms allow the user to submit data to your application and represent one of the trickiest parts of setting up your HTML structure.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/html_forms.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "HTML Forms",
  title_url: "HTML Forms".parameterize,
  description: "Get some practice working with different form elements by building Mint.com's signup.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_html_forms.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "CSS",
  title_url: "CSS".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Here we'll cover each of the foundational CSS concepts in greater depth than you probably have before."
)

lesson_position += 1
create_or_update_lesson(
  title: "CSS Basics",
  title_url: "CSS Basics".parameterize,
  description: "Even though you're already comfortable with CSS, it's worth revisiting the basics.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_basics.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "The Box Model",
  title_url: "The Box Model".parameterize,
  description: "Even experienced developers often have trouble with the details of the box model, which governs how elements are displayed on the page.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/box_model.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Floats and Positioning",
  title_url: "Floats and Positioning".parameterize,
  description: "Positioning elements on the page can give you fits, so learning how elements play together is well worth your time.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/floats_positioning.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Positioning and Floating Elements",
  title_url: "Positioning and Floating Elements".parameterize,
  description: "Long content pieces of yesteryear are being replaced with rich multimedia experiences and the Times has led the charge.  See if you can apply what you learned about positioning by cloning one of their articles.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_positioning.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Best Practices",
  title_url: "Best Practices".parameterize,
  description: "It's one thing to have the toolbox and a whole other to understand the best way to use it.  We'll explore some of these best practices in this section.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/best_practices.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Backgrounds and Gradients",
  title_url: "Backgrounds and Gradients".parameterize,
  description: "Here you'll learn about placing and positioning background images and working with gradients.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/backgrounds.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building with Backgrounds and Gradients",
  title_url: "Building with Backgrounds and Gradients".parameterize,
  description: "Apple is a design leader and their homepage can teach you a lot about working with images and gradients.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_backgrounds.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Design and UX",
  title_url: "Design and UX".parameterize,
  course_id: course.id,
  position: section_position,
  description: "If you want to make your websites stop looking like they came from the 1990's, you'll need to gain an understanding for at least the best practices of design and User Experience (UX).  Not knowing this stuff is like charging over the next hill without any idea of why you're doing it."
)

lesson_position += 1
create_or_update_lesson(
  title: "Introduction to Design and UX",
  title_url: "Introduction to Design and UX".parameterize,
  description: "A grounding in some fundamental design definitions and tenets will go a long way.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/design_ux.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Fonts and Typography",
  title_url: "Fonts and Typography".parameterize,
  description: "Understanding fonts and typography is far from a design geek's domain -- they greatly affect the ease of use for your pages.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/typography.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "CSS Grids",
  title_url: "CSS Grids".parameterize,
  description: "Content isn't just thrown onto the page without a care -- grid systems apply logic and order to the way information is displayed.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_grids.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Design Teardown",
  title_url: "Design Teardown".parameterize,
  description: "The first step to understanding design is to train yourself to *see* design, so you'll get a chance to break down one of the hallmark Design publications, Smashing Magazine.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_design.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Responsive Design and CSS Frameworks",
  title_url: "Responsive Design and CSS Frameworks".parameterize,
  course_id: course.id,
  position: section_position,
  description: "These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries.  Luckily there are CSS frameworks like Twitter Bootstrap that can save you a ton of time developing standard pages and which come with responsive functionality for free."
)

lesson_position += 1
create_or_update_lesson(
  title: "Responsive Design",
  title_url: "Responsive Design".parameterize,
  description: "Your websites will need to degrade gracefully as your users move from a full browser to an iPad to a mobile phone, and here you'll learn how.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/responsive_design.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building with Responsive Design",
  title_url: "Building with Responsive Design".parameterize,
  description: "It's time to put your newfound responsive superpowers to use by building The Next Web's responsive homepage.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_responsive.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "CSS Frameworks like Bootstrap and Foundation",
  title_url: "CSS Frameworks like Bootstrap and Foundation".parameterize,
  description: "Now that you've mastered the fundamentals of HTML and CSS, it's time to make your workflow a whole lot easier with CSS frameworks.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/css_frameworks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Using Bootstrap",
  title_url: "Using Bootstrap".parameterize,
  description: "Test out working with the Bootstrap framework.  It may feel a bit odd at first but it makes your life MUCH easier once you figure out the gist of it. ",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_bootstrap.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Advanced CSS",
  title_url: "Advanced CSS".parameterize,
  course_id: course.id,
  position: section_position,
  description: "We'll take you beyond the basics of CSS and into a variety of additional topics from how to add some stylistic flair to your elements to using tools like preprocessors to save time and reduce repetition in your code."
)

lesson_position += 1
create_or_update_lesson(
  title: "Animations, Subtle Effects and Compatibility",
  title_url: "Animations, Subtle Effects and Compatibility".parameterize,
  description: "Dive into some of the more interesting stylistic tools at your disposal like transitions and animations that use only CSS3.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/stylings.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Using CSS Preprocessors to Save Time",
  title_url: "Using CSS Preprocessors to Save Time".parameterize,
  description: "Learn about preprocessors like SASS which can make your CSS act more like real code... which is a good thing because it'll save you time and gray hairs.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/preprocessors.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Design Your Own Grid-Based Framework",
  title_url: "Design Your Own Grid-Based Framework".parameterize,
  description: "This final project will require you to apply almost everything you've learned up until now since you'll be building your own version of a grid-based CSS framework.  Luckily you can use it on your projects from here on out!",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/html_css/project_css_frameworks.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "You've found the light at the end of the tunnel.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/html_css/conclusion.md",
  repo: 'curriculum'
)
