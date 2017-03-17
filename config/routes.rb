Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :sediments
  resources :laboratories
  resources :departments
  resources :centers
  root to: "home#index"

  authenticated :user, lambda { |u| u.admin? } do
    get 'list', to: 'users#index'
    post 'approve', to: 'users#approve'
  end

  devise_scope :user do

    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
