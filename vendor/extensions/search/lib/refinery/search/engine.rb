module Refinery
  module Search
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_search

      initializer "register refinery_search plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = 'refinery_search'
          plugin.version = 2.0
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        module ::Refinery
          class << self
            attr_accessor :searchable_models, :taggable_models

            def searchable_models
              @searchable_models = [Refinery::Page]
            end

            def taggable_models
              @taggable_models = [Refinery::Resource]
            end
          end
        end
      end
    end
  end
end
