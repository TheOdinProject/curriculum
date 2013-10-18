Theodinproject::Application.routes.draw do

  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy', :method => :delete
  end
    

  root :to => 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'scheduler' => 'static_pages#scheduler', as: :user_root
  post 'thank_you' => 'static_pages#send_feedback'
  get 'scheduler' => 'static_pages#scheduler'
  get 'selectable' => 'static_pages#selectable'
  post 'suggestion' => 'static_pages#suggestion'
  get 'students' => 'users#index'

  get 'curriculum(/*dir(.:format))' => 'curriculum#index', :as => "curriculum"

  get 'courses' => 'courses#index'
  get 'courses/:course_name' => 'courses#show', :as => "course"
  get 'courses/:course_name/lessons' => 'lessons#index', :as => "lessons"
  get 'courses/:course_name/lessons/:lesson_name' => 'lessons#show', :as => "lesson"

  resources :cal_events

  resource :user_pref, :only => [:edit, :update]

  resources :users, :only => [:show, :index, :edit, :update] do
    resource :contact, :only => [:new, :create]
  end

  resources :splash_emails, :only => [:create]

  resource :forum, :only => [:show]

end
