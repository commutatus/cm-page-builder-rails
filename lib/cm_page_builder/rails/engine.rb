module CmPageBuilder
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace CmPageBuilder::Rails
    end
  end
end
