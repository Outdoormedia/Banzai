Refinery::MenuItem.class_eval do
  class << self
    def attributes
      [:title, :parent_id, :lft, :rgt, :depth, :url, :menu, :menu_match, :menu_location]
    end
  end
end
