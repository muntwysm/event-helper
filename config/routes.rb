ActionController::Routing::Routes.draw do |map|
  map.resources :user_sessions

  map.resources :users

  map.resources :contributions

  map.resources :events

  map.resources :locations

  map.resources :items

  map.resources :categories

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
	map.connect 'about/', :controller => 'pages', :action => 'about'
	map.connect 'help/', :controller => 'pages', :action => 'help'
	map.connect 'home/', :controller => 'pages', :action => 'home'
	map.connect 'admin/', :controller => 'pages', :action => 'admin'

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
	map.add_contribution 'events/:id/new_contribution/:req_id', :controller => 'contributions', :action => 'new'
	map.individual_contributions ':search/contributions', :controller => 'contributions', :action => 'index'
	map.individual_event_contributions ':id/contributions/:search', :controller => 'events', :action => 'show'
	map.not_needed 'contributions/:id/not_needed', :controller => 'contributions', :action => 'not_needed'
	map.make_needed 'contributions/:id/make_needed', :controller => 'contributions', :action => 'make_needed'
	map.login "login", :controller => "user_sessions", :action => "new"
	map.logout "logout", :controller => "user_sessions", :action => "destroy"

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => 'pages', :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
	map.connect '*path', :controller => 'pages', :action => 'home'
end
