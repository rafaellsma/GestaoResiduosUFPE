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

  authenticated :user, lambda { |u| u.admin? } do
    get 'reg-admin', to: 'users#new_admin'
    post 'reg-admin', to: 'users#create'
  end

  devise_scope :user do
    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'
  end
end
