Rails.application.routes.draw do

    devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/results' , to: "pages#result"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :friends
  end

  resources :sales, only: [:index, :show] do
    resources :ratings
  end
  #resources :friends ,except: [:show]
  get '/friends/:id' , to: "friends#product", as: 'friend'

  resources :sales, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
