Refinery::PagesController.class_eval do
        
 before_filter :fetch_carousels, :only => [:home]
 before_filter :fetch_calendars, :only => [:show]
 before_filter :fetch_snapshots, :only => [:show]
 
  def fetch_carousels
    @carousel = ::Refinery::Carousels::Carousel.random
  end
 
  def fetch_calendars
    @calendars = ::Refinery::Calendars::Calendar.all
  end
   
  # Test:  see if this is all it takes to bring Nigel's Snapshots up? 
  def fetch_snapshots
    @snapshots = ::Refinery::Snapshots::Snapshot.all
  end
  
  protected :fetch_calendars
   
end
