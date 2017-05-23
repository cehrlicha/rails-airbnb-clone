Rails.application.routes.draw do

    devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/results' , to: "pages#result"

  resources :users, only: [:index, :show] do
    resources :friends
  end

  #resources :friends ,except: [:show]
  get '/friends/:id' , to: "friends#product", as: 'friend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
