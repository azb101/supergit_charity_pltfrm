Char::Application.routes.draw do

	#named
	get "sign_up" => "users#new", :as => "sign_up"
	get "log_out" => "sessions#destroy", :as => "log_out"
	get "log_in" => "sessions#new", :as => "log_in"
	
	get "profile" => "pages#profile", :as => "profile"
	get "play" => "pages#play", :as => "play"
	get "donate" => "donations#donate", :as => "donate"
	#
	
	
	
	root :to => "pages#main"	
	resources :users
	resources :sessions
	resources :donators
	
	
  post "donations/save"
  get "donations/show"
  get "donations/donate"
  get "donations/save"
  get "sessions/new"
  get "users/new"
  get "users/show"
  get "pages/main"
  get "pages/profile"
  get "pages/play"
  get "pages/people"
  get "pages/about"
  get "game/start"

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
