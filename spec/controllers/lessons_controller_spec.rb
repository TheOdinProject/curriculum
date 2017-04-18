require 'rails_helper'

RSpec.describe LessonsController do
  let(:lesson) { double('Lesson', id: 'abc123', has_submission?: false) }
  let(:ad) { double('Ad') }
  let(:params) { { course_title: 'web-development-101', id: lesson_id } }
  let(:lesson_id) { 'abc123' }
  let(:current_user) { double('User', id: '1') }

  before do
    allow(Lesson).to receive_message_chain(:friendly, :find)
      .with(params[:id]).and_return(lesson)

    allow(controller).to receive(:current_user)
      .and_return(current_user)

    allow(ENV).to receive(:[]).with('SHOW_ADS')
      .and_return(true)
  end

  describe 'GET show' do
    it 'renders the lesson' do
      get :show, params: params
      expect(response).to render_template(:show)
    end

    it 'assigns @lesson' do
      get :show, params: params
      expect(assigns(:lesson)).to eql(lesson)
    end

    it 'assigns @lower_banner_ad' do
      get :show, params: params
      expect(assigns(:lower_banner_ad)).to eql(true)
    end

    it 'assigns @right_box_ad' do
      get :show, params: params
      expect(assigns(:right_box_ad)).to eql(true)
    end

    context 'when lesson cannot be found' do
      let(:lesson_id) { '123' }
      let(:request) { get :show, params: params }

      before do
        allow(Lesson).to receive(:friendly).and_return(lesson)
        allow(lesson).to receive(:find).with('123')
          .and_raise(ActiveRecord::RecordNotFound)
        request
      end

      it 'returns a status of 404' do
        expect(response).to have_http_status(404)
      end

      it 'renders the 404 page' do
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end

    context 'when show_ads? is false' do
      let(:env_show_ads) { false }
      let(:show_ad) { false }

      before do
        allow(ENV).to receive(:[]).with('SHOW_ADS')
          .and_return(env_show_ads)

        allow(Ad).to receive(:show_ads?).and_return(show_ad)
      end

      context 'when show ads environment variable is false' do
        context 'and show ads to current user is true' do
          let(:show_ad) { true }

          it 'does not assign @lower_banner_ad' do
            get :show, params: params
            expect(assigns(:lower_banner_ad)).to be_nil
          end

          it 'does not assign @right_box_ad' do
            get :show, params: params
            expect(assigns(:right_box_ad)).to be_nil
          end
        end

        context 'and show ads to current user is false' do
          it 'does not assign @lower_banner_ad' do
            get :show, params: params
            expect(assigns(:lower_banner_ad)).to be_nil
          end

          it 'does not assign @right_box_ad' do
            get :show, params: params
            expect(assigns(:right_box_ad)).to be_nil
          end
        end
      end

      context 'when show ads environment variable is true' do
        let(:env_show_ads) { true }

        context 'and show ads to current user is false' do
          it 'does not assign @lower_banner_ad' do
            get :show, params: params
            expect(assigns(:lower_banner_ad)).to be_nil
          end

          it 'does not assign @right_box_ad' do
            get :show, params: params
            expect(assigns(:right_box_ad)).to be_nil
          end
        end
      end
    end
  end
end
