module Refinery
  module Snapshots
    class SnapshotsController < ::ApplicationController

      before_filter :find_all_snapshots
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snapshot in the line below:
        present(@page)
      end

      def show
        @snapshot = Snapshot.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snapshot in the line below:
        present(@page)
      end

    protected

      def find_all_snapshots
        @snapshots = Snapshot.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/snapshots").first
      end

    end
  end
end
