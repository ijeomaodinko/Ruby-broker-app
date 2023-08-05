Rails.application.routes.draw do
  resources :orders
  resources :products  do
    resources :reviews, only: [:index, :create] 
  end
  resources :categories
  resources :companies
 
    devise_for :users, path: 'api/auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end
