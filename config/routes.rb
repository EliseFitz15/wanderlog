Rails.application.routes.draw do
  root 'homes#index'
  get '/about' => 'homes#about'
  get '/wander' => 'homes#wander'
  resources :trips

  devise_for :users
end
