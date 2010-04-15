ActionController::Routing::Routes.draw do |map| 
  map.resources :user_filters, :member => { :confirm => :get }
end