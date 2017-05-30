require 'rails_helper'

RSpec.describe LessonCompletionsController do
  let(:student) { double('User', id: '1') }
  let(:lesson) { double('Lesson', id: '1') }
  let(:lesson_completion_attrs) {
    { lesson_id: lesson.id, student_id: student.id }
  }
  let(:lesson_completion) {
    double('LessonCompletion', lesson_completion_attrs.merge(id: '1'))
  }

  context 'unauthenticated user' do
    describe 'POST #create' do
      it 'returns unauthorized status' do
        post :create, params: lesson_completion_attrs, xhr: true
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'DELETE #destroy' do
      it 'returns unauthorized status' do
        delete :destroy, params: { id: lesson_completion.id, lesson_id: lesson.id }, xhr: true
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'authenticated user' do
    before do
      allow(controller).to receive(:current_user).and_return(student)
      allow(Lesson).to receive(:friendly).and_return(lesson)
      allow(lesson).to receive(:find).with(lesson.id).and_return(lesson)
    end

    describe 'POST #create' do
      let(:post_request) { post :create, params: lesson_completion_attrs, xhr: true }

      it 'saves the lesson_completion record to the database' do
        expect { post_request }.to change(LessonCompletion, :count).by(1)
      end

      it 'renders the :create template' do
        post_request
        expect(response).to render_template(:create)
      end
    end

    describe 'DELETE #destroy' do
      let(:lesson_completions) { double('LessonCompletions') }
      let(:delete_request) do
        delete :destroy, params: { lesson_id: lesson.id, id: lesson_completion.id }, xhr: true
      end

      before do
        allow(student).to receive(:lesson_completions).and_return(lesson_completions)
        allow(lesson_completions).to receive(:find)
          .with(lesson_completion.id).and_return(lesson_completion)
        allow(lesson_completion).to receive(:destroy)
      end

      it 'destroys the lesson_completion object' do
        expect(lesson_completion).to receive(:destroy)
        delete_request
      end

      it 'renders the create template' do
        delete_request
        expect(response).to render_template(:create)
      end
    end
  end
end
