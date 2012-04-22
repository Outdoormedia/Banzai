module Refinery
  module Snapshots
    class Snapshot < Refinery::Core::BaseModel
      self.table_name = 'refinery_snapshots'      

      belongs_to :market, class_name: "Selection"
      belongs_to :demog, class_name: "Selection"
      belongs_to :format, class_name: "Selection"

      serialize :reaches_1
      serialize :reaches_2
      serialize :x_labels


      #acts_as_indexed :fields => [:reaches_1, :reaches_2, :x_labels]
      #
      #validates :reaches_1, :presence => true, :uniqueness => true
              
    end
  end
end
