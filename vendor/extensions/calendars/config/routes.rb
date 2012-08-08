Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :calendars do
    resources :calendars, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :calendars, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :calendars, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
