module Refinery
  module Calendars
    class Calendar < Refinery::Core::BaseModel
      self.table_name = 'refinery_calendars'

      attr_accessible :title, :when, :where, :sponsor, :description, :url, :position

      acts_as_indexed :fields => [:title, :where, :sponsor, :description, :url]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
