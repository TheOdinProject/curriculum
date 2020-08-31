require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:decorator) { UserDecorator.new(user) }

  let(:user) { instance_double(User) }

  describe '#lesson_completions_for' do
    let(:course) { instance_double(Course) }
    let(:completed_lessons) { instance_double(CompletedLessons) }

    before do
      allow(CompletedLessons).to receive(:new).with(course, user).and_return(completed_lessons)
      allow(completed_lessons).to receive(:for_course)
    end

    it 'delegates to the CompletedLessons service' do
      decorator.lesson_completions_for(course)
      expect(completed_lessons).to have_received(:for_course)
    end
  end
end
