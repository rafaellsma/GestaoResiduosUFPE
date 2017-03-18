Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :sediments
  resources :laboratories
  resources :departments
  resources :centers
  root to: "home#index"

  get 'report', to: 'reports#generate'
  post 'report', to: 'reports#create'

  devise_scope :user do
    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
