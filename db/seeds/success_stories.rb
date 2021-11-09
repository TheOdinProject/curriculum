success_stories = [
  {
    student_name: 'Rob Pando',
    avatar_path_name: 'rob_pando.jpg',
    story_content: 'TOP was a perfect match for my learning style. Not walking me through an entire project but actually forcing me to figure it out on my own, by pointing me in all the right directions in order to complete them. That helped me dig deeper into various important topics, which then gave me the necessary knowledge and confidence to start applying for jobs and landing that dream job. The community was part of it too, first getting help and then helping, it was a great way to learn and make it stick.',
    job_title: 'Fullstack Developer',
    social_media_link: 'https://github.com/RobPando'
  },
  {
    student_name: 'Olivia',
    avatar_path_name: 'olivia.jpg',
    story_content: 'Before I found TOP, I was jumping from course to course without really any guidance or community. I wanted to get a real development job and not operating an IT help desk, and I wanted to do it for free. After reading people’s success stories on Reddit on how they found a development job, many people praised the curriculum at TOP and how they got a job even before they finished it. I couldn’t believe it! So I decided to give it a shot. The self-paced structure, reading materials, and challenges was easy to understand and made me feel I was in control. I was even able to find a community to help guide and mentor me through the process. About eight months after I started, I got my first development gig - and I didn’t even finish the curriculum! Because of TOP, I can call myself a developer.',
    job_title: 'Information Security Engineer',
    social_media_link: '',
  },
  {
    student_name: 'Cody Loyd',
    avatar_path_name: 'cody_loyd.jpg',
    story_content: 'Before I started the Odin Project I had literally ZERO programming experience. After almost exactly a year of working through the program, I was offered a job as a front end web developer. Odin taught me all the most crucial skills in webdev and gave me an incredibly strong foundation for branching out and learning other pieces of the web-dev puzzle along the way.',
    job_title: 'Software Engineer',
    social_media_link: 'http://codyloyd.com/'
  },
  {
    student_name: 'William Kennedy',
    avatar_path_name: 'william_kennedy.jpg',
    story_content: 'The Odin Project changed my life and that is not an understatement. In November 2013, I made a commitment to myself to become a self-taught developer so I threw myself head first into Google trying to learn everything I could. Originally, I wanted to be a Java Web Developer then a week later I wanted to be an Android developer. I was reading blog post after blog post, and pretty soon I started to get overwhelmed. I had no structure and no plan of attack about how to get a development job. I was desperate to change career and then suddenly I stumbled across The Odin Project, and it had exactly what I needed. An exact path to take to become a Software Developer. It was like taking a college course except it was free and in my own time. I started going through the course, and by June 2015 I got my first development job. Exactly 14 months after I started The Odin Project. I never had to quit my job, and I always had something to look forward to in the evening.',
    job_title: 'Software Engineer',
    social_media_link: 'https://www.new2code.com/about'
  },
  {
    student_name: 'Andrej Dragojević',
    avatar_path_name: 'andrej_dragojevic.jpg',
    story_content: 'An incredible self-paced curriculum that consists of the best resources for learning programming on the web! It was an invaluable resource on my path to a becoming a software developer. Thanks to The Odin Project I was able to get a job half way through the curriculum, and the projects completed as part of the curriculum gave me an edge compared to other junior developers with no experience.',
    job_title: 'Full Stack Ruby on Rails Developer',
    social_media_link: 'https://www.linkedin.com/in/andrej-dragojevic-735a51b7/'
  },
  {
    student_name: 'Skip Gibson',
    avatar_path_name: 'skip.jpg',
    story_content: "Before I found The Odin Project I had very little direction with my learning, jumping from topic to topic then trying to piece things together as I went. Having this online curriculum to follow was a massive help and took my understanding of programming to the next level. Being self taught and going into a job interview with no professional experience is incredibly daunting, but being able to point to my GitHub which had all of the projects I'd completed while going through the curriculum, I was able to demonstrate that I was committed to learning and improving myself, ultimately that’s exactly what they were after in an employee. If you're considering using The Odin Project I really cannot recommend it enough, I owe my career to this site.",
    job_title: 'Software Developer',
    social_media_link: 'https://github.com/skipcloud'
  },
  {
    student_name: 'Mazin Power Elfehaid',
    avatar_path_name: 'mazin.jpg',
    story_content: "In 2014 I wanted to learn how to program, but I had no idea where to start. Odin solved that problem for me - it mapped out a series of lesson plans that showed me what to study, without holding my hand or spoon-feeding me information.  The curriculum requires hard work and perseverance, but it's worth it. I walked into my first job and felt instantly comfortable with the tools and technologies my employer required. Yes, there was a lot that I didn't know yet, but having done Odin also gave me the confidence to pick up new skills as needed.",
    job_title: 'Software Engineer',
    social_media_link: 'https://github.com/muzfuz'
  },
  {
    student_name: 'Sean Szurko',
    avatar_path_name: 'sean.jpg',
    story_content: 'TOP smoothed out the steep learning curve in web development, allowing me to confidently learn at my own pace and taught me how to approach and solve real-life programming problems.  The projects in TOP were a perfect mix of difficulty, allowing me to gain exposure to different technologies and feel challenged without feeling overwhelmed.  Because of the foundation TOP provided, I was able to easily transition into freelancing and then into a junior level Rails developer position.',
    job_title: 'Mid-Level Rails Developer',
    social_media_link: 'https://www.seanszurko.com/',
  },
  {
    student_name: 'Aron Fischer',
    avatar_path_name: 'aron_fischer.jpg',
    story_content: "I remember when I first tried to learn to code. It's not an accident that I say I tried because if I'm honest, I started a few times before finally sticking to it. I tried many different resources, courses, and curriculums, but none of them seemed to teach in a way that made me stick to it. What differentiates TOP from all those other courses and curriculums out there is its unique way of providing guidance and answers to the most important questions, while also strengthening your ability to push through the curriculum and projects by yourself and as a result grow on your struggles. The reason why TOP was perfect for me was on the one hand because in its' well-structured paths I found answers to the most difficult of all questions: Where should I start? What should I learn first? How well do I have to know certain technologies? Besides providing answers to those questions, having a great and supportive community, another point to stress is the flexibility of the curriculum. I was able to use my creativity to design and code the projects, and often further ideas were provided to help you figure out which feature to add next. Now, I reached what I wouldn't have thought possible when I started. I landed a job :D.",
    job_title: 'Reactjs Frontend Developer',
    social_media_link: 'https://github.com/aronfischer'
  }
]

success_stories.each do |success_story|
  SuccessStory.find_or_create_by!(success_story)
end
