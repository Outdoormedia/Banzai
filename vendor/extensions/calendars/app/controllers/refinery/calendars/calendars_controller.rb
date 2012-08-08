module Refinery
  module Calendars
    class CalendarsController < ::ApplicationController

      before_filter :find_all_calendars
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @calendar in the line below:
        present(@page)
      end

      def show
        @calendar = Calendar.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @calendar in the line below:
        present(@page)
      end

    protected

      def find_all_calendars
        @calendars = Calendar.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/calendars").first
      end

    end
  end
end
