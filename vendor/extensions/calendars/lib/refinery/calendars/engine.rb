module Refinery
  module Calendars
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Calendars

      engine_name :refinery_calendars

      initializer "register refinerycms_calendars plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "calendars"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.calendars_admin_calendars_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/calendars/calendar'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Calendars)
      end
    end
  end
end
