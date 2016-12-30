require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:student) { double('Student', id: '1', admin?: false) }
  let(:admin) { double('Admin', id: '2', admin?: true) }
  let(:lesson) { double('Lesson', slug: 'building-blocks', id: '1') }

  let(:valid_project_attrs) { { repo_url: 'https://github.com/user/repo' } }
  let(:invalid_project_attrs) { { repo_url: 'https://github.co' } }

  let(:valid_params) {
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
  let(:student_project) {
    double('Project', valid_project_attrs.merge(id: '1', user: student))
  }
  let(:admin_user_project) {
    double('Project', valid_project_attrs.merge(id: '2', user: admin))
  }
  let(:errors) {
    {
      'repo_url': ['must start with http://github.com/ or https://github.com/']
    }
  }

  describe 'POST #create' do
    subject { post :create, params: valid_params }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      before do
        allow(controller).to receive(:current_user).and_return(student)
        allow(Lesson).to receive_message_chain(:friendly, :find)
          .with(valid_params[:lesson_id]).and_return(lesson)

        allow(student).to receive(:projects)
          .and_return(projects_association)
        allow(projects_association).to receive(:new).and_return(student_project)
        allow(student_project).to receive(:lesson_id=).with(lesson.id)
          .and_return(student_project)
      end

      context 'valid values' do
        before do
          allow(student_project).to receive(:save).and_return(true)
        end

        it 'returns a status of 201' do
          expect(subject).to have_http_status(201)
        end
      end

      context 'invalid values' do
        subject { post :create, params: invalid_params }

        before do
          allow(student_project).to receive(:save).and_return(false)
          allow(student_project).to receive(:errors).and_return(errors)
        end

        it 'returns a status of 422' do
          expect(subject).to have_http_status(422)
        end
      end
    end
  end

  describe 'PATCH #update' do
    subject {
      patch :update, params: valid_params.merge(id: student_project.id)
    }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      context 'standard user' do
        context 'can update his/her project' do
          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Project).to receive(:find).with(student_project.id)
              .and_return(student_project)
            allow(controller).to receive(:authorize!)
              .with(:update, student_project).and_return(student_project)
          end

          context 'valid values' do
            before {
              allow(student_project).to receive(:update).and_return(true)
            }

            it 'returns a status of 200' do
              expect(subject).to have_http_status(200)
            end
          end

          context 'invalid values' do
            before do
              allow(student_project).to receive(:update).and_return(false)
              allow(student_project).to receive(:errors).and_return(errors)
            end

            it 'returns a status of 422' do
              expect(subject).to have_http_status(422)
            end
          end
        end

        context "cannot update other user's project" do
          let(:request) {
            patch :update, params: valid_params.merge(id: admin_user_project.id)
          }

          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Project).to receive(:find).with(admin_user_project.id)
              .and_return(admin_user_project)
            allow(controller).to receive(:authorize!)
              .with(:update, admin_user_project).and_raise(CanCan::AccessDenied)
            request
          end

          it 'redirects to the root path' do
            expect(response).to redirect_to(root_path)
          end

          it 'sets the flash' do
            expect(flash[:alert]).to eq('You are not authorized to do that')
          end
        end
      end

      context 'admin user' do
        context 'can update his/her project' do
          let(:request) {
            patch :update, params: valid_params.merge(id: admin_user_project.id)
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Project).to receive(:find).with(admin_user_project.id)
              .and_return(admin_user_project)
            allow(controller).to receive(:authorize!)
              .with(:update, admin_user_project).and_return(admin_user_project)
          end

          context 'valid values' do
            before {
              allow(admin_user_project).to receive(:update).and_return(true)
            }

            it 'returns a status of 200' do
              expect(request).to have_http_status(200)
            end
          end

          context 'invalid values' do
            before do
              allow(admin_user_project).to receive(:update).and_return(false)
              allow(admin_user_project).to receive(:errors).and_return(errors)
            end

            it 'returns a status of 422' do
              expect(request).to have_http_status(422)
            end
          end
        end

        context "can update other user's project" do
          let(:request) {
            patch :update, params: valid_params.merge(id: student_project.id)
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Project).to receive(:find).with(student_project.id)
              .and_return(student_project)
            allow(controller).to receive(:authorize!)
              .with(:update, student_project).and_return(student_project)
          end

          context 'valid values' do
            before {
              allow(student_project).to receive(:update).and_return(true)
            }

            it 'returns a status of 200' do
              expect(subject).to have_http_status(200)
            end
          end

          context 'invalid values' do
            before do
              allow(student_project).to receive(:update).and_return(false)
              allow(student_project).to receive(:errors).and_return(errors)
            end

            it 'returns a status of 422' do
              expect(subject).to have_http_status(422)
            end
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject {
      delete :destroy, params: {
        lesson_id: lesson.slug, id: student_project.id
      }
    }

    context 'unauthorized' do
      it_behaves_like 'unauthorized request'
    end

    context 'authorized' do
      context 'standard user' do
        context 'can destroy his/her project' do
          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Project).to receive(:find).with(student_project.id)
              .and_return(student_project)
            allow(controller).to receive(:authorize!)
              .with(:destroy, student_project).and_return(student_project)
            allow(student_project).to receive(:destroy)
          end

          it 'returns a ok header' do
            expect(subject).to have_http_status(:ok)
          end
        end

        context "cannot destroy other user's project" do
          let(:request) {
            delete :destroy, params: {
              lesson_id: lesson.slug, id: admin_user_project.id
            }
          }

          before do
            allow(controller).to receive(:current_user).and_return(student)
            allow(Project).to receive(:find).with(admin_user_project.id)
              .and_return(admin_user_project)
            allow(controller).to receive(:authorize!)
              .with(:destroy, admin_user_project)
              .and_raise(CanCan::AccessDenied)
            request
          end

          it 'redirects to the root path' do
            expect(response).to redirect_to(root_path)
          end

          it 'sets the flash' do
            expect(flash[:alert]).to eq('You are not authorized to do that')
          end
        end
      end

      context 'admin user' do
        context 'can destroy his/her project' do
          let(:request) {
            delete :destroy, params: {
              lesson_id: lesson.slug, id: admin_user_project.id
            }
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Project).to receive(:find).with(admin_user_project.id)
              .and_return(admin_user_project)
            allow(controller).to receive(:authorize!)
              .with(:destroy, admin_user_project).and_return(admin_user_project)
            allow(admin_user_project).to receive(:destroy)
          end

          it 'returns a ok header' do
            expect(request).to have_http_status(:ok)
          end
        end

        context "can destroy other user's project" do
          let(:request) {
            delete :destroy, params: {
              lesson_id: lesson.slug, id: student_project.id
            }
          }

          before do
            allow(controller).to receive(:current_user).and_return(admin)
            allow(Project).to receive(:find).with(student_project.id)
              .and_return(student_project)
            allow(controller).to receive(:authorize!)
              .with(:destroy, student_project).and_return(student_project)
            allow(student_project).to receive(:destroy)
          end

          it 'returns a ok header' do
            expect(request).to have_http_status(:ok)
          end
        end
      end
    end
  end

  describe 'GET #all_submissions' do
    subject {
      get :all_submissions, params: { lesson_id: valid_params[:lesson_id] }
    }

    before do
      allow(Lesson).to receive_message_chain(:friendly, :find)
        .and_return(lesson)

      allow(Project).to receive(:all_submissions).with(lesson.id)
        .and_return(projects)
    end

    it 'calls the .all_submissions method' do
      expect(Project).to receive(:all_submissions).with(lesson.id)
      subject
    end

    it 'renders json' do
      subject
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'GET #recent_submissions' do
    subject {
      get :recent_submissions, params: { lesson_id: valid_params[:lesson_id] }
    }

    let(:recent_projects) { double('Projects') }

    before do
      allow(Lesson).to receive_message_chain(:friendly, :find)
        .and_return(lesson)

      allow(Project).to receive(:all_submissions).with(lesson.id)
        .and_return(projects)
      allow(projects).to receive(:limit).with(10).and_return(recent_projects)
    end

    it 'calls the .all_submissions and limit' do
      expect(Project).to receive_message_chain(:all_submissions, :limit)
        .with(lesson.id).with(10)
      subject
    end

    it 'returns json' do
      subject
      expect(response.content_type).to eq('application/json')
    end
  end
end
