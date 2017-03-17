Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  authenticate :user do
    resources :sediments
  end
  resources :laboratories
  resources :departments
  resources :centers
  root to: "home#index"

  devise_scope :user do
    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'
  end
end
