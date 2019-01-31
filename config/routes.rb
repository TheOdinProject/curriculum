Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks',
  }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy', method: :delete
    get 'sign_up' => 'devise/registrations#new'
    get 'signup' => 'devise/registrations#new'
    get '/confirm_email' => 'users#send_confirmation_link'
  end

  namespace :api do
    resources :lesson_completions, only: [:index]
  end

  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contributing' => 'static_pages#contributing'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'styleguide' => 'static_pages#style_guide'
  get 'success_stories' => 'static_pages#success_stories'
  get 'sitemap' => 'sitemap#index', defaults: { format: 'xml' }

  # failure route if github information returns invalid
  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :users, only: [:show, :update]
  get 'dashboard' => 'users#show', as: :dashboard

  # Deprecated Route to Introduction to Web Development from external links
  get '/courses/introduction-to-web-development' => redirect('/courses/web-development-101')

  resources :courses, only: %i(index show) do
    resources :lessons, only: :show
  end

  resources :lessons, only: :show do
    resources :projects, only: %i(index create update destroy) do
      resources :votes, only: %i(create)
      delete 'vote', to: 'votes#destroy'
    end

    resources :lesson_completions, only: %i(create), as: 'completions'
    delete 'lesson_completions' => 'lesson_completions#destroy', :as => 'lesson_completions'
  end

  resources :reports, only: :create

  match '/404' => 'errors#not_found', via: [ :get, :post, :patch, :delete ]

  # Explicitly redirect deprecated routes (301)

  get '/courses/curriculum' => redirect('/courses')
  get 'curriculum' => redirect('/courses')
  get 'scheduler' => redirect('/courses')
end
