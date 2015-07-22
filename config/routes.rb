Rails.application.routes.draw do

  devise_for :users
  resources :projects
  resources :images

  put '/milestones/import_linkedin_data', to: "milestones#import_linkedin_data", as: :import_linkedin_data

  post '/timelines/:user_id/contact', to: 'timelines#contact', as: 'contact'

  get '/timelines/:user_id/show_overlay/:milestone_id', to: 'timelines#show_overlay', as: 'show_overlay'

  resources :milestones

  root "static_pages#index"
  get 'static_pages/index'


  resources :users do
    resources :timelines, only: [:index, :contact]
  end

  get '/:user_id' => 'timelines#index', as: 'timeline'
end
