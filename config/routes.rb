Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  devise_for :users

  get '/admin' => 'admin#index'
  get '/member' => 'member#index'

  get "projetoFD" => "infos#create"
  get "membro_nucleo" => "infos#create_membro_nucleo"
  get "info" => "infos#index"

  resources :users
  
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
  
  get '/about' => 'about#index', as: :about

  resources :user_statuses
  resources :activities
  resources :activity_types
  resources :activities_users

  post '/activities/:id' => 'activities#associar'

  resources :areas
  resources :sectors
  resources :knowledge_levels
  resources :knowledges
  resources :technologies
  resources :profiles
  resources :jobs
  resources :projects
  resources :project_roles
  resources :projects_users
  resources :project_statuses
  resources :project_histories
  resources :project_member_histories
  resources :messages, only: [:new, :create]

end