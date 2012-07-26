Refinery::PagesController.class_eval do
        
 before_filter :fetch_carousels, :only => [:home]

  def fetch_carousels
    @carousels = ::Refinery::Carousels::Carousel.order('position ASC').limit(5)
  end
  
end
