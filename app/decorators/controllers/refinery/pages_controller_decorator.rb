Refinery::PagesController.class_eval do
        
 before_filter :fetch_carousels, :only => [:home]
 before_filter :fetch_snapshots, :only => [:show]
 
  def fetch_carousels
    @carousel = ::Refinery::Carousels::Carousel.random
  end
    
  # Test:  see if this brings up Nigel's Snapshots? 
  def fetch_snapshots
    @snapshots = ::Refinery::Snapshots::Snapshot.all
  end
  
   
end
