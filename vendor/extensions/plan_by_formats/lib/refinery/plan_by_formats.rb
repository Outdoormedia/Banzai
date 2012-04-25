require 'refinerycms-core'

module Refinery
  autoload :PlanByFormatsGenerator, 'generators/refinery/plan_by_formats_generator'

  module PlanByFormats
    require 'refinery/plan_by_formats/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
