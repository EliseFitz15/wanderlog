Rails.application.routes.draw do
  root 'homes#index'
  get '/about' => 'homes#about'
  get '/wander' => 'homes#wander'
  resources :trips do
    resources :posts, except: [:index]
  end

  devise_for :users
end
