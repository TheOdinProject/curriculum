require 'spec_helper'

describe SitemapController do

  describe 'GET #index' do

    let :static_pages_urls do
      [root_url, about_url, contact_url, faq_url, login_url, signup_url]
    end

    it 'renders the sitemap template' do
      get :index, format: :xml
      expect(response).to render_template(:index)
    end

    it 'assigns @static_pages' do
      get :index, format: :xml
      expect(assigns(:static_pages)).to eql(static_pages_urls)
    end

    it 'assigns @courses' do
      course = [FactoryGirl.create(:course)]

      get :index, format: :xml

      expect(assigns(:courses)).to eql(course)
    end

  end

end
