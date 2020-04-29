require 'rails_helper'

RSpec.describe Notifications::LessonCompletion do
  let(:lesson_completion)  do
    instance_double(
      LessonCompletion,
      student: student,
      lesson: lesson
    )
  end

  let(:student) { instance_double(User, username: "A USER") }
  let(:lesson) { instance_double(Lesson, title: "A LESSON TITLE", course: course) }
  let(:course) { instance_double(Course, title: "A COURSE TITLE") }


  describe '#message' do
    subject { described_class.new(lesson_completion).message }

   it { is_expected.to eq("A USER has completed A COURSE TITLE: A LESSON TITLE") }
  end
end
