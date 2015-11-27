Rails.application.routes.draw do

  resources :projects_users
  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  devise_for :users#, :controllers => { registrations: 'users', passwords: 'devise/passwords' }

  get '/admin' => 'admin#index'
  get '/member' => 'member#index'
  get "projetoFD" => "infos#create"
  get "info" => "infos#index"

  resources :users
  
  post '/users/:id' => 'users#makemeadmin'
  put '/users/:id' => 'users#makemeadmin'
  patch '/users/:id' => 'users#makemeadmin'

  resources :user_statuses
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