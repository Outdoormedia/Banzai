::Refinery::Page.class_eval do
  MENU_LOCATIONS = %w(know plan)

  validates :menu_location, :inclusion => {:in => MENU_LOCATIONS}, :allow_blank => true, :allow_nil => true
  attr_accessible :menu_location

  def to_refinery_menu_item
    {
      :id => id,
      :lft => lft,
      :menu_match => menu_match,
      :parent_id => parent_id,
      :rgt => rgt,
      :title => refinery_menu_title,
      :type => self.class.name,
      :url => url,
      :menu_location => menu_location
    }
  end

  class << self
    MENU_LOCATIONS.each do |location|
      define_method("in_#{location}_menu".to_sym) do
        where(:menu_location => location)
      end
    end
  end

end
