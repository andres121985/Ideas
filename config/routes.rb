Rails.application.routes.draw do

  root 'users#new'

  get 'sessions/new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'users/new'

  get 'users/:id' => 'users#show'

  get 'user/:id/view' => 'users#view'

  post 'users' => 'users#create'

  put 'users/:id' => 'users#view'

  get 'logout' => 'sessions#destroy'

  delete 'logout' => 'sessions#destroy'

  post 'ideas' => 'ideas#create'

  get 'ideas' => 'ideas#index'

  post 'ideas' => 'ideas#create'

  get 'users/:id' => 'ideas#index'

  # delete 'users/:id' => 'users#destroy'



end
