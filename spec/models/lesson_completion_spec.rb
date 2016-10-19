require 'rails_helper'

describe LessonCompletion do

  let!(:user)  { double("User",    :id => 1) }
  let!(:lesson){ double("Lessons", :id => 1) }

  subject(:lesson_completion) { LessonCompletion.new(
    :student_id => user.id,
    :lesson_id => lesson.id
  )}

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:student) }
  it { is_expected.to respond_to(:lesson) }
  it { is_expected.to validate_presence_of(:student_id) }
  it { is_expected.to validate_presence_of(:lesson_id) }
  it { is_expected.to validate_uniqueness_of(:student_id).scoped_to(:lesson_id) }
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:lesson) }

  # Also test that they delete when the lesson or user are deleted?

end
