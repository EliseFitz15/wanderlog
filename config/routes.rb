Rails.application.routes.draw do
  root 'homes#index'
  get '/about' => 'homes#about'
  get '/wander' => 'homes#wander'
  resources :trips,
  only: [:index, :show, :new, :create, :edit, :update, :destroy]

  devise_for :users
end
