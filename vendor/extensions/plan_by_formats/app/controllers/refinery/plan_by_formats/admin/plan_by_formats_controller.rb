module Refinery
  module PlanByFormats
    module Admin
      class PlanByFormatsController < ::Refinery::AdminController

        crudify :'refinery/plan_by_formats/plan_by_format',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
