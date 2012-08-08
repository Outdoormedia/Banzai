Refinery::PagesController.class_eval do
        
 before_filter :fetch_carousels, :only => [:home]
 before_filter :fetch_calendars, :only => [:show]
 
  def fetch_carousels
    @carousel = ::Refinery::Carousels::Carousel.random
  end
 
  def fetch_calendars
    @calendars = ::Refinery::Calendars::Calendar.all
  end
   
    
  protected :fetch_calendars
   
end
