Refinery::Core::Engine.routes.append do

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
