require 'rails_helper'

RSpec.describe 'Old Course Route Redirects', type: :request do
  context 'when a request is made for the old foundations path' do
    it 'redirects the old foundations course page route' do
      get '/courses/foundations'
      expect(response).to redirect_to('/paths/foundations/courses/foundations')
    end

    it 'redirects the old foundations course lesson page route' do
      get '/courses/foundations/lessons/example_lesson'
      expect(response).to redirect_to('/paths/foundations/courses/foundations/lessons/example_lesson')
    end
  end

  context 'when a request is made for the old full stack ruby on rails path' do
    it 'redirects the old ruby course page route' do
      get '/courses/ruby-programming'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/ruby-programming')
    end

    it 'redirects the old ruby course lesson page route' do
      get '/courses/ruby-programming/lessons/example_lesson'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/example_lesson')
    end

    it 'redirects the old database course page route' do
      get '/courses/databases'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/databases')
    end

    it 'redirects the old database course lesson page route' do
      get '/courses/databases/lessons/example_lesson'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/databases/lessons/example_lesson')
    end

    it 'redirects the old rails course page route' do
      get '/courses/ruby-on-rails'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/ruby-on-rails')
    end

    it 'redirects the old rails course lesson page route' do
      get '/courses/ruby-on-rails/lessons/example_lesson'
      expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/example_lesson')
    end

    context 'when full stack javascript path' do
      it 'redirects the old node js course page route' do
        get '/courses/nodeJS'
        expect(response).to redirect_to('/paths/full-stack-javascript/courses/nodejs')
      end

      it 'redirects the old node js course lesson page route' do
        get '/courses/nodeJS/lessons/example_lesson'
        expect(response).to redirect_to('/paths/full-stack-javascript/courses/nodejs/lessons/example_lesson')
      end
    end

    context 'when a request is made for a old shared course' do
      context 'when the user is signed in and enrolled in the full stack rails path' do
        before do
          user = create(:user, path: create(:path, title: 'Full Stack Ruby on Rails'))
          sign_in user
        end

        it 'redirects the old javascript course to the full stack rails path javascript course' do
          get '/courses/javascript'
          expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/javascript')
        end

        it 'redirects old javascript course lessons to the full stack rails path javascript course lessons' do
          get '/courses/javascript/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/javascript/lessons/example_lesson')
        end

        it 'redirects the old html and css course to the full stack rails path html and css course' do
          get '/courses/html-and-css'
          expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/html-and-css')
        end

        it 'redirects old html and css course lessons to the full stack rails path html and css course lessons' do
          get '/courses/html-and-css/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/html-and-css/lessons/example_lesson')
        end

        it 'redirects the old getting hired course to the full stack rails path getting hired course' do
          get '/courses/getting-hired'
          expect(response).to redirect_to('/paths/full-stack-ruby-on-rails/courses/getting-hired')
        end

        it 'redirects old getting hired course lessons to the full stack rails path getting hired course lessons' do
          get '/courses/getting-hired/lessons/example_lesson'
          expect(response)
            .to redirect_to('/paths/full-stack-ruby-on-rails/courses/getting-hired/lessons/example_lesson')
        end
      end

      context 'when the user is signed in and enrolled in the full stack js path' do
        before do
          user = create(:user, path: create(:path, title: 'Full Stack Javascript'))
          sign_in user
        end

        it 'redirects the old javascript course to the full stack js path javascript course' do
          get '/courses/javascript'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/javascript')
        end

        it 'redirects old javascript course lessons to the full stack js path javascript course lessons' do
          get '/courses/javascript/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/javascript/lessons/example_lesson')
        end

        it 'redirects the old html and css course to the full stack js path html and css course' do
          get '/courses/html-and-css'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/html-and-css')
        end

        it 'redirects old html and css course lessons to the full stack js path html and css course lessons' do
          get '/courses/html-and-css/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/html-and-css/lessons/example_lesson')
        end

        it 'redirects the old getting hired course to the full stack js path getting hired course' do
          get '/courses/getting-hired'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/getting-hired')
        end

        it 'redirects old getting hired course lessons to the full stack js path getting hired course lessons' do
          get '/courses/getting-hired/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/getting-hired/lessons/example_lesson')
        end
      end

      context 'when the user is not signed in' do
        it 'redirects the old javascript course to the full stack js path javascript course' do
          get '/courses/javascript'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/javascript')
        end

        it 'redirects old javascript course lessons to the full stack js path javascript course lessons' do
          get '/courses/javascript/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/javascript/lessons/example_lesson')
        end

        it 'redirects the old html and css course to the full stack js path html and css course' do
          get '/courses/html-and-css'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/html-and-css')
        end

        it 'redirects old html and css course lessons to the full stack javascript path html and css course lessons' do
          get '/courses/html-and-css/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/html-and-css/lessons/example_lesson')
        end

        it 'redirects the old getting hired course to the full stack js path getting hired course' do
          get '/courses/getting-hired'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/getting-hired')
        end

        it 'redirects old getting hired course lessons to the full stack js path getting hired course lessons' do
          get '/courses/getting-hired/lessons/example_lesson'
          expect(response).to redirect_to('/paths/full-stack-javascript/courses/getting-hired/lessons/example_lesson')
        end
      end
    end
  end
end
