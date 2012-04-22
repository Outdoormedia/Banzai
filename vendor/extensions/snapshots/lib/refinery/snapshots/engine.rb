module Refinery
  module Snapshots
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Snapshots

      engine_name :refinery_snapshots

      initializer "register refinerycms_snapshots plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "snapshots"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.snapshots_admin_snapshots_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/snapshots/snapshot',
            :title => 'reaches_1'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Snapshots)
      end
    end
  end
end
