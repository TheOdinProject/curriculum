 require 'rails_helper'

describe LessonCompletionsController do

  let(:student) { double('User', id: '1') }
  let(:lesson) { double('Lesson', id: '1') }
  let(:lc_attrs) { { lesson_id: lesson.id, student_id: student.id } }
  let(:lesson_completion) { double('LessonCompletion', lc_attrs) }

  context "before authentication" do
    it "POST #create unauthorized" do
      post :create, lc_attrs
      expect(response).to have_http_status(:unauthorized)
    end

    it "DELETE #destroy unauthorized" do
      delete :destroy, lesson_id: lc_attrs[:lesson_id]
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "after authentication" do
    before do
      allow(controller).to receive(:current_user).and_return(student)
      allow(Lesson).to receive(:find).with(lc_attrs[:lesson_id]).
          and_return(lesson)
    end

    describe "POST #create" do
      it "saves the lesson_completion record to the database" do
        expect{
          post :create, lc_attrs
        }.to change(LessonCompletion, :count).by(1)
      end

      it 'renders the template' do
        post :create, lc_attrs
        expect(response).to render_template('create')
      end
    end

    describe "DELETE #destroy" do
      before do
        lesson_completions = double('LessonCompletions')
        allow(LessonCompletion).to receive(:where).with(lc_attrs).
          and_return(lesson_completions)

        allow(lesson_completions).to receive(:first).and_return(lesson_completion)
        allow(lesson_completion).to receive(:destroy)
      end

      it "destroys the lesson_completion object" do
        expect(lesson_completion).to receive(:destroy)
        delete :destroy, lesson_id: lc_attrs[:lesson_id]
      end

      it 'renders the template' do
        delete :destroy, lesson_id: lc_attrs[:lesson_id]
        expect(response).to render_template('create')
      end
    end
  end
end
