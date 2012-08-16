Refinery::Core::Engine.routes.draw do
  match "/search", :to => 'search#show', :as => 'search'
  match "/tagged", :to => 'search#tagged', :as => 'tagged'
end
