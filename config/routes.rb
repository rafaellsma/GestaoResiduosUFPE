Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  authenticate :user do
    resources :sediments
    root to: "home#index"
  end
  resources :laboratories
  resources :departments
  resources :centers


  authenticated :user, lambda { |u| u.admin? } do
    get 'list', to: 'users#index'
    post 'approve', to: 'users#approve'
  end

  devise_scope :user do

    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'
  end
end
