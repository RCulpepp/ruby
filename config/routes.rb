Rails.application.routes.draw do
  get 'likes/:id' => 'likes#create'
  get '/ideas' => 'ideas#index'
  post '/ideas' => 'ideas#create'
  delete '/ideas/:id' => 'ideas#destroy'
  get '/ideas/:id' => 'ideas#show'

  post 'sessions' => 'sessions#create'

  delete 'sessions/:id' => 'sessions#destroy'

  get '/' => 'users#new'

  post '/users' => 'users#create'

  get 'users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
