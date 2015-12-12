Rails.application.routes.draw do
  
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

  # Rota para home do membro
  get '/home' => 'home#index', as: :home

  # Rota página Sobre
  get '/about' => 'about#index', as: :about

  # Rota para associação de atividade
  post '/activities/associar/:id' => 'activities#associar', as: :associar_atividade

  # Rota para requisição de conhecimento
  post '/knowledges/requisitar/:id' => 'knowledges#requisitar', as: :requisitar_conhecimento

  # Rota para aprovação de requisição de conhecimento
  post '/knowledge_requests/aprovar/:id' => 'knowledge_requests#aprovar', as: :aprovar_requisicao

  # Rota para recusa de requisição de conhecimento
  post '/knowledge_requests/recusar/:id' => 'knowledge_requests#recusar', as: :recusar_requisicao

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
  resources :knowledges_users
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
  resources :request_histories
  resources :request_statuses
  resources :user_statuses

end