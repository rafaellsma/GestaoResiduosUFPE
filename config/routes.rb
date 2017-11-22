Rails.application.routes.draw do
  get 'about', to: 'freelancers#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  unauthenticated :user do
    root :to => 'freelancers#index', as: :unauthenticated_root
  end

  authenticate :user, lambda { |u| u.admin? } do
    root :to => 'departments#index'
    get 'register_admin', to: 'users#new_admin'
    post 'register_admin', to: 'users#create'
    get 'list', to: 'users#index'
    post 'approve', to: 'users#approve'
    resources :sediments, except: [:index]
    resources :departments
    resources :centers
    post 'spreadsheet', to: 'spreadsheets#create'
    resources :laboratories do
      resources :sediments_collects, only: [:create]
    end
  end

  authenticate :user, lambda { |u| !u.admin? } do
    resources :sediments, except: [:index]
    root :to => 'sediments#index'
  end

  devise_scope :user do
    get 'users/update_departments', to: 'users/registrations#update_departments'
    get 'users/update_laboratories', to: 'users/registrations#update_laboratories'

    authenticated :user do

      resources :laboratories, only: [:index] do
        resources :sediments, only: [:index]
      end
    end
  end
end
