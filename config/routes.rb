Rails.application.routes.draw do

  resources :request_histories
  resources :request_statuses
  # Define a raiz para a página de login e as rotas /login e /logout
  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  # Rotas para informações de projetos e usuários
  get "info" => "infos#index"
  get "projetoFD" => "infos#create"
  get "membro_nucleo" => "infos#create_membro_nucleo"

  # Rotas para o sistema interno de mensagens
  resources :messages, only: [:new, :create]
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

  # Rotas para home do usuário
  get '/admin' => 'admin#index'
  get '/member' => 'member#index'
  
  # Rota página Sobre
  get '/about' => 'about#index', as: :about

  # Rota para associação de atividade
  post '/activities/:id' => 'activities#associar'

  # Rota para requisição de conhecimento
  post '/knowledges/:id' => 'knowledges#requisitar'

  # Rotas para usuários
  devise_for :users
  resources :users

  # Rotas para os demais CRUDs
  resources :activities
  resources :activity_types
  resources :activities_users
  resources :areas
  resources :sectors
  resources :knowledge_levels
  resources :knowledge_requests
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
  resources :user_statuses

end