module Refinery
  module PlanByFormats
    class PlanByFormat < Refinery::Core::BaseModel
      self.table_name = 'refinery_plan_by_formats'

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

    end
  end
end
