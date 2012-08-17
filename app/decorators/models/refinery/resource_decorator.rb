require 'acts-as-taggable-on'

Refinery::Resource.class_eval do
  acts_as_taggable
  attr_accessible :tag_list

  class << self
    def create_resources(params)
      resources = []

      unless params.present? and params[:file].is_a?(Array)
        resources << create(params)
      else
        params[:file].each do |resource|
          resources << create({:file => resource}.merge(params.except(:file)))
        end
      end

      resources
    end
  end
end
