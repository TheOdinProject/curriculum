require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:student) { double('Student') }
  let(:lesson) { double('Lesson', slug: 'building-blocks', id: '1') }

  let(:valid_project_attrs) { { repo_url: 'https://github.com/user/repo' } }
  let(:invalid_project_attrs) { { repo_url: 'https://github.co' } }

  let(:params) {
    {
      lesson_id: lesson.slug,
      project: valid_project_attrs
    }
  }
  let(:invalid_params) {
    {
      lesson_id: lesson.slug,
      project: invalid_project_attrs
    }
  }

  let(:projects) { double('ProjectsRelation') }
  let(:projects_association) { double('ProjectsAssociation') }
  let(:project) { double('Project', valid_project_attrs.merge(id: '1')) }
  let(:errors) {
    { 'repo_url': ['must start with http://github.com/ or https://github.com/'] }
  }

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      before do
        allow(controller).to receive(:current_user).and_return(student)
        allow(Lesson).to receive_message_chain(:friendly, :find)
          .with(params[:lesson_id]).and_return(lesson)

        allow(student).to receive(:projects).and_return(projects_association)
        allow(projects_association).to receive(:new).and_return(project)
        allow(project).to receive(:lesson_id=).with(lesson.id)
          .and_return(project)
      end

      context 'valid values' do
        before do
          allow(project).to receive(:save).and_return(true)
        end

        it 'calls the save method' do
          expect(project).to receive(:save)
          subject
        end

        it 'returns a status of 201' do
          expect(subject).to have_http_status(201)
        end
      end

      context 'invalid values' do
        subject { post :create, params: invalid_params }
        before do
          allow(project).to receive(:save).and_return(false)
          allow(project).to receive(:errors).and_return(errors)
        end

        it 'calls the save method' do
          expect(project).to receive(:save)
          subject
        end

        it 'returns a status of 422' do
          expect(subject).to have_http_status(422)
        end
      end
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: params.merge(id: project.id) }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      before do
        allow(controller).to receive(:current_user).and_return(student)

        allow(Lesson).to receive_message_chain(:friendly, :find)
          .with(params[:lesson_id]).and_return(lesson)
        allow(student).to receive(:projects)
          .and_return(projects_association)

        allow(projects_association).to receive(:where)
          .with(lesson_id: lesson.id)
          .and_return(projects)
        allow(projects).to receive(:first).and_return(project)
      end

      context 'valid values' do
        before do
          allow(project).to receive(:update).and_return(true)
        end

        it 'calls the update method' do
          expect(project).to receive(:update)
          subject
        end

        it 'returns a status of 200' do
          expect(subject).to have_http_status(200)
        end
      end

      context 'invalid values' do
        before do
          allow(project).to receive(:update).and_return(false)
          allow(project).to receive(:errors).and_return(errors)
        end

        it 'calls the update method' do
          expect(project).to receive(:update)
          subject
        end

        it 'returns a status of 422' do
          expect(subject).to have_http_status(422)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject {
      delete :destroy, params: { lesson_id: lesson.slug, id: project.id }
    }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      before do
        allow(controller).to receive(:current_user).and_return(student)
        allow(Lesson).to receive_message_chain(:friendly, :find)
          .with(params[:lesson_id]).and_return(lesson)

        allow(student).to receive(:projects).and_return(projects_association)
        allow(projects_association).to receive(:where)
          .with(lesson_id: lesson.id)
          .and_return(projects)
        allow(projects).to receive(:first).and_return(project)

        allow(project).to receive(:destroy)
      end

      it 'calls the destroy method' do
        expect(project).to receive(:destroy)
        subject
      end

      it 'returns a ok header' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #all_submissions' do
    subject { get :all_submissions, params: { lesson_id: params[:lesson_id] } }

    before do
      allow(Lesson).to receive_message_chain(:friendly, :find)
        .and_return(lesson)

      allow(Project).to receive(:all_submissions).with(lesson.id)
        .and_return(projects)
    end

    it 'calls the .all_submissions method' do
      expect(Project).to receive(:all_submissions)
      subject
    end

    it 'renders json' do
      subject
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'GET #recent_submissions' do
    subject {
      get :recent_submissions, params: { lesson_id: params[:lesson_id] }
    }

    let(:recent_projects) { double('Projects') }

    before do
      allow(Lesson).to receive_message_chain(:friendly, :find)
        .and_return(lesson)

      allow(Project).to receive(:all_submissions).with(lesson.id)
        .and_return(projects)
      allow(projects).to receive(:limit).and_return(recent_projects)
    end

    it 'calls the .all_submissions and limit' do
      expect(Project).to receive_message_chain(:all_submissions, :limit)
      subject
    end

    it 'returns json' do
      subject
      expect(response.content_type).to eq('application/json')
    end
  end
end
