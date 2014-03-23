Theodinproject::Application.routes.draw do
devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy', :method => :delete
    get 'sign_up' => 'devise/registrations#new'
    get 'signup' => 'devise/registrations#new'
  end
    

  root :to => 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'scheduler' => redirect('/courses')
  post 'thank_you' => 'static_pages#send_feedback'
  get 'selectable' => 'static_pages#selectable'
  post 'suggestion' => 'static_pages#suggestion'
  get 'students' => 'users#index'
  get 'about' => "static_pages#about"
  get 'faq' => "static_pages#faq"
  get 'contact' => "static_pages#contact"
  get 'contributing' => "static_pages#contributing"
  get 'studygroup' => "static_pages#studygroup"
  get 'legal' => "static_pages#legal"
  get 'cla' => "static_pages#cla"
  get 'tou' => "static_pages#tou"
  get 'press' => redirect('https://docs.google.com/document/d/1FmjfYvOsQ-syoOCzuvPXv96TCxeJAT9m-Wl7trgNZcE/pub')

  # Note: This will block any additional URL paths! Good for a while
  # while people are rediscovering /curriculum but then will need
  # to be removed to throw the usual 404 if they try /curriculum/xyz
  # get 'curriculum(/*dir(.:format))' => 'courses#index', :as => "curriculum"
  get 'curriculum' => redirect('/courses')
  # get 'curriculum(/*extra_path)' => redirect('/courses/%{extra_path}')

  get 'courses' => 'courses#index'
  get 'courses/:course_name' => redirect('/courses/%{course_name}/lessons'), :as => "course"
  get 'courses/:course_name/lessons' => 'lessons#index', :as => "lessons"
  get 'courses/:course_name/lessons/:lesson_name' => 'lessons#show', :as => "lesson"

  # Clean up routing structure
  get ':course_name' => 'lessons#index'
  get ':course_name/:lesson_name' => 'lessons#show'

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

  get "sitemap.xml" => "sitemap#index", :as => "sitemap", :defaults => { :format => "xml" }

end
