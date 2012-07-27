Refinery::PagesController.class_eval do
        
 before_filter :fetch_carousels, :only => [:home]

  def fetch_carousels
    @carousel = ::Refinery::Carousels::Carousel.random
  end
  
end
