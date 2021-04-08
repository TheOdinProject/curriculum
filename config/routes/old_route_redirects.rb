# rubocop: disable all

# these redirects are needed while we move over to an interlaced path structure. They can be removed after the interlaced paths are out for a while.
Rails.application.routes.draw do
  # redirect old foundation path routes
  get '/courses/foundations', to: redirect('/paths/foundations/courses/foundations')
  get '/courses/foundations/lessons/:id', to: redirect('/paths/foundations/courses/foundations/lessons/%{id}')

  # redirect old rails path routes
  get '/courses/ruby-programming', to: redirect('/paths/full-stack-ruby-on-rails/courses/ruby-programming')
  get '/courses/ruby-programming/lessons/:id',
      to: redirect('/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/%{id}')

  get '/courses/databases', to: redirect('/paths/full-stack-ruby-on-rails/courses/databases')
  get '/courses/databases/lessons/:id', to: redirect('/paths/full-stack-ruby-on-rails/courses/databases/lessons/%{id}')

  get '/courses/ruby-on-rails', to: redirect('/paths/full-stack-ruby-on-rails/courses/ruby-on-rails')
  get '/courses/ruby-on-rails/lessons/:id',
      to: redirect('/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/%{id}')

  # redirect old js pathroutes
  get '/courses/nodeJS', to: redirect('/paths/full-stack-javascript/courses/nodejs')
  get '/courses/nodejs', to: redirect('/paths/full-stack-javascript/courses/nodejs')
  get '/courses/nodeJS/lessons/:id', to: redirect('/paths/full-stack-javascript/courses/nodejs/lessons/%{id}')

  # redirect old shared course routes to rails path if the user is on that path
  authenticated :user, ->(user) { user.path.title == 'Full Stack Ruby on Rails' } do
    get '/courses/javascript', to: redirect('/paths/full-stack-ruby-on-rails/courses/javascript')
    get '/courses/html-and-css', to: redirect('/paths/full-stack-ruby-on-rails/courses/html-and-css')
    get '/courses/getting-hired', to: redirect('/paths/full-stack-ruby-on-rails/courses/getting-hired')

    get '/courses/javascript/lessons/:id',
        to: redirect('/paths/full-stack-ruby-on-rails/courses/javascript/lessons/%{id}')
    get '/courses/html-and-css/lessons/:id',
        to: redirect('/paths/full-stack-ruby-on-rails/courses/html-and-css/lessons/%{id}')
    get '/courses/getting-hired/lessons/:id',
        to: redirect('/paths/full-stack-ruby-on-rails/courses/getting-hired/lessons/%{id}')
  end

  # otherwise redirect old shared course routes to the js path
  get '/courses/javascript', to: redirect('/paths/full-stack-javascript/courses/javascript')
  get '/courses/html-and-css', to: redirect('/paths/full-stack-javascript/courses/html-and-css')
  get '/courses/getting-hired', to: redirect('/paths/full-stack-javascript/courses/getting-hired')

  get '/courses/javascript/lessons/:id', to: redirect('/paths/full-stack-javascript/courses/javascript/lessons/%{id}')
  get '/courses/html-and-css/lessons/:id',
      to: redirect('/paths/full-stack-javascript/courses/html-and-css/lessons/%{id}')
  get '/courses/getting-hired/lessons/:id',
      to: redirect('/paths/full-stack-javascript/courses/getting-hired/lessons/%{id}')
end
