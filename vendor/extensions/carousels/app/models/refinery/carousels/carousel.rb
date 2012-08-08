module Refinery
  module Carousels
    class Carousel < Refinery::Core::BaseModel
      self.table_name = 'refinery_carousels'

      attr_accessible :name, :photo_id, :blurb, :contributor, :position

      acts_as_indexed :fields => [:name, :blurb, :contributor]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
