module CmPageBuilder
  module Rails
    class ApplicationController < ::ApplicationController
      protect_from_forgery with: :exception
      layout CmPageBuilder::Rails.layout_template
      #helper ::Rails.application.routes.url_helpers
      #helper CmPageBuilder::Rails::ApplicationHelper

      def current_user
        main_app.scope.request.env['warden'].user
      end
    end
  end
end
