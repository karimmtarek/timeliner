Rails.application.routes.draw do

  resources :projects

  resources :milestones

  root "static_pages#index"
  get 'static_pages/index'

  resources :accounts

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

end
