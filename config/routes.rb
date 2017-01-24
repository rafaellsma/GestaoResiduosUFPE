Rails.application.routes.draw do
  authenticate :user do
    resources :sediments
  end
  devise_for :users
  get 'home/index'

  resources :laboratories
  resources :departments
  resources :centers
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
