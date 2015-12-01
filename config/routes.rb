Rails.application.routes.draw do

  resources :project_roles
  resources :project_histories
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
  get "membro_nucleo" => "infos#create_membro_nucleo"
  get "info" => "infos#index"

  resources :users
  
  post '/users/:id' => 'users#makemeadmin'
  put '/users/:id' => 'users#makemeadmin'
  patch '/users/:id' => 'users#makemeadmin'

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  
  resources :messages, only: [:new, :create]

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