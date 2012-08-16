module Refinery
  class SearchController < ::ApplicationController

  	# Display search results given the query supplied
    def show
      @results = Refinery::SearchEngine.search(params[:query], params[:page])

      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

    def tagged
      return error_404 unless params[:tag].present?
      @results = Refinery::SearchEngine.search_by_tag(params[:tag])

      present(@page = Refinery::Page.find_by_link_url('/search'))

      render :show
    end
  end
end
