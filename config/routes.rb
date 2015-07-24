Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users

  resources :milestones
  resources :projects
  resources :images

  resources :users do
    resources :timelines, only: [:index, :contact]
  end

  get '/:user_id' => 'timelines#index', as: 'timeline'

  post '/timelines/:user_id/contact', to: 'timelines#contact', as: 'contact'

  post '/users/maintenance_mode', to: 'users#maintenance_mode', as: 'maintenance_mode'

  get '/timelines/:user_id/show_overlay/:milestone_id', to: 'timelines#show_overlay', as: 'show_overlay'
end
