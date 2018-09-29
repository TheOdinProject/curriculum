# ************************************************
# CREATE GETTING HIRED COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Getting Hired *****"

# Set Course and section position here. Update file name appropriately.
course_position = 7
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: "Getting Hired",
  title_url: "Getting Hired".parameterize,
  description: "Web development is a lifelong journey of learning and growth. Continue that journey on a professional development team! You'll learn where to find jobs, how to do great interviews, and the best strategies to launch your career.",
  position: course_position,
)

# :description: "Learning on your own is a long hard road and you've come incredibly far.  Good work!  With that same level of focus and dedication, you should be able to polish off your skillsets, address your weak points, and get hired as a web developer.  Because you've still got a whole lot more to learn (it's really a lifetime journey) but now the best way to do that is by surrounding yourself with other great developers.  This course is all about that next step -- what else you'll need to know, where to find jobs, how to interview, and how to ultimately get that offer in hand.  It won't be easy, but you can do it!",

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Preparing for Your Job Search",
  title_url: "Preparing for Your Job Search".parameterize,
  course_id: course.id,
  position: section_position,
  description: "Your job search begins long before you send out the first application, so be sure to adequately prepare by laying out a strategy and being honest with yourself about your goals, needs and expectations."
)

lesson_position += 1
create_or_update_lesson(
  title: "How This Course Will Work",
  title_url: "How This Course Will Work".parameterize,
  description: "This course is a bit different than the others so it's worth getting acquainted with how it will work.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/introduction.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Strategy",
  title_url: "Strategy".parameterize,
  description: "You will need to develop a coherent strategy for how you'll approach the process or risk wasting time.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/strategy.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "It Starts with YOU",
  title_url: "It Starts with YOU".parameterize,
  description: "You won't get hired anywhere you want to be unless you have an honest conversation with yourself.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/starts_with_you.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "What Companies Want",
  title_url: "What Companies Want".parameterize,
  description: "An important step to selling yourself is realizing what the companies doing the hiring really want.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/what_companies_want.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "What You Can Do To Prepare",
  title_url: "What You Can Do To Prepare".parameterize,
  description: "There are many things you can do ahead of time to prepare for your job hunt that will greatly help your odds of getting hired.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/preparation.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building Your Personal Website",
  title_url: "Building Your Personal Website".parameterize,
  description: "Nothing shows off your work quite as effectively as a website you've built yourself. Just be careful not to go overboard with it.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/getting_hired/project_portfolio.md",
  repo: 'curriculum'
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: "Applying to and Interviewing for Jobs",
  title_url: "Applying to and Interviewing for Jobs".parameterize,
  course_id: course.id,
  position: section_position,
  description: "This is an odds game, so you've got to structure your plan and focus on highest probability approaches and targets.  In this section we'll cover how the process typically works and the best way to increase your odds of success. Go get 'em."
)

lesson_position += 1
create_or_update_lesson(
  title: "Collecting Job Leads",
  title_url: "Collecting Job Leads".parameterize,
  description: "Your first step to finding that perfect job is knowing where to look and collecting good leads.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/collect_leads.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Qualifying Job Leads",
  title_url: "Qualifying Job Leads".parameterize,
  description: "You will need to have a rigorous process for evaluating leads or you will end up wasting your time.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/qualify_leads.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Building Your Resume",
  title_url: "Building Your Resume".parameterize,
  description: "Even in this day and age, the resume is still the primary way people get information about you.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: "/getting_hired/project_resume.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Applying for Web Development Jobs",
  title_url: "Applying for Web Development Jobs".parameterize,
  description: "Some tips for increasing your odds during the application process itself.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/applying.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Preparing to Interview and Interviewing",
  title_url: "Preparing to Interview and Interviewing".parameterize,
  description: "Interviewing is annoying and difficult but you'll have to do it.  We'll help point you to the best resources for preparing yourself.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/preparing_to_interview.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Handling a Job Offer",
  title_url: "Handling a Job Offer".parameterize,
  description: "Woohoo! Now what??",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/handling_an_offer.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Alternate Paths to a Web Development Job",
  title_url: "Alternate Paths to a Web Development Job".parameterize,
  description: "A look at several alternative ways you can find a web development job.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/alternatives.md",
  repo: 'curriculum'
)

lesson_position += 1
create_or_update_lesson(
  title: "Conclusion",
  title_url: "Conclusion".parameterize,
  description: "Wrapping up The Odin Project and what you can do to have a strong career.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: "/getting_hired/conclusion.md",
  repo: 'curriculum'
)
