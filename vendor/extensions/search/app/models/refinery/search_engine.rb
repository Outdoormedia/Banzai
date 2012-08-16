module Refinery
  class SearchEngine

    # How many results should we show per page
    RESULTS_LIMIT = 10

    # Perform search over the specified models
    def self.search(query, page = 1)
      results = []

      Refinery.searchable_models.each do |model|
        results << model.limit(RESULTS_LIMIT).with_query(query)
      end if query.present?

      results.flatten[0..(RESULTS_LIMIT - 1)]
    end

    def self.search_by_tag(tag)
      results = []
      Refinery.taggable_models.each do |model|
        results << model.tagged_with(tag) if model.respond_to? :tagged_with
      end if tag.present?

      results.flatten
    end

  end
end
