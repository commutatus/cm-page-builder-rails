module CmPageBuilder
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace CmPageBuilder::Rails

      config.generators do |g|
        g.template_engine :slim
        g.test_framework :rspec
      end
      # This part of the code makes sure that the main application's helper
      # methods can be accessed from the engine
      # initializer 'cm_page_builder_rails.action_controller' do |app|
      #   ActiveSupport.on_load :action_controller do
      #     helper CmPageBuilder::Rails::ApplicationHelper
      #   end
      #   # ActiveSupport.on_load(:action_controller) do
      #   #   helper ::Rails.application.routes.url_helpers
      #   # end
      # end
    end
  end
end
