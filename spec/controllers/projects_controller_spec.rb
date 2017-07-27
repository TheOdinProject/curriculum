# require 'rails_helper'
#
# RSpec.describe ProjectsController, type: :controller do
#   let(:student) { double('Student', id: '1', admin?: false) }
#   let(:admin) { double('Admin', id: '2', admin?: true) }
#   let(:lesson) { double('Lesson', slug: 'building-blocks', id: '1') }
#
#   let(:valid_project_attrs) { { repo_url: 'https://github.com/user/repo' } }
#   let(:invalid_project_attrs) { { repo_url: 'https://github.co' } }
#
#   let(:valid_params) {
#     {
#       lesson_id: lesson.slug,
#       project: valid_project_attrs
#     }
#   }
#   let(:invalid_params) {
#     {
#       lesson_id: lesson.slug,
#       project: invalid_project_attrs
#     }
#   }
#
#   let(:projects) { double('ProjectsRelation') }
#   let(:projects_association) { double('ProjectsAssociation') }
#   let(:student_project) {
#     double('Project', valid_project_attrs.merge(id: '1', user: student))
#   }
#   let(:admin_user_project) {
#     double('Project', valid_project_attrs.merge(id: '2', user: admin))
#   }
#   let(:errors) {
#     {
#       'repo_url': ['must start with http://github.com/ or https://github.com/']
#     }
#   }
#
#   before do
#     allow(Lesson).to receive_message_chain(:friendly, :find)
#       .with('1').and_return(lesson)
#   end
#
#   def stub_current_user(user)
#     allow(controller).to receive(:current_user).and_return(student)
#   end
#
#   def stub_lesson
#     allow(Lesson).to receive_message_chain(:friendly, :find)
#       .with(valid_params[:lesson_id]).and_return(lesson)
#   end
#
#   def stub_project(project_id, project)
#     allow(Project).to receive(:find).with(project_id).and_return(project)
#   end
#
#   def stub_new_project_method(lesson_id)
#     allow(student).to receive(:projects).and_return(projects_association)
#     allow(projects_association).to receive(:new).and_return(student_project)
#     allow(student_project).to receive(:lesson_id=).with(lesson_id)
#       .and_return(student_project)
#   end
#
#   def stub_authorize(action, resource)
#     allow(controller).to receive(:authorize!).with(action, resource)
#       .and_return(resource)
#   end
#
#   def stub_authorize_to_raise(action, resource)
#     allow(controller).to receive(:authorize!).with(action, resource)
#       .and_raise(CanCan::AccessDenied)
#   end
#
#   def stub_recent_submissions
#     allow(Project).to receive(:all_submissions).with(lesson.id)
#       .and_return(projects)
#     allow(projects).to receive(:limit).with(10).and_return(projects)
#   end
#
#   describe 'GET #index' do
#
#     let(:projects) { [project] }
#     let(:project) { double('Project') }
#     let(:decorated_projects) { [decorated_project] }
#     let(:decorated_project) { double('ProjectDecorator') }
#
#     before do
#       allow(Project).to receive(:all_submissions).with('1').
#         and_return(projects)
#       allow(ProjectDecorator).to receive(:new).with(project).
#         and_return(decorated_project)
#     end
#
#     it 'renders the project index template' do
#       get :index, params: { lesson_id: '1' }
#       expect(response).to render_template(:index)
#     end
#
#     it 'assigns @projects' do
#       get :index, params: { lesson_id: '1' }
#       expect(assigns(:projects)).to eq(decorated_projects)
#     end
#   end
#
#   describe 'POST #create' do
#     subject { post :create, params: valid_params, xhr: true }
#
#     context 'unauthenticated' do
#       it_behaves_like 'unauthenticated request'
#     end
#
#     context 'authenticated' do
#       before do
#         stub_current_user(student)
#         stub_lesson
#         stub_new_project_method(lesson.id)
#         stub_recent_submissions
#       end
#
#       context 'valid values' do
#         before { allow(student_project).to receive(:save).and_return(true) }
#
#         it 'assigns recent submissions' do
#           subject
#           expect(assigns(:submissions)).to eq(projects)
#         end
#
#         it 'renders the create template' do
#           expect(subject).to render_template(:create)
#         end
#       end
#
#       context 'invalid values' do
#         subject { post :create, params: invalid_params, xhr: true }
#
#         before do
#           allow(student_project).to receive(:save).and_return(false)
#           allow(student_project).to receive(:errors).and_return(errors)
#         end
#
#         it 'renders the create template' do
#           expect(subject).to render_template(:create)
#         end
#       end
#     end
#   end
#
#   describe 'PATCH #update' do
#     subject {
#       patch :update, params: valid_params.merge(id: student_project.id), xhr: true
#     }
#
#     context 'unauthenticated' do
#       it_behaves_like 'unauthenticated request'
#     end
#
#     context 'authenticated' do
#       context 'standard user' do
#         describe 'can update his/her project' do
#           before do
#             stub_current_user(student)
#             stub_lesson
#             stub_project(student_project.id, student_project)
#             stub_authorize(:update, student_project)
#           end
#
#           context 'valid values' do
#             before {
#               allow(student_project).to receive(:update).and_return(true)
#             }
#
#             it 'renders the update template' do
#               expect(subject).to render_template(:update)
#             end
#           end
#
#           context 'invalid values' do
#             before do
#               allow(student_project).to receive(:update).and_return(false)
#               allow(student_project).to receive(:errors).and_return(errors)
#             end
#
#             it 'renders the update template' do
#               expect(subject).to render_template(:update)
#             end
#           end
#         end
#
#         describe 'cannot update other user\'s project' do
#           let(:request) {
#             patch :update, params: valid_params.merge(id: admin_user_project.id),
#               xhr: true
#           }
#
#           before do
#             stub_current_user(student)
#             stub_lesson
#             stub_project(admin_user_project.id, admin_user_project)
#             stub_authorize_to_raise(:update, admin_user_project)
#             request
#           end
#
#           it_behaves_like 'unauthorized request'
#         end
#       end
#
#       context 'admin user' do
#         describe 'can update his/her project' do
#           let(:request) {
#             patch :update, params: valid_params.merge(id: admin_user_project.id),
#               xhr: true
#           }
#
#           before do
#             stub_current_user(admin)
#             stub_lesson
#             stub_project(admin_user_project.id, admin_user_project)
#             stub_authorize(:update, admin_user_project)
#           end
#
#           context 'valid values' do
#             before {
#               allow(admin_user_project).to receive(:update).and_return(true)
#             }
#
#             it 'renders the update template' do
#               expect(request).to render_template(:update)
#             end
#           end
#
#           context 'invalid values' do
#             before do
#               allow(admin_user_project).to receive(:update).and_return(false)
#               allow(admin_user_project).to receive(:errors).and_return(errors)
#             end
#
#             it 'renders the update template' do
#               expect(request).to render_template(:update)
#             end
#           end
#         end
#
#         describe 'can update other user\'s project' do
#           let(:request) {
#             patch :update, params: valid_params.merge(id: student_project.id),
#               xhr: true
#           }
#
#           before do
#             stub_current_user(admin)
#             stub_lesson
#             stub_project(student_project.id, student_project)
#             allow(controller).to receive(:authorize!)
#               .with(:update, student_project).and_return(student_project)
#           end
#
#           context 'valid values' do
#             before {
#               allow(student_project).to receive(:update).and_return(true)
#             }
#
#             it 'renders the update template' do
#               expect(subject).to render_template(:update)
#             end
#           end
#
#           context 'invalid values' do
#             before do
#               allow(student_project).to receive(:update).and_return(false)
#               allow(student_project).to receive(:errors).and_return(errors)
#             end
#
#             it 'renders the update template' do
#               expect(subject).to render_template(:update)
#             end
#           end
#         end
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     subject {
#       delete :destroy,
#              params: { lesson_id: lesson.slug, id: student_project.id },
#              xhr: true
#     }
#
#     context 'unauthenticated' do
#       it_behaves_like 'unauthenticated request'
#     end
#
#     context 'authenticated' do
#       context 'standard user' do
#         context 'can destroy his/her project' do
#           before do
#             stub_current_user(student)
#             stub_lesson
#             stub_project(student_project.id, student_project)
#             stub_authorize(:destroy, student_project)
#             stub_new_project_method(lesson.id)
#             stub_recent_submissions
#             allow(student_project).to receive(:destroy)
#           end
#
#           it 'assigns recent submissions' do
#             subject
#             expect(assigns(:submissions)).to eq(projects)
#           end
#
#           it 'renders the destroy template' do
#             expect(subject).to render_template(:destroy)
#           end
#         end
#
#         context 'cannot destroy other user\'s project' do
#           let(:request) {
#             delete :destroy, params: {
#               lesson_id: lesson.slug, id: admin_user_project.id
#             }, xhr: true
#           }
#
#           before do
#             stub_current_user(student)
#             stub_lesson
#             stub_project(admin_user_project.id, admin_user_project)
#             stub_authorize_to_raise(:destroy, admin_user_project)
#           end
#
#           it_behaves_like 'unauthorized request'
#         end
#       end
#
#       context 'admin user' do
#         describe 'can destroy his/her project' do
#           let(:request) {
#             delete :destroy, params: {
#               lesson_id: lesson.slug, id: admin_user_project.id
#             }, xhr: true
#           }
#
#           before do
#             stub_current_user(admin)
#             stub_lesson
#             stub_project(admin_user_project.id, admin_user_project)
#             stub_authorize(:destroy, admin_user_project)
#             stub_new_project_method(lesson.id)
#             stub_recent_submissions
#             allow(admin_user_project).to receive(:destroy)
#           end
#
#           it 'assigns recent submissions' do
#             request
#             expect(assigns(:submissions)).to eq(projects)
#           end
#
#           it 'renders the destroy template' do
#             expect(request).to render_template(:destroy)
#           end
#         end
#
#         describe 'can destroy other user\'s project' do
#           let(:request) { subject }
#
#           before do
#             stub_current_user(admin)
#             stub_lesson
#             stub_project(student_project.id, student_project)
#             stub_authorize(:destroy, student_project)
#             stub_new_project_method(lesson.id)
#             stub_recent_submissions
#             allow(student_project).to receive(:destroy)
#           end
#
#           it 'assigns recent submissions' do
#             request
#             expect(assigns(:submissions)).to eq(projects)
#           end
#
#           it 'renders the destroy template' do
#             expect(request).to render_template(:destroy)
#           end
#         end
#       end
#     end
#   end
# end
