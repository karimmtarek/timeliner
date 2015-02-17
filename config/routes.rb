Rails.application.routes.draw do
  devise_for :users
  #Devise: Ensure you have defined root_url to *something* in your config/routes.rb.

  devise_scope :user do
    get "/auth/:provider/callback" => "users/sessions#create_with_oauth"
  end



end
