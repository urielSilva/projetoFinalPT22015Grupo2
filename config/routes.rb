Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => { registrations: 'users' }
  resources :users

  # resources :admin
  get '/admin' => 'admin#index'

  # resources :member
  get '/member' => 'member#index'

  resources :sectors
  resources :knowledge_levels
  resources :knowledges
  resources :type_activities
  resources :activities
  resources :profiles
  resources :jobs
  resources :project_statuses
  resources :projects
  resources :technologies
  resources :areas

  get "projetoFD" => "infos#create"
  get "info" => "infos#index"

end