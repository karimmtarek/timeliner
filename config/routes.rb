Rails.application.routes.draw do

  get 'informations/show', as:'personal-info'

  devise_for :users do

  end
  #Devise: Ensure you have defined root_url to *something* in your config/routes.rb.

  devise_scope :user do
    # root "users/registrations#new"
    get "/auth/:provider/callback" => "users/sessions#create_with_oauth"
  end

end
