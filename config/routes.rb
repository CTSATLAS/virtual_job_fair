Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end

  namespace :admin do
    root to: 'dashboard#index'
  end
end
