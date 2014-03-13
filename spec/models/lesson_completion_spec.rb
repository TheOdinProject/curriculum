require 'spec_helper'

describe LessonCompletion do
  
  let!(:user){ FactoryGirl.create(:user) }
  let!(:lesson){ FactoryGirl.create(:lesson) }
  
  subject(:lesson_completion) { LessonCompletion.new(   
    :student_id => user.id,
    :lesson_id => lesson.id
                               )}

  it { should respond_to(:student) }
  it { should respond_to(:lesson) }
  it { should be_valid }

  context "when lesson and student are duplicated" do
    before do
      LessonCompletion.create(:student_id => user.id, :lesson_id => lesson.id)
    end
    it { should_not be_valid }
  end
  
  # Also test that they delete when the lesson or user are deleted?

end
