Ppuga::Application.routes.draw do
  match 'phrases/search' => 'phrases#search', :as => 'search_phrase', :via => :get
  match 'phrases/:id/publish' => 'phrases#publish', :as => 'publish_phrase', :via => :get
  match 'phrases/unpublished' => 'phrases#unpublished', :as => 'unpublished_phrases', :via => :get
  match 'phrases/unupdated' => 'phrases#unupdated', :as => 'unupdated_phrases', :via => :get
  match 'phrases/:phrase_id/revisions/:id/update' => 'revisions#change', :as => 'phrase_revision_change', :via => :get
  match 'phrases/:phrase_id/revisions/:id/dismiss' => 'revisions#dismiss', :as => 'phrase_revision_dismiss', :via => :get
  match 'sissy' => 'pages#sissy', :as => 'sissy', :via => :get
  match 'phrases/wikipedia/:title' => 'phrases#wikishow', :as => 'show_phrase_from_wikipedia', :via => :get
  root :to => 'pages#home', :as => 'homepage', :via => :get
  resources :phrases do 
    resources :revisions, :only => [:index, :show]
  end
  devise_for :authors
  resources :authors
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
end
