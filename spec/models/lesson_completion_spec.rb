require 'spec_helper'

describe LessonCompletion do
  
  let!(:user){ FactoryGirl.create(:user) }
  let!(:lesson){ FactoryGirl.create(:lesson) }
  
  subject(:lesson_completion) { LessonCompletion.new(   
    :student_id => user.id,
    :lesson_id => lesson.id
                               )}

  it { is_expected.to respond_to(:student) }
  it { is_expected.to respond_to(:lesson) }
  it { is_expected.to be_valid }

  context "when lesson and student are duplicated" do
    before do
      LessonCompletion.create(:student_id => user.id, :lesson_id => lesson.id)
    end
    it { is_expected.not_to be_valid }
  end
  
  # Also test that they delete when the lesson or user are deleted?

end
