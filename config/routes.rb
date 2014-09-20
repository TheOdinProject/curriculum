Theodinproject::Application.routes.draw do
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
  get 'scheduler' => redirect('/courses')
  post 'thank_you' => 'static_pages#send_feedback'
  post 'suggestion' => 'static_pages#suggestion'
  get 'students' => 'users#index'
  get 'about' => "static_pages#about"
  get 'faq' => "static_pages#faq"
  get 'contact' => "static_pages#contact"
  get 'contributing' => "static_pages#contributing"
  get 'studygroup' => redirect('/studygroups')
  get 'legal' => "static_pages#legal"
  get 'cla' => "static_pages#cla"
  get 'tou' => "static_pages#tou"
  get 'press' => redirect('https://docs.google.com/document/d/1FmjfYvOsQ-syoOCzuvPXv96TCxeJAT9m-Wl7trgNZcE/pub')
  get 'studygroups' => "static_pages#studygroups"

  #failure route if github information returns invalid
  get '/auth/failure' => 'omniauth_callbacks#failure'


  resources :cal_events

  # This is being hidden until needed (it was needed by the scheduler
  # but that got killed but will still be useful later)
  # resource :user_pref, :only => [:edit, :update]

  resources :users, :only => [:show, :index, :edit, :update] do
    resource :contact, :only => [:new, :create]
  end

  resources :splash_emails, :only => [:create]

  resource :forum, :only => [:show]

  post 'lesson_completions' => 'lesson_completions#create'
  delete 'lesson_completions/:lesson_id' => 'lesson_completions#destroy', :as => "lesson_completion"

  # Sitemap
  get "sitemap" => "sitemap#index", :defaults => { :format => "xml" }

  # ***** COURSES AND LESSONS ROUTES *****

  get 'curriculum' => redirect('/courses')
  get 'courses' => 'courses#index'

  # Explicitly redirect deprecated routes (301)
  get 'courses/:course_name' => redirect('/%{course_name}')
  get 'courses/:course_name/lessons' => redirect('/%{course_name}')
  get 'courses/:course_name/lessons/:lesson_name' => redirect('/%{course_name}/%{lesson_name}')

  # Match all undefined routes as courses and/or lessons
  get ':course_name' => 'lessons#index', :as => "course"
  get ':course_name' => 'lessons#index', :as => "lessons"
  get ':course_name/:lesson_name' => 'lessons#show', :as => "lesson"


end

