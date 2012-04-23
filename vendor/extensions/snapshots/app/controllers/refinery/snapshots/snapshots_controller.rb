module Refinery
  module Snapshots
    class SnapshotsController < ::ApplicationController

      before_filter :find_page

      def index
        @chart_ids = params[:id].to_s.split(",")
        @charts = @chart_ids.map do |snapshot_id|
          Snapshot.find_by_id(snapshot_id)
        end

        #@bombora = Bombora.get_active
        #@snapshots = @bombora.snapshots
        @snapshots = Snapshot.all
        respond_to do |format|
          format.html
          format.json { render json: @snapshots }
        end


        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snapshot in the line below:
        present(@snapshots)
      end

      def show
        @snapshot = Snapshot.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snapshot in the line below:
        present(@page)
      end

      protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/snapshots").first
      end

    end
  end
end
