Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => { registrations: 'users' }

  get '/admin' => 'admin#index'
  get '/member' => 'member#index'
  get "projetoFD" => "infos#create"
  get "info" => "infos#index"

  resources :users
  resources :activities
  resources :activity_types
  resources :sectors
  resources :knowledge_levels
  resources :knowledges
  resources :profiles
  resources :jobs
  resources :project_statuses
  resources :projects
  resources :technologies
  resources :areas

end