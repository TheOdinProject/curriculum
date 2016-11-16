Rails.application.routes.draw do
devise_for :users,
  :controllers => { :registrations => "registrations",
    :omniauth_callbacks => "omniauth_callbacks",
    :confirmations => "confirmations" }
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy', :method => :delete
    get 'sign_up' => 'devise/registrations#new'
    get 'signup' => 'devise/registrations#new'
    get '/confirm_email' => 'users#send_confirmation_link'
  end

  root :to => 'static_pages#home'
  get 'home' => 'static_pages#home'
  post 'thank_you' => 'static_pages#send_feedback'
  post 'suggestion' => 'static_pages#suggestion'
  get 'students' => 'users#index'
  get 'about' => "static_pages#about"
  get 'faq' => "static_pages#faq"
  get 'contact' => "static_pages#contact"
  get 'getting_involved' => "static_pages#getting_involved"
  get 'contributing' => "static_pages#contributing"
  get 'legal' => "static_pages#legal"
  get 'cla' => "static_pages#cla"
  get 'tou' => "static_pages#tou"
  get 'press' => redirect('https://docs.google.com/document/d/1FmjfYvOsQ-syoOCzuvPXv96TCxeJAT9m-Wl7trgNZcE/pub')
  get 'sitemap' => 'sitemap#index', :defaults => { :format => 'xml' }

  #failure route if github information returns invalid
  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :users, :only => [:show, :index, :edit, :update]

  # ***** COURSES AND LESSONS ROUTES *****
  # deprecated /courses/curriculum route redirect
  get '/courses/curriculum' => redirect('/courses')

  resources :courses, only: [:index, :show ] do
    resources :lessons, only: [:show]
  end
  resources :lessons, only: [:show]

  post 'lesson_completions' => 'lesson_completions#create'
  delete 'lesson_completions/:lesson_id' => 'lesson_completions#destroy', :as => 'lesson_completion'

  # Explicitly redirect deprecated routes (301)

  get 'curriculum' => redirect('/courses')
  get 'scheduler' => redirect('/courses')
  get ':course_name' => redirect('/courses/%{course_name}')
  get ':course_name/:lesson_name' => redirect('courses/%{course_name}/lessons/%{lesson_name}')
end
