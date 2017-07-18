Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'registrations',
    omniauth_callbacks: 'omniauth_callbacks',
    confirmations: 'confirmations'
  }

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy', method: :delete
    get 'sign_up' => 'devise/registrations#new'
    get 'signup' => 'devise/registrations#new'
    get '/confirm_email' => 'users#send_confirmation_link'
  end

  get 'home' => 'static_pages#home'
  get 'students' => 'users#index'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contact' => 'static_pages#contact'
  get 'getting_involved' => 'static_pages#getting_involved'
  get 'contributing' => 'static_pages#contributing'
  get 'legal' => 'static_pages#legal'
  get 'cla' => 'static_pages#cla'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'styleguide' => 'static_pages#style_guide'
  get 'success_stories' => 'static_pages#success_stories'
  get 'press' => redirect('https://docs.google.com/document/d/1FmjfYvOsQ-syoOCzuvPXv96TCxeJAT9m-Wl7trgNZcE/pub')
  get 'sitemap' => 'sitemap#index', defaults: { format: 'xml' }

  # failure route if github information returns invalid
  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :users, only: [:show, :update]
  get 'dashboard' => 'users#show', as: :dashboard

  resources :courses, only: %i(index show) do
    resources :lessons, only: :show
  end

  resources :lessons, only: :show do
    resources :projects, only: %i(index create update destroy) do
      resources :votes, only: %i(index create)
      delete 'vote', to: 'votes#destroy'
    end

    resources :lesson_completions, only: %i(create destroy), as: 'completions'
  end

  # Explicitly redirect deprecated routes (301)

  get '/courses/curriculum' => redirect('/courses')
  get 'curriculum' => redirect('/courses')
  get 'scheduler' => redirect('/courses')
end
