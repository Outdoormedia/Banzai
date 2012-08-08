module Refinery
  module Carousels
    module Admin
      class CarouselsController < ::Refinery::AdminController

        crudify :'refinery/carousels/carousel',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
