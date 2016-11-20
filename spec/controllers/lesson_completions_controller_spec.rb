require 'rails_helper'

RSpec.describe LessonCompletionsController do
  let(:student) { double('User', id: '1') }
  let(:lesson) { double('Lesson', id: '1') }
  let(:lesson_completion_attrs) {
    { lesson_id: lesson.id, student_id: student.id }
  }
  let(:lesson_completion) {
    double('LessonCompletion', lesson_completion_attrs)
  }

  context 'before authentication' do
    it 'POST #create unauthorized' do
      post :create, params: lesson_completion_attrs
      expect(response).to have_http_status(:unauthorized)
    end

    it 'DELETE #destroy unauthorized' do
      delete :destroy, params: { lesson_id: lesson_completion_attrs[:lesson_id] }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'after authentication' do
    before do
      allow(controller).to receive(:current_user).and_return(student)
      allow(Lesson).to receive(:find)
        .with(lesson_completion_attrs[:lesson_id])
        .and_return(lesson)
    end

    describe 'POST #create' do
      it 'saves the lesson_completion record to the database' do
        expect do
          post :create, params: lesson_completion_attrs
        end.to change(LessonCompletion, :count).by(1)
      end

      it 'renders the template' do
        post :create, params: lesson_completion_attrs
        expect(response).to render_template('create')
      end
    end

    describe 'DELETE #destroy' do
      let(:lesson_completions) { double('LessonCompletions') }
      before do
        allow(LessonCompletion).to receive(:where)
          .with(lesson_completion_attrs)
          .and_return(lesson_completions)

        allow(lesson_completions).to receive(:first)
          .and_return(lesson_completion)

        allow(lesson_completion).to receive(:destroy)
      end

      it 'destroys the lesson_completion object' do
        expect(lesson_completion).to receive(:destroy)
        delete :destroy, params: { lesson_id: lesson_completion_attrs[:lesson_id] }
      end

      it 'renders the template' do
        delete :destroy, params: { lesson_id: lesson_completion_attrs[:lesson_id] }
        expect(response).to render_template('create')
      end
    end
  end
end
