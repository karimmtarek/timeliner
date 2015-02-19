Rails.application.routes.draw do

  root "static_pages#index"
  get 'static_pages/index'

  get 'informations/show', as: :personal_info

  devise_for :users do

  end
  #Devise: Ensure you have defined root_url to *something* in your config/routes.rb.

  devise_scope :user do
    get "/auth/:provider/callback" => "users/sessions#create_with_oauth"
  end

end
