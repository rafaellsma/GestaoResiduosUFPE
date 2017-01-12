Rails.application.routes.draw do
  resources :laboratories
  resources :departments
  resources :centers
  root to: "centers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
