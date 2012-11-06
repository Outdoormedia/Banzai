Refinery::Core::Engine.routes.append do

  # JWM:  added routes to test if that's what's missing
  resources :snapshots
  #  match 'homes/:id/about_move' => 'homes#about_move', :as => :about_move
  match "home" => 'pages#/index'
  root :to => 'pages#/index'   
  # JWM:  end routes def -- result is no crash, leave in to see if works on prod?

  # Frontend routes
  namespace :snapshots do
    resources :snapshots, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :snapshots, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :snapshots, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
