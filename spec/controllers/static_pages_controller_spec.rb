require 'rails_helper'

describe StaticPagesController do

  describe 'GET home' do
    it 'renders the home page' do
      get :home
      expect(response).to render_template(:home)
    end

    it 'assigns @navbar' do
      get :home
      expect(assigns(:navbar)).to eql(false)
    end

    it 'assigns @is_home_page' do
      get :home
      expect(assigns(:is_home_page)).to eql(true)
    end
  end

  describe 'GET about' do
    it 'renders the about page' do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe 'GET getting involved' do
    it 'renders the getting involved page' do
      get :getting_involved
      expect(response).to render_template(:getting_involved)
    end
  end

  describe 'GET studygroups' do
    it 'renders the study groups page' do
      get :studygroups
      expect(response).to render_template(:studygroups)
    end
  end

  describe 'GET legal' do
    it 'renders the legal page' do
      get :legal
      expect(response).to render_template(:legal)
    end
  end

  describe 'GET tou' do
    it 'renders the terms of use page' do
      get :tou
      expect(response).to render_template(:tou)
    end
  end

  describe 'GET cla' do
    it 'renders the contributors licence agreement page' do
      get :cla
      expect(response).to render_template(:cla)
    end
  end

  describe 'GET suggestion' do
    let(:params) {
      { pathname: path_name, suggestion: suggestion_body, format: 'json' }
    }
    let(:path_name) { '/' }
    let(:suggestion_body) { 'hello' }
    let(:user_identifier) { 'student@odin.com' }
    let(:contact_mailer) { double('ContactMailer') }
    let(:current_user) { double('current_user', email: user_identifier) }
    let(:user_signed_in?) { true }

    before do
      allow(ContactMailer).to receive(:suggestion_email).
        with(suggestion_body, path_name, user_identifier).
        and_return(contact_mailer)

      allow(controller).to receive(:user_signed_in?).and_return(user_signed_in?)
      allow(controller).to receive(:current_user).and_return(current_user)
      allow(contact_mailer).to receive(:deliver_now)
    end

    it 'sends the sugestion email' do
      post :suggestion, params: params
      expect(contact_mailer).to have_received(:deliver_now)
    end

    it 'returns the suggestion body in JSON' do
      post :suggestion, params: params
      expect(response.body).to eql('hello')
    end

    context 'when no suggestion body has been entered' do
      let(:suggestion_body) { '' }

      it 'will not send the suggestion email' do
        post :suggestion, params: params
        expect(contact_mailer).not_to have_received(:deliver_now)

      end
    end

    context 'when the user is not signed in' do
      let(:user_signed_in?) { false }
      let(:user_identifier) { 'Anonymous'}

      it 'will use < no logged in > for the user identifier' do
        post :suggestion, params: params
        expect(contact_mailer).to have_received(:deliver_now)
      end
    end
  end
end
