Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  authenticate :user do
    resources :sediments
  end

  get 'report', to: 'reports#generate'
  post 'report', to: 'reports#create'

  authenticate :user, lambda { |u| u.admin? } do
    get 'register_admin', to: 'users#new_admin'
    post 'register_admin', to: 'users#create'
    get 'list', to: 'users#index'
    post 'approve', to: 'users#approve'
    resources :laboratories
    resources :departments
    resources :centers
  end

  devise_scope :user do
    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'

    authenticated :user do
      root :to => 'sediments#index'
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
