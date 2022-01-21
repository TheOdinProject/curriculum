########################
# Course - Getting Hired
########################

course = @path.add_course do |course|
  course.title = 'Getting Hired'
  course.description = "Web development is a lifelong journey of learning and growth. Continue that journey on a professional development team! You'll learn where to find jobs, how to do great interviews, and the best strategies to launch your career."
  course.identifier_uuid = 'fdad8aa6-d77c-4e7f-9d83-130e838904f3'
end

# +++++++++++++++++++++++++++++++++++++++
# SECTION - Preparing for Your Job Search
# +++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Preparing for Your Job Search'
  section.description = 'Your job search begins long before you send out the first application, so be sure to adequately prepare by laying out a strategy and being honest with yourself about your goals, needs and expectations.'
  section.identifier_uuid = '5253b457-47e4-401c-81d0-92cd7817f138'

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
  section.identifier_uuid = '8b579b0b-e394-4959-b86e-ab7e92d1b1b3'

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
