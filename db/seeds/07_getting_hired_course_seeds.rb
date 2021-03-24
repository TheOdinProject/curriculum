# ************************************************
# CREATE GETTING HIRED COURSE
# ************************************************
Rails.logger.info "\n\n***** STARTING COURSE: Getting Hired *****"

# Set Course and section position here. Update file name appropriately.
course_position = 7
section_position = 0
lesson_position = 0

course = create_or_update_course(
  title: 'Getting Hired',
  description: "Web development is a lifelong journey of learning and growth. Continue that journey on a professional development team! You'll learn where to find jobs, how to do great interviews, and the best strategies to launch your career.",
  position: course_position,
  identifier_uuid: 'fdad8aa6-d77c-4e7f-9d83-130e838904f3',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Preparing for Your Job Search',
  course_id: course.id,
  position: section_position,
  description: 'Your job search begins long before you send out the first application, so be sure to adequately prepare by laying out a strategy and being honest with yourself about your goals, needs and expectations.',
  identifier_uuid: '5253b457-47e4-401c-81d0-92cd7817f138',
)

lesson_position += 1
create_or_update_lesson(
  title: 'How This Course Will Work',
  description: "This course is a bit different than the others so it's worth getting acquainted with how it will work.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/introduction.md',
  identifier_uuid: 'f5e4f7ab-a6af-4318-ad5c-6f2be86ffa3f',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Strategy',
  description: "You will need to develop a coherent strategy for how you'll approach the process or risk wasting time.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/strategy.md',
  identifier_uuid: 'ce1856f8-a0be-4c9d-b1d4-41c49f67a675',
)

lesson_position += 1
create_or_update_lesson(
  title: 'It Starts with YOU',
  description: "You won't get hired anywhere you want to be unless you have an honest conversation with yourself.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/starts_with_you.md',
  identifier_uuid: '092fb96c-1957-479a-96f6-afe326d33dbf',
)

lesson_position += 1
create_or_update_lesson(
  title: 'What Companies Want',
  description: 'An important step to selling yourself is realizing what the companies doing the hiring really want.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/what_companies_want.md',
  identifier_uuid: 'c93d5c3a-38b2-477c-86bd-62168a14aafe',
)

lesson_position += 1
create_or_update_lesson(
  title: 'What You Can Do To Prepare',
  description: 'There are many things you can do ahead of time to prepare for your job hunt that will greatly help your odds of getting hired.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/preparation.md',
  identifier_uuid: '0ae67a52-edf8-42bd-9a7e-2e4f41562727',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building Your Personal Website',
  description: "Nothing shows off your work quite as effectively as a website you've built yourself. Just be careful not to go overboard with it.",
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/getting_hired/project_portfolio.md',
  accepts_submission: true,
  has_live_preview: true,
  identifier_uuid: '9e9f98a7-43bc-4e2b-9325-f858319604d5',
)

# +++++++++++
# SECTION
# +++++++++++

section_position += 1
section = create_or_update_section(
  title: 'Applying to and Interviewing for Jobs',
  course_id: course.id,
  position: section_position,
  description: "This is an odds game, so you've got to structure your plan and focus on highest probability approaches and targets. In this section we'll cover how the process typically works and the best way to increase your odds of success. Go get 'em.",
  identifier_uuid: '8b579b0b-e394-4959-b86e-ab7e92d1b1b3',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Collecting Job Leads',
  description: 'Your first step to finding that perfect job is knowing where to look and collecting good leads.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/collect_leads.md',
  identifier_uuid: '050fda7c-fc76-44d4-a16d-4c4e6423c8b1',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Qualifying Job Leads',
  description: 'You will need to have a rigorous process for evaluating leads or you will end up wasting your time.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/qualify_leads.md',
  identifier_uuid: '5e780427-217f-4351-8c37-07443fc31096',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Building Your Resume',
  description: 'Even in this day and age, the resume is still the primary way people get information about you.',
  position: lesson_position,
  section_id: section.id,
  is_project: true,
  url: '/getting_hired/project_resume.md',
  accepts_submission: false,
  has_live_preview: false,
  identifier_uuid: '029f508f-8034-41b2-b330-bba88f0efe3b',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Applying for Web Development Jobs',
  description: 'Some tips for increasing your odds during the application process itself.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/applying.md',
  identifier_uuid: 'bc297492-dc99-485a-b36b-49ac500394fb',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Preparing to Interview and Interviewing',
  description: "Interviewing is annoying and difficult but you'll have to do it.  We'll help point you to the best resources for preparing yourself.",
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/preparing_to_interview.md',
  identifier_uuid: '6b2a0178-1827-4a6d-bbce-190aeb20b864',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Handling a Job Offer',
  description: 'Woohoo! Now what??',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/handling_an_offer.md',
  identifier_uuid: '4f246886-c491-4362-9026-deec4fb36373',
)

lesson_position += 1
create_or_update_lesson(
  title: 'Conclusion',
  description: 'Wrapping up The Odin Project and what you can do to have a strong career.',
  position: lesson_position,
  section_id: section.id,
  is_project: false,
  url: '/getting_hired/conclusion.md',
  identifier_uuid: 'de2fbbc0-1db8-4eae-a4c3-ac467be471c3',
)
