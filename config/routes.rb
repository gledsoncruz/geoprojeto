# -*- encoding : utf-8 -*-
Geo::Application.routes.draw do


  get "aldeia_digital/index"

  get "aldeia_digital/show"

  get "pontos_onibus/index"

  get "pontos_onibus/show"

  get "pontos_onibus/_onibus"

  get "saudes/index"

  get "saudes/show"

  get "saudes/edit"

  get "saudes/_saudes"

  get "educacao/index"

  get "educacao/show"

  get "educacao/edit"

  resources :zoneamentos
  resources :bairros
  resources :ruas, :skip => :show

  match 'ruas/show/:id/:id_bairro' => 'ruas#show', :as => :ruas_show

  get "mapas/index"
  match 'mapas/show/:insc_base' => 'mapas#show'
  #match 'mapas/geolotes/:insc_base' => 'mapas#geolotes', :as => :mapas_geolotes
  match 'mapas/detail/:id' => 'mapas#detail', :as => :mapas_detail

  devise_for :users, :path_prefix => 'geo'#, :skip => [:registrations, :sessions]

  resources :users do
    get 'logged', :on => :collection
  end
=begin

  as :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post "/login" => "devise/sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end
=end

  root :to => 'home#index'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  match '*a', :to => 'errors#routing'
end
