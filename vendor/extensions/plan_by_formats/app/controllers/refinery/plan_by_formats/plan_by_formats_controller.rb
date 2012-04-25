module Refinery
  module PlanByFormats
    class PlanByFormatsController < ::ApplicationController

      before_filter :find_all_plan_by_formats
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @plan_by_format in the line below:
        present(@page)
      end

      def show
        @plan_by_format = PlanByFormat.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @plan_by_format in the line below:
        present(@page)
      end

    protected

      def find_all_plan_by_formats
        @plan_by_formats = PlanByFormat.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/plan_by_formats").first
      end

    end
  end
end
