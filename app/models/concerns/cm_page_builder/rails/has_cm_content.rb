module CmPageBuilder
  module Rails
    module HasCmContent
      extend ActiveSupport::Concern

      included do
        has_one :page, as: :container, dependent: :destroy, class_name:"CmPageBuilder::Rails::Page"
        has_many :page_components, through: :page

        delegate :save_content, to: :page


        after_find do
          self.create_page! unless self.page
        end
      end

    end
  end
end
