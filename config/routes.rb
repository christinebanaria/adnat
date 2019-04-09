Rails.application.routes.draw do
  get 'shifts/all'

  get 'shifts/create'

  resources :organisations
  resources :shifts, only: [:all, :new]
  resources :users, only: [:home, :leaveOrganisation, :joinOrganisation]

  get 'organisations/new'

  get 'organisations/edit'

  root 'sessions#index'

  post '/new' => 'sessions#new'

  get '/register' => 'sessions#register'

  post '/login' => 'sessions#login'

  get '/logout' => 'sessions#logout'

  get '/home' => 'users#home'

  post '/newOrganisation' => 'organisations#new'

  get '/editOrganisation' => 'organisations#edit'

  get '/userLeave'=> 'users#leaveOrganisation'

  post '/updateOrganisation' => 'organisations#update'

  get '/userJoin' => 'users#joinOrganisation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
