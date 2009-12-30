ActionController::Routing::Routes.draw do |map|
  map.resources :documents

  # regular user controller cannot create or destroy users
  map.resources :users, :except => [ :new, :create, :destroy ]  
  
  map.resources :user_sessions        

  map.logout '/logout', :controller => "user_sessions", :action => "destroy"
  map.login '/login', :controller => "user_sessions", :action => "new"
  
  map.namespace :admin do |admin|
    admin.resources :users
  end
  
  map.home '/', :controller => 'home', :action => 'index'             
end
