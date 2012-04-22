module Refinery
  module Snapshots
    module Admin
      class SnapshotsController < ::Refinery::AdminController

        crudify :'refinery/snapshots/snapshot',
                :title_attribute => 'reaches_1', :xhr_paging => true

      end
    end
  end
end
