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

  resources :cal_events

  resource :user_pref, :only => [:edit, :update]

  resources :users, :only => [:show, :index, :edit, :update]

  resources :splash_emails, :only => [:create]

  resource :forum, :only => [:show]

end
