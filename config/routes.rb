Rails.application.routes.draw do

  devise_for :users
  resources :sectors
  resources :knowledge_levels
  resources :knowledges
  resources :type_activities
  resources :activities
  resources :profiles
  resources :jobs
  resources :project_statuses
  resources :projects

  


  get 'cargos' => 'jobs#index', as: :cargos
  get 'cargo/:id' => 'jobs#show', as: :cargo
  get 'mostrar_cargo/:id' => 'jobs#show', as: :mostrar_cargo
  get 'editar_cargo/:id' => 'jobs#edit', as: :editar_cargo
  get 'criar_cargo' => 'jobs#new', as: :criar_cargo

  get "/profiles" => "profiles#index"
  resources :technologies

  get 'index' => 'index#index'
  get "/profiles" => "profiles#index"
  get 'activities' => 'activities#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'index#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
