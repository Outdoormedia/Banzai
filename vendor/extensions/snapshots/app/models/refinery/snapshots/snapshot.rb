module Refinery
  module Snapshots
    class Snapshot < Refinery::Core::BaseModel
      self.table_name = 'refinery_snapshots'      

      attr_accessible :market_sc, :demographic_sc, :format_sc, :number_of_days_1, :reaches_1, :number_of_days_2, :reaches_2, :x_labels

      belongs_to :market, class_name: "Selection"
      belongs_to :demog, class_name: "Selection"
      belongs_to :format, class_name: "Selection"

      serialize :reaches_1
      serialize :reaches_2
      serialize :x_labels

      def points
        r_1 = reaches_1
        r_2 = reaches_2

        x_labels.map do |x|
          r1 = r_1.shift
          r2 = r_2.shift
          next if r1.nil? || r2.nil?
          [x.to_s, r1.to_f.round(2), r2.to_f.round(2)]
        end.compact
      end

      def title
        "Average Reach #{demog} by Number of Signs (#{format})"
      end

      def demographic_sc=(system_code)
        self.demog = Selection.snapshot_demographics.find_by_system_code(system_code)
        return demog ? true : system_code
      end

      def market_sc=(system_code)
        self.market = Selection.markets.find_by_system_code(system_code)
        return market ? true : system_code
      end

      def format_sc=(system_code)
        self.format = Selection.planning_format.leaves.find_by_system_code(system_code)
        return format ? true : system_code
      end

      #acts_as_indexed :fields => [:reaches_1, :reaches_2, :x_labels]
      #
      #validates :reaches_1, :presence => true, :uniqueness => true
    end
  end
end
