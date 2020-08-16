# frozen_string_literal: true

module CmPageBuilder::Rails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy the jsx component"
      source_root File.expand_path('templates', __dir__)

      def copy_jsx_component
        template "app/javascripts/components/cm_content_manager/Content.jsx"
      end
    end
  end
end
