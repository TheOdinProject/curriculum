require 'rails_helper'

RSpec.describe LessonCompletion do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:student_id) }
  it { is_expected.to validate_presence_of(:lesson_id) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:lesson) }
end
