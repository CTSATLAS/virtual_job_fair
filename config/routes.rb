Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'sign_up/:account_type', to: 'users/registrations#new', as: :sign_up
  end

  namespace :admin do
    root to: 'dashboard#index'
  end
end
