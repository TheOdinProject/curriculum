require 'rails_helper'

RSpec.describe LessonCompletion do
  subject(:lesson_completion) {
    LessonCompletion.new(student_id: 1, lesson_id: 1)
  }

  it { is_expected.to validate_presence_of(:student_id) }
  it { is_expected.to validate_presence_of(:lesson_id) }
  it do
    is_expected.to validate_uniqueness_of(:student_id).scoped_to(:lesson_id)
  end
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:lesson) }
end
