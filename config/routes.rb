Rails.application.routes.draw do
  resources :users
  resources :laboratories
  resources :departments
  resources :centers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
