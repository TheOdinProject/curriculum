Rails.application.routes.draw do
  get '/courses/web-development-101(/lessons/:id)', to: redirect('/paths/foundations')
end
