require 'rails_helper'

RSpec.describe SmartRedirect do
  subject(:smart_redirect) { SmartRedirect.new(request, session) }

  let(:request) {
    double(
      'Request',
      fullpath: fullpath,
      request_method: request_method,
      xhr?: ajax_request?,
    )
  }
  let(:session) { { previous_url: '' } }
  let(:fullpath) { '/courses' }
  let(:request_method) { 'GET' }
  let(:ajax_request?) { false }

  describe '#path' do

    it 'returns a safe path' do
      smart_redirect.set_redirect_path
      expect(session[:previous_url]).to eql('/courses' )
    end

    context 'when request path is blacklisted' do
      let(:fullpath) { '/home' }

      it 'returns nil' do
        smart_redirect.set_redirect_path
        expect(session[:previous_url]).to eql('')
      end
    end

    context 'when the request is auth related' do
      let(:fullpath) { '/users/auth' }

      it 'returns nil' do
        smart_redirect.set_redirect_path
        expect(session[:previous_url]).to eql('')
      end
    end

    context 'when a post request' do
      let(:request_method) { 'POST' }

      it 'returns nil' do
        smart_redirect.set_redirect_path
        expect(session[:previous_url]).to eql('')
      end
    end

    context 'when a ajax request' do
      let(:ajax_request?) { true }

      it 'returns nil' do
        smart_redirect.set_redirect_path
        expect(session[:previous_url]).to be_eql('')
      end
    end
  end
end
