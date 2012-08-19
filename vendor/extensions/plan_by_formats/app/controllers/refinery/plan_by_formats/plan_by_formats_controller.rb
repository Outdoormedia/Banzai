module Refinery
  module PlanByFormats
    class PlanByFormatsController < ::ApplicationController

      #before_filter :find_all_plan_by_formats
      before_filter :find_page

      def index
        @markets = Selection.markets.order(:position_value)
        @formats = Selection.planning_formats.order(:position_value)
        @market_names = @markets.map &:name

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @plan_by_format in the line below:
        present(@page)
      end

      def show
        @markets = Selection.markets
        @formats = Selection.planning_formats
        @planning_weights = PlanningWeight.all


        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @plan_by_format in the line below:
        present(@page)
      end

      def create
        @planning = params[:planning]
        #@planning = session[:planning_data] = params[:planning]

        @plan_by_format = PlanByFormat.new @planning
        @plan_by_format.process
        @demographics = @plan_by_format.demographics
      end

    protected

      #def find_all_plan_by_formats
      #  @plan_by_formats = PlanByFormat.order('position ASC')
      #end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/plan_by_formats").first
      end

    end
  end
end
