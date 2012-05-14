module Refinery
  module PlanByFormats
    class PlanningWeight < Refinery::Core::BaseModel
      self.table_name = 'planning_weights'
      attr_accessible :market_id, :format_id, :heavy, :medium, :light
      def self.import_csv
        self.delete_all
        require "csv"
        items = CSV::read("vendor/extensions/plan_by_formats/db/planning_weights.csv")
        fields = items.shift
        items.each do |item|
          p Selection.send(item[1])
          self.create(
              :market_id => Selection.send(item[0]).id,
              :format_id => Selection.send(item[1]).id,
          heavy: item[2],
          medium: item[3],
          light: item[4]
          )

        end
      end
    end
  end
end
