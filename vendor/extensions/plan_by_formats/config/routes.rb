Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :plan_by_formats do
    resources :plan_by_formats, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :plan_by_formats, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :plan_by_formats, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
