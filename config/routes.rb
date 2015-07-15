Rails.application.routes.draw do
  root 'homes#index'
  get '/about' => 'homes#about'
  get '/wander' => 'homes#wander'
  resources :trips do
    resources :posts, only: [:new, :create, :show, :edit, :update]
  end

  devise_for :users
end
