########################
# Course - Getting Hired
########################

course = @path.add_course do |course|
  course.title = 'Getting Hired'
  course.description = "Web development is a lifelong journey of learning and growth. Continue that journey on a professional development team! You'll learn where to find jobs, how to do great interviews, and the best strategies to launch your career."
  course.identifier_uuid = '1fac6c55-479c-4202-936b-2992c0e4815c'
end

# +++++++++++++++++++++++++++++++++++++++
# SECTION - Preparing for Your Job Search
# +++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Preparing for Your Job Search'
  section.description = 'Your job search begins long before you send out the first application, so be sure to adequately prepare by laying out a strategy and being honest with yourself about your goals, needs and expectations.'
  section.identifier_uuid = '09f6b06b-bdf7-4700-9d59-164b91acb5d0'

  section.add_lessons(
    getting_hired_lessons.fetch('How This Course Will Work'),
    getting_hired_lessons.fetch('Strategy'),
    getting_hired_lessons.fetch('It Starts with YOU'),
    getting_hired_lessons.fetch('What Companies Want'),
    getting_hired_lessons.fetch('What You Can Do To Prepare'),
    getting_hired_lessons.fetch('Building Your Personal Website'),
  )
end

# +++++++++++++++++++++++++++++++++++++++++++++++
# SECTION - Applying to and Interviewing for Jobs
# +++++++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Applying to and Interviewing for Jobs'
  section.description = "This is an odds game, so you've got to structure your plan and focus on highest probability approaches and targets. In this section we'll cover how the process typically works and the best way to increase your odds of success. Go get 'em."
  section.identifier_uuid = '49657e71-89f8-4b81-a4f0-28479a89b10f'

  section.add_lessons(
    getting_hired_lessons.fetch('Collecting Job Leads'),
    getting_hired_lessons.fetch('Qualifying Job Leads'),
    getting_hired_lessons.fetch('Building Your Resume'),
    getting_hired_lessons.fetch('Applying for Web Development Jobs'),
    getting_hired_lessons.fetch('Preparing to Interview and Interviewing'),
    getting_hired_lessons.fetch('Handling a Job Offer'),
    getting_hired_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
