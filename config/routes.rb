Rails.application.routes.draw do
  get 'reservations/index'
  get 'users/index'
  get 'register' => 'rooms#register'
  post 'reservations/:room_id/create' => 'reservations#create'
  post 'login' => 'users#login'
  get 'login' => 'users#login_form'
  post 'logout' => 'users#logout'
  get '/' => "home#top"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :users
  resources :reservations
end
