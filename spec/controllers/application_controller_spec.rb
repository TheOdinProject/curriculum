require 'rails_helper'

RSpec.describe ApplicationController do
  let(:user) { FactoryGirl.build(:user, confirmed_at: confirm_date) }
  let(:smart_redirect) { double('SmartRedirect') }
  let(:session) { {} }
  let(:confirm_date) { Date.today }

  before do
    allow(controller).to receive(:session).and_return(session)
    allow(smart_redirect).to receive(:set_redirect_path)
    allow(controller).to receive(:current_user).and_return(user)

    allow(SmartRedirect).to receive(:new).with(request, session).
      and_return(smart_redirect)
  end

  describe 'after_sign_in_path_for' do
    it 'returns the home path with the refferer as a paramter' do
      expect(controller.after_sign_out_path_for(user)).
        to eql('/home?ref=logout')
    end
  end

  describe '#store_redirect_path' do
    it 'stores the users previous url' do
      expect(smart_redirect).to receive(:set_redirect_path)
      controller.store_redirect_path
    end
  end

  describe '#after_sign_in_path_for' do
    it 'redirects the user to the courses path' do
      expect(controller.after_sign_in_path_for(user)).
        to eql('/courses?ref=login')
    end

    context 'when the user has a previous url' do
      let(:session) { { previous_url: '/faq' } }

      it 'redirects to the previous url' do
        expect(controller.after_sign_in_path_for(user)).
          to eql('/faq')
      end
    end

    context 'when the user has not confirmed' do
      let(:confirm_date) { nil }

      it 'displays the flash message' do
        controller.after_sign_in_path_for(user)
        expect(flash['warning']).to render_template('layouts/_confirm_email')
      end
    end
  end

  describe '#not_found_error' do
    it 'raises a not found error' do
      expect{ controller.not_found_error }.to raise_error('Not Found')
    end
  end

  describe '#bad_request' do
    it 'raises a bad request error' do
      expect{ controller.bad_request }.to raise_error('Bad Request')
    end
  end
end
