module Kiitos
  class Engine < ::Rails::Engine
    isolate_namespace Kiitos

    config.to_prepare do
      require 'kiitos/application_controller'
      Dir.glob(Rails.root + "app/concerns/models/*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
