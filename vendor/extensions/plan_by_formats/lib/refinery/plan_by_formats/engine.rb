module Refinery
  module PlanByFormats
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PlanByFormats

      engine_name :refinery_plan_by_formats

      initializer "register refinerycms_plan_by_formats plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "plan_by_formats"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.plan_by_formats_admin_plan_by_formats_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/plan_by_formats/plan_by_format',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PlanByFormats)
      end
    end
  end
end
