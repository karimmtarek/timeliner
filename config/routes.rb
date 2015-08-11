Rails.application.routes.draw do
  mount RailsEmailPreview::Engine, at: 'emails'
  root 'static_pages#index'

  devise_for :users

  resources :milestones
  resources :projects
  resources :images

  resources :users do
    resources :timelines, only: [:index, :contact]
  end

  get '/:user_id' => 'timelines#show', as: 'timeline'

  post '/contacts/:user_id', to: 'contacts#create', as: 'contact'

  post '/users/maintenance_mode', to: 'users#maintenance_mode', as: 'maintenance_mode'

  get '/timelines/:user_id/project_popup/:project_id', to: 'timelines#project_popup', as: 'project_popup'
end
